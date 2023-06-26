import 'dart:io';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:math/application/enum/update_profile_status.dart';
import 'package:math/domain/bloc/update_profile/update_profile_cubit.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:math/presentation/widget/login_input_field.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../../../application/cons/color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../widget/scroll_data_widget.dart';

class UpdateProfileUserScreen extends StatefulWidget {
  UpdateProfileUserScreen({
    Key? key,
  });
  @override
  State<UpdateProfileUserScreen> createState() =>
      _UpdateProfileUserScreenState();
}

class _UpdateProfileUserScreenState extends State<UpdateProfileUserScreen> {
  File? _imageFileList;
  void _setImageFileListFromFile(File? value) {
    _imageFileList = value == null ? null : value;
  }

  final ImagePicker _picker = ImagePicker();

  Widget _previewImages() {
    if (_imageFileList != null) {
      return CircleAvatar(
        radius: 60,
        backgroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8), // Border radius
          child: ClipOval(
            child: Image.file(
              File(_imageFileList!.path),
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

  Widget handlePreview() {
    return _previewImages();
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: ShapeBorder.lerp(
                const StadiumBorder(), const StadiumBorder(), 100),
            backgroundColor: colorSystemWhite,
            actions: <Widget>[
              TextButton(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: colorSystemYeloow)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        LineAwesomeIcons.envira_gallery,
                        color: Colors.black,
                        size: 30,
                      ),
                      Text('Gallery'),
                    ],
                  ),
                ),
                onPressed: () {
                  onPick('Gallery');
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: colorSystemYeloow)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          LineAwesomeIcons.retro_camera,
                          color: Colors.black,
                          size: 30,
                        ),
                        Text('Camera'),
                      ],
                    ),
                  ),
                  onPressed: () {
                    onPick('Camera');
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  Future<void> _onImageButtonPressed({required BuildContext context}) async {
    if (context.mounted) {
      await _displayPickImageDialog(context, (String typeOfChoose) async {
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
          _imageFileList = File(response.file!.path);
        }
      });
    }
  }

  final List<String> genders = ['Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            size: size,
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'Update Profile',
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: size.width * 0.02,
                    right: size.width * 0.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // -- IMAGE with ICON
                      Stack(
                        children: [
                          CircleAvatar(
                              radius: size.width * 0.15,
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
                      SizedBox(height: size.height * 0.02),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.nameError != now.nameError;
                      }, builder: (context, state) {
                        return LoginInputField(
                          width: size.width * 0.9,
                          height: size.height * 0.1,
                          controller:
                              TextEditingController(text: state.fullName),
                          hintText: 'Your name',
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
                      SizedBox(height: size.height * 0.01),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          builder: (context, state) {
                        return LoginInputField(
                          controller: TextEditingController(text: state.lop),
                          width: size.width * 0.9,
                          readOnly: true,
                          height: size.height * 0.1,
                          hintText: 'Class',
                          icon: const Icon(
                            LineAwesomeIcons.restroom,
                            color: Colors.black,
                            size: 20,
                          ),
                        );
                      }),
                      SizedBox(height: size.height * 0.01),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.sex != now.sex;
                      }, builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Icon(Icons.list,
                                      size: 16, color: colorMainBlue),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Choose gender',
                                      style: TextStyle(
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
                                width: size.width * 0.9,
                                height: size.height * 0.075,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
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
                                width: size.width * 0.45,
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
                      SizedBox(height: size.height * 0.01),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.phoneError != now.phoneError;
                      }, builder: (context, state) {
                        return LoginInputField(
                          onChanged: (value) {
                            context
                                .read<UpdateProfileCubit>()
                                .phoneChanged(value);
                          },
                          controller: TextEditingController(text: state.phone),
                          width: size.width * 0.9,
                          height: size.height * 0.1,
                          hintText: 'Your phone',
                          icon: const Icon(
                            LineAwesomeIcons.phone,
                            color: Colors.black,
                            size: 20,
                          ),
                          isHidden: state.phoneError != "",
                          validateText: state.phoneError,
                        );
                      }),
                      SizedBox(height: size.height * 0.01),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.birthDateError != now.birthDateError ||
                            pre.birthDate != now.birthDate;
                      }, builder: (context, state) {
                        return LoginInputField(
                          readOnly: true,
                          width: size.width * 0.9,
                          height: size.height * 0.1,
                          hintText: 'Your birthDate',
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
                                              left: size.width * 0.05,
                                              right: size.width * 0.05,
                                            ),
                                            child: SizedBox(
                                              height: size.height * 0.3,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: size.height * 0.23,
                                                    child: MyScrollDatePicker(
                                                        widthScreen: size.width,
                                                        scrollViewOptions:
                                                            const DatePickerScrollViewOptions(
                                                          year: ScrollViewDetailOptions(
                                                              margin: EdgeInsets
                                                                  .all(10)),
                                                          month: ScrollViewDetailOptions(
                                                              margin: EdgeInsets
                                                                  .all(10)),
                                                          day: ScrollViewDetailOptions(
                                                              margin: EdgeInsets
                                                                  .all(10)),
                                                        ),
                                                        maximumDate:
                                                            DateTime.now(),
                                                        selectedDate:
                                                            DateTime.now(),
                                                        locale:
                                                            const Locale('en'),
                                                        onDateTimeChanged:
                                                            (DateTime value) {
                                                          final f = DateFormat(
                                                              'yyyy-MM-dd');
                                                          context
                                                              .read<
                                                                  UpdateProfileCubit>()
                                                              .birthChanged(f
                                                                  .format(value)
                                                                  .toString());
                                                        }),
                                                  ),
                                                  RoundedButton(
                                                    press: () {
                                                      Navigator.pop(context);
                                                    },
                                                    color: colorMainBlue,
                                                    width: size.width * 0.8,
                                                    height: size.height * 0.06,
                                                    child: const Text(
                                                      'Done',
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
                      SizedBox(height: size.height * 0.01),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          builder: (context, state) {
                        return LoginInputField(
                          readOnly: true,
                          controller: TextEditingController(text: state.email),
                          width: size.width * 0.9,
                          height: size.height * 0.1,
                          hintText: 'Your email',
                          icon: const Icon(
                            LineAwesomeIcons.mail_bulk,
                            color: Colors.black,
                            size: 20,
                          ),
                        );
                      }),
                      SizedBox(height: size.height * 0.01),
                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                          buildWhen: (pre, now) {
                        return pre.addError != now.addError;
                      }, builder: (context, state) {
                        return LoginInputField(
                          width: size.width * 0.9,
                          height: size.height * 0.1,
                          hintText: 'Your address',
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
                      SizedBox(height: size.height * 0.01),

                      BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                          listener: (context, state) {
                        if (state.status == UpdateProfileStatus.success) {
                          showDialog(
                              context: context,
                              builder: (ctx) => Center(
                                      child: AlertDialog(
                                    shape: ShapeBorder.lerp(
                                        const StadiumBorder(),
                                        const StadiumBorder(),
                                        100),
                                    backgroundColor: colorSystemWhite,
                                    title: const Center(
                                      child: Text('UPDATE SUCCESS',
                                          style: s16f700ColorError,
                                          textAlign: TextAlign.center),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Container(
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  border: Border.all(
                                                      color:
                                                          colorSystemYeloow)),
                                              child: const Center(
                                                child: Text(
                                                  'DONE',
                                                  style: s15f700ColorErrorPri,
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  )));
                        }
                      }, builder: (context, state) {
                        return RoundedButton(
                            press: () {
                              context
                                  .read<UpdateProfileCubit>()
                                  .updateProfileUser();
                            },
                            color: colorMainBlue,
                            width: size.width * 0.8,
                            height: size.height * 0.08,
                            child: state.status == UpdateProfileStatus.onLoading
                                ? SizedBox(
                                    height: size.height * 0.1,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: colorSystemWhite,
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  )
                                : const Text(
                                    'GO',
                                    style: s16f700ColorSysWhite,
                                  ));
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@override
typedef OnPickImageCallback = void Function(String source);
