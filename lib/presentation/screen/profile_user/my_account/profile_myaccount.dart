import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/constants.dart';
import 'package:math/application/enum/update_profile_status.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/domain/bloc/update_profile/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/main.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../../../application/cons/color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../widget/input_field_widget.dart';
import '../../../widget/scroll_data_widget.dart';
import 'package:http/http.dart' as http;

import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class UpdateProfileUserScreen extends StatefulWidget {
  const UpdateProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileUserScreen> createState() =>
      _UpdateProfileUserScreenState();
}

class _UpdateProfileUserScreenState extends State<UpdateProfileUserScreen> {
  File? _imageFile;
  String linkImage = "";
  late String deleteHash = "";
  void _setImageFileListFromFile(File? value) {
    _imageFile = value == null ? null : value;
  }

  final ImagePicker _picker = ImagePicker();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget _previewImages() {
    if (_imageFile != null) {
      return CircleAvatar(
        radius: 60,
        backgroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8), // Border radius
          child: ClipOval(
            child: Image.file(
              File(_imageFile!.path),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
        ),
      );
    } else {
      return Image.asset("assets/images/profile.png");
    }
  }

  Future<void> uploadImageToServer(String title) async {
    String? dataHash = instance.get<UserGlobal>().deleteHash;
    if (dataHash != null) {
      deletePastImage(instance.get<UserGlobal>().deleteHash!);
    }
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://api.imgur.com/3/image"));
    request.fields['title'] = title;
    request.headers["Authorization"] = " Client-ID 123454fab2d41ee";
    var pic = http.MultipartFile.fromBytes('image',
        (await File(_imageFile!.path).readAsBytes()).buffer.asInt8List(),
        filename: "ava");
    request.files.add(pic);
    var res = await request.send();
    var resData = await res.stream.toBytes();
    // lay ra link cua image de update
    String result = String.fromCharCodes(resData);
    final jsonData = json.decode(result);
    deleteHash = jsonData["data"]["deletehash"];
    linkImage = jsonData["data"]["link"];
  }

  Widget handlePreview() {
    return _previewImages();
  }

  showUpdateDoneDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'update successful'.tr()}',
      descTextStyle: s20GgBarColorMainTeal,
      btnOkOnPress: () {},
    ).show();
  }

  showUpdateFailDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'update fail'.tr()}',
      descTextStyle: s20GgBarColorMainTeal,
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> showDisplayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            headerAnimationLoop: false,
            animType: AnimType.topSlide,
            dismissOnTouchOutside: true,
            desc: '${'choose one'.tr()} ?',
            descTextStyle: s20GgBarColorMainTeal,
            btnCancelOnPress: () {
              onPick('Camera');
            },
            btnOkOnPress: () {
              onPick('Gallery');
            },
            btnOkText: "gallery".tr(),
            btnCancelText: "camera".tr())
        .show();
  }

  Future<void> _onImageButtonPressed({required BuildContext context}) async {
    if (context.mounted) {
      await showDisplayPickImageDialog(context, (String typeOfChoose) async {
        try {
          File? pickedFile;
          XFile? picked;
          if (typeOfChoose == "Gallery") {
            picked = await _picker.pickImage(
              source: ImageSource.gallery,
            );
          } else {
            picked = await _picker.pickImage(
              source: ImageSource.camera,
            );
          }
          pickedFile = File(picked!.path);
          //cropImage
          final croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile!.path,
            cropStyle: CropStyle.circle,
            compressFormat: ImageCompressFormat.jpg,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            compressQuality: 100,
          );
          setState(() {
            _setImageFileListFromFile(File(croppedFile!.path));
          });
          // ignore: empty_catches
        } catch (e) {}
      });
    }
  }

  void deletePastImage(String hashDelete) async {
    var request = http.MultipartRequest(
        "DELETE", Uri.parse("https://api.imgur.com/3/image/$hashDelete"));
    request.headers["Authorization"] = " Client-ID 123454fab2d41ee";
    request.send();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.files == null) {
          _setImageFileListFromFile(File(response.file!.path));
        } else {
          _imageFile = File(response.file!.path);
        }
      });
    }
  }

  final List<String> genders = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(
          onBack: () {
            Navigator.pushNamed(context, Routers.profileScreen);
          },
          colorTextAndIcon: Colors.black,
          textNow: 'profile'.tr().toString(),
          onPressHome: () {
            Navigator.pushNamed(context, Routers.homeUser);
          },
          iconRight: const Icon(
            LineAwesomeIcons.home,
            color: Colors.black,
          ),
          child: Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(top: 5.h, left: 2.w, right: 2.w),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // -- IMAGE with ICON
                      Stack(
                        children: [
                          CircleAvatar(
                              radius: 15.w,
                              child: FutureBuilder<void>(
                                future: retrieveLostData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<void> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                    case ConnectionState.done:
                                      return handlePreview();
                                    case ConnectionState.active:
                                      return Image.asset(
                                          "assets/images/profile.png");
                                  }
                                },
                              )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                _onImageButtonPressed(context: context);
                              },
                              child: Container(
                                width: 30,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: colorSystemYeloow),
                                child: const Row(
                                  children: [
                                    Icon(
                                      LineAwesomeIcons.retro_camera,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.nameError != now.nameError;
                      }, builder: (context, state) {
                        return InputFieldWidget(
                          width: 90.w,
                          height: 8.h,
                          controller:
                              TextEditingController(text: state.fullName),
                          hintText: 'name'.tr(),
                          nameTitle: 'your name'.tr(),
                          onChanged: (value) {
                            context
                                .read<UpdateProfileCubit>()
                                .nameChanged(value);
                          },
                          icon: const Icon(
                            LineAwesomeIcons.user,
                            color: Colors.black,
                            size: 20,
                          ),
                          isHidden: state.nameError != "",
                          validateText: state.nameError,
                        );
                      }),
                      sizedBox,
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          builder: (context, state) {
                        return InputFieldWidget(
                          controller: TextEditingController(text: state.lop),
                          readOnly: true,
                          nameTitle: 'class'.tr(),
                          hintText: 'your class'.tr(),
                          width: 90.w,
                          height: 8.h,
                          icon: const Icon(
                            LineAwesomeIcons.restroom,
                            color: Colors.black,
                            size: 20,
                          ),
                        );
                      }),
                      sizedBox,
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.sex != now.sex;
                      }, builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  const Icon(Icons.list,
                                      size: 16, color: colorMainBlue),
                                  Expanded(
                                    child: Text(
                                      'choose gender'.tr(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: colorMainBlue),
                                    ),
                                  ),
                                ],
                              ),
                              items: genders
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: colorMainBlue,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: state.sex,
                              onChanged: (value) {
                                context
                                    .read<UpdateProfileCubit>()
                                    .sexChanged(value ?? "Male");
                              },
                              buttonStyleData: ButtonStyleData(
                                width: 90.w,
                                height: 7.5.h,
                                padding: const EdgeInsets.only(
                                    left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: colorSystemWhite,
                                ),
                                elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: colorMainBlue,
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 100,
                                width: 45.w,
                                padding: null,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: colorSystemWhite,
                                ),
                                elevation: 8,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        );
                      }),
                      sizedBox,
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.phoneError != now.phoneError;
                      }, builder: (context, state) {
                        return InputFieldWidget(
                          onChanged: (value) {
                            context
                                .read<UpdateProfileCubit>()
                                .phoneChanged(value);
                          },
                          controller:
                              TextEditingController(text: state.phone),
                          width: 90.w,
                          height: 8.h,
                          typeText: TextInputType.number,
                          hintText: 'phone'.tr(),
                          nameTitle: 'your phone'.tr(),
                          icon: const Icon(
                            LineAwesomeIcons.phone,
                            color: Colors.black,
                            size: 20,
                          ),
                          isHidden: state.phoneError != "",
                          validateText: state.phoneError,
                        );
                      }),
                      SizedBox(height: 1.h),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.birthDateError != now.birthDateError ||
                            pre.birthDate != now.birthDate;
                      }, builder: (context, state) {
                        return InputFieldWidget(
                          readOnly: true,
                          width: 90.w,
                          height: 8.h,
                          hintText: "birthday".tr(),
                          nameTitle: 'your birthday'.tr(),
                          isHidden: state.birthDateError != "",
                          validateText: state.birthDateError,
                          icon: const Icon(
                            LineAwesomeIcons.birthday_cake,
                            color: Colors.black,
                            size: 20,
                          ),
                          iconRight: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25)),
                                    ),
                                    builder: (_) {
                                      return BlocProvider.value(
                                          value: BlocProvider.of<
                                              UpdateProfileCubit>(context),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 5.w,
                                              right: 5.w,
                                            ),
                                            child: SizedBox(
                                              height: 30.h,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 23.h,
                                                    child: MyScrollDatePicker(
                                                        widthScreen: 100.w,
                                                        scrollViewOptions:
                                                            const DatePickerScrollViewOptions(
                                                          year: ScrollViewDetailOptions(
                                                              margin:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10)),
                                                          month: ScrollViewDetailOptions(
                                                              margin:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10)),
                                                          day: ScrollViewDetailOptions(
                                                              margin:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10)),
                                                        ),
                                                        maximumDate:
                                                            DateTime.now(),
                                                        selectedDate:
                                                            DateTime.now(),
                                                        locale: const Locale(
                                                            'en'),
                                                        onDateTimeChanged:
                                                            (DateTime value) {
                                                          final f = DateFormat(
                                                              'yyyy-MM-dd');
                                                          context
                                                              .read<
                                                                  UpdateProfileCubit>()
                                                              .birthChanged(f
                                                                  .format(
                                                                      value)
                                                                  .toString());
                                                        }),
                                                  ),
                                                  RoundedButton(
                                                    press: () {
                                                      Navigator.pop(context);
                                                    },
                                                    color: colorMainBlue,
                                                    width: 80.w,
                                                    height: 6.h,
                                                    child: Text(
                                                      'go'.tr(),
                                                      style:
                                                          s14f500colorSysWhite,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ));
                                    });
                              },
                              icon: const Icon(Icons.calendar_month)),
                          controller:
                              TextEditingController(text: state.birthDate),
                        );
                      }),
                      sizedBox,

                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          builder: (context, state) {
                        return InputFieldWidget(
                          readOnly: true,
                          controller:
                              TextEditingController(text: state.email),
                          width: 90.w,
                          height: 8.h,
                          hintText: 'your email'.tr(),
                          nameTitle: 'email'.tr(),
                          icon: const Icon(
                            LineAwesomeIcons.mail_bulk,
                            color: Colors.black,
                            size: 20,
                          ),
                        );
                      }),
                      sizedBox,

                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.addError != now.addError;
                      }, builder: (context, state) {
                        return InputFieldWidget(
                          width: 90.w,
                          height: 8.h,
                          hintText: 'address'.tr(),
                          nameTitle: 'your address'.tr(),
                          isHidden: state.addError != "",
                          validateText: state.addError,
                          onChanged: (value) {
                            context
                                .read<UpdateProfileCubit>()
                                .addChanged(value);
                          },
                          controller:
                              TextEditingController(text: state.address),
                          icon: const Icon(
                            LineAwesomeIcons.location_arrow,
                            color: Colors.black,
                            size: 20,
                          ),
                        );
                      }),
                      sizedBox,

                      BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                          listener: (context, state) {
                        if (state.status == UpdateProfileStatus.success) {
                          showUpdateDoneDialog();
                        } else if (state.status ==
                            UpdateProfileStatus.error) {
                          showUpdateFailDialog();
                        }
                      }, builder: (context, state) {
                        return RoundedButton(
                            press: () async {
                              if (_imageFile != null) {
                                await uploadImageToServer(
                                    instance.get<UserGlobal>().fullName!);
                              }
                              context.read<UpdateProfileCubit>().clearData();
                              context
                                  .read<UpdateProfileCubit>()
                                  .updateProfileUser(
                                      linkImage, deleteHash, _imageFile);
                            },
                            color: colorSystemWhite,
                            colorBorder: colorSystemYeloow,
                            width: 80.w,
                            height: 8.h,
                            child:
                                state.status == UpdateProfileStatus.onLoading
                                    ? SizedBox(
                                        height: 10.h,
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: colorSystemYeloow,
                                            strokeWidth: 3,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        'go'.tr().toString(),
                                        style: s16f700ColorSysYel,
                                      ));
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}

@override
typedef OnPickImageCallback = void Function(String source);
