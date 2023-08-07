import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:math/application/enum/add_notifi_status.dart';
import 'package:math/domain/bloc/add_notifi/add_notifi_cubit.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/text_style.dart';
import '../../../../application/utils/format.dart';
import '../../../widget/box_field_container.dart';
import '../../../widget/button_custom.dart';
import '../../../widget/input_field_widget.dart';
import '../../../widget/scroll_data_widget.dart';

class AddNotifiScreen extends StatelessWidget {
  AddNotifiScreen({Key? key}) : super(key: key);
  final f = DateFormat('MM/dd/yyyy');
  final l = DateFormat('hh:mm aa');
  String startTime = DateFormat('hh:mm aa').format(DateTime.now());
  final listRemind = [
    "5 minutes early",
    "10 minutes early",
    "15 minutes early",
    "20 minutes early",
    "25 minutes early",
    "30 minutes early",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainPageHomePG(
        textNow: "",
        colorTextAndIcon: colorSystemWhite,
        onBack: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<AddNotifiCubit, AddNotifiState>(
                      buildWhen: (pre, now) {
                    return pre.titleMess != now.titleMess;
                  }, builder: (context, state) {
                    return InputFieldWidget(
                      nameTitle: "Title",
                      hintText: 'Enter title',
                      onChanged: (value) {},
                      validateText: state.titleMess,
                      isHidden: state.titleMess != "",
                      width: size.width * 0.9,
                      height: size.height * 0.12,
                    );
                  }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  BlocBuilder<AddNotifiCubit, AddNotifiState>(
                      buildWhen: (pre, now) {
                    return pre.noteMess != now.noteMess;
                  }, builder: (context, state) {
                    return InputFieldWidget(
                      hintText: 'Enter note',
                      nameTitle: "Note",
                      onChanged: (value) {},
                      validateText: state.noteMess,
                      isHidden: state.noteMess != "",
                      width: size.width * 0.9,
                      height: size.height * 0.12,
                    );
                  }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  BlocBuilder<AddNotifiCubit, AddNotifiState>(
                      buildWhen: (pre, now) {
                    return pre.dateSaveTask != now.dateSaveTask;
                  }, builder: (context, state) {
                    return BoxField(
                        hintText: state.dateSaveTask,
                        nameTitle: 'Date',
                        size: size.width,
                        icon: const Icon(Icons.calendar_month),
                        onTapped: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25)),
                            ),
                            builder: (_) {
                              return Padding(
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
                                            scrollViewOptions:
                                                const DatePickerScrollViewOptions(
                                              year: ScrollViewDetailOptions(
                                                  margin: EdgeInsets.all(10)),
                                              month: ScrollViewDetailOptions(
                                                  margin: EdgeInsets.all(10)),
                                              day: ScrollViewDetailOptions(
                                                  margin: EdgeInsets.all(10)),
                                            ),
                                            maximumDate: DateTime.now()
                                                .add(const Duration(days: 30)),
                                            selectedDate: DateTime.now(),
                                            locale: const Locale('en'),
                                            onDateTimeChanged:
                                                (DateTime value) {
                                              context
                                                  .read<AddNotifiCubit>()
                                                  .dateTimeChange(
                                                      formatDateInput
                                                          .format(value));
                                            },
                                            widthScreen: size.width * 0.8,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RoundedButton(
                                              press: () {
                                                context
                                                    .read<AddNotifiCubit>()
                                                    .emitDateTimeChange(
                                                        state.dateSaveTask);
                                                Navigator.pop(context);
                                              },
                                              color: colorMainBlue,
                                              width: size.width * 0.9,
                                              height: size.height * 0.1,
                                              child: const Text("GO"),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                            }));
                  }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<AddNotifiCubit, AddNotifiState>(
                          buildWhen: (pre, now) {
                        return pre.timeStart != now.timeStart;
                      }, builder: (context, state) {
                        return Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.02,
                            ),
                            child: BoxField(
                                hintText: state.timeStart,
                                nameTitle: 'Start time',
                                size: size.width * 0.42,
                                icon: const Icon(Icons.timer),
                                onTapped: () async {
                                  var timePic = await showTimePicker(
                                      initialEntryMode:
                                          TimePickerEntryMode.inputOnly,
                                      context: context,
                                      initialTime: TimeOfDay(
                                          hour: int.parse(
                                              state.timeStart.split(":")[0]),
                                          minute: int.parse(state.timeStart
                                              .split(":")[1]
                                              .split(" ")[0])));
                                  context
                                      .read<AddNotifiCubit>()
                                      .emitStartTimeChange((timePic ??
                                              TimeOfDay(
                                                  hour: DateTime.now().hour,
                                                  minute:
                                                      DateTime.now().minute))
                                          .format(context));
                                }));
                      }),
                      BlocBuilder<AddNotifiCubit, AddNotifiState>(
                          buildWhen: (pre, now) {
                        return pre.timeEnd != now.timeEnd;
                      }, builder: (context, state) {
                        return Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.02,
                            ),
                            child: BoxField(
                                hintText: state.timeEnd,
                                nameTitle: 'End time',
                                size: size.width * 0.42,
                                icon: const Icon(Icons.timer),
                                onTapped: () async {
                                  var timePic = await showTimePicker(
                                      initialEntryMode:
                                          TimePickerEntryMode.inputOnly,
                                      context: context,
                                      initialTime: TimeOfDay(
                                          hour: int.parse(
                                              state.timeEnd.split(":")[0]),
                                          minute: int.parse(state.timeEnd
                                              .split(":")[1]
                                              .split(" ")[0])));
                                  //compare timeEnd va timeStart
                                  if (convertTimeDayToDouble(timePic ??
                                          TimeOfDay(
                                              hour: DateTime.now().hour,
                                              minute: DateTime.now().minute)) <
                                      convertTimeDayToDouble(convertToTimeOfDay(
                                          state.timeStart))) {
                                    AlertDialog(
                                      content: const Text(
                                        "EndTime must be greater than StartTime !!",
                                        textAlign: TextAlign.center,
                                        style: s20f700ColorErrorPro,
                                      ),
                                      actions: <Widget>[
                                        RoundedButton(
                                          press: () {
                                            Navigator.pop(context);
                                          },
                                          color: colorMainBlue,
                                          width: size.width * 0.4,
                                          height: size.height * 0.08,
                                          child: const Text("BACK"),
                                        )
                                      ],
                                    );
                                    context
                                        .read<AddNotifiCubit>()
                                        .emitEndTimeChange((TimeOfDay(
                                                hour: DateTime.now().hour,
                                                minute:
                                                    DateTime.now().minute + 10))
                                            .format(context));
                                  } else {
                                    context
                                        .read<AddNotifiCubit>()
                                        .emitEndTimeChange((timePic ??
                                                TimeOfDay(
                                                    hour: DateTime.now().hour,
                                                    minute:
                                                        DateTime.now().minute))
                                            .format(context));
                                  }
                                }));
                      }),
                    ],
                  ),
                  BlocBuilder<AddNotifiCubit, AddNotifiState>(
                      buildWhen: (pre, now) {
                    return pre.remind != now.remind;
                  }, builder: (context, state) {
                    return Padding(
                        padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                        ),
                        child: BoxField(
                            hintText: state.remind,
                            nameTitle: 'Remind',
                            size: size.width,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            onTapped: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                  ),
                                  builder: (_) {
                                    return Container(
                                        height: size.height * 0.6,
                                        child: BlocProvider.value(
                                            value:
                                                BlocProvider.of<AddNotifiCubit>(
                                                    context),
                                            child: DropDownRemind(
                                              listData: listRemind,
                                              size: size,
                                            )));
                                  });
                            }));
                  }),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<AddNotifiCubit, AddNotifiState>(
                                  builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<AddNotifiCubit>()
                                        .colorChange("blue");
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: colorMainBlue,
                                      radius: 15,
                                      child: state.color == "blue"
                                          ? const Icon(
                                              (Icons.done),
                                              color: colorSystemWhite,
                                              size: 16,
                                            )
                                          : Container()),
                                );
                              }),
                              BlocBuilder<AddNotifiCubit, AddNotifiState>(
                                  buildWhen: (pre, now) {
                                return pre.color != now.color;
                              }, builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<AddNotifiCubit>()
                                        .colorChange("yellow");
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: colorSystemYeloow,
                                      radius: 15,
                                      child: state.color == "yellow"
                                          ? const Icon(
                                              (Icons.done),
                                              color: colorSystemWhite,
                                              size: 16,
                                            )
                                          : Container()),
                                );
                              }),
                              BlocBuilder<AddNotifiCubit, AddNotifiState>(
                                  builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<AddNotifiCubit>()
                                        .colorChange("red");
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: colorErrorPrimary,
                                      radius: 15,
                                      child: state.color == "red"
                                          ? const Icon(
                                              (Icons.done),
                                              color: colorSystemWhite,
                                              size: 16,
                                            )
                                          : Container()),
                                );
                              }),
                            ],
                          ),
                        ),
                        BlocListener<AddNotifiCubit, AddNotifiState>(
                            listener: (context, state) {
                              if (state.status == AddNotifiStatus.error) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => Center(
                                    child: AlertDialog(
                                      content: const Text(
                                        "ERROR FORM !!",
                                        textAlign: TextAlign.center,
                                        style: s20f700ColorErrorPro,
                                      ),
                                      actions: <Widget>[
                                        RoundedButton(
                                            press: () {
                                              Navigator.pop(context);
                                            },
                                            color: colorMainBlue,
                                            width: size.width,
                                            height: size.height * 0.08,
                                            child: Text('Back'))
                                      ],
                                    ),
                                  ),
                                );
                                context
                                    .read<AddNotifiCubit>()
                                    .clearOldDataErrorForm();
                              } else if (state.status ==
                                  AddNotifiStatus.success) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => Center(
                                    child: AlertDialog(
                                      content: const Text(
                                        "ADD DONE !!",
                                        textAlign: TextAlign.center,
                                        style: s20f700ColorMBlue,
                                      ),
                                      actions: <Widget>[
                                        RoundedButton(
                                            press: () {
                                              Navigator.pop(context);
                                            },
                                            color: colorMainBlue,
                                            width: size.width,
                                            height: size.height * 0.08,
                                            child: Text('GO'))
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                            child: RoundedButton(
                                press: () {
                                  Navigator.pop(context);
                                },
                                color: colorMainBlue,
                                width: size.width * 0.3,
                                height: size.height * 0.06,
                                child: Text('Add')))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownRemind extends StatelessWidget {
  const DropDownRemind({
    Key? key,
    required this.listData,
    required this.size,
  }) : super(key: key);

  final List<String> listData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: size.height * 0.5,
        child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.02,
                      left: size.width * 0.05,
                      right: size.width * 0.05),
                  child: BlocBuilder<AddNotifiCubit, AddNotifiState>(
                      buildWhen: (pre, now) {
                    return pre.indexRemind != now.indexRemind;
                  }, builder: (contextBL, state) {
                    return ListTile(
                        onTap: () {
                          contextBL.read<AddNotifiCubit>().remindChange(index);
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              listData[index],
                              style: s16f500ColorGreyTe,
                            ),
                            Visibility(
                                visible: index == state.indexRemind,
                                child: const Icon(
                                  Icons.check,
                                  color: colorMainTealPri,
                                ))
                          ],
                        ));
                  }));
            }),
      ),
      BlocBuilder<AddNotifiCubit, AddNotifiState>(builder: (contextBL, state) {
        return RoundedButton(
          press: () {
            contextBL
                .read<AddNotifiCubit>()
                .remindSelected(listData[state.indexRemind]);
            Navigator.pop(context);
          },
          color: colorMainBlue,
          width: size.width * 0.9,
          height: size.height * 0.08,
          child: const Text('Select'),
        );
      })
    ]);
  }
}

class BoxField extends StatelessWidget {
  String hintText;
  String nameTitle;
  double size;
  Icon icon;
  final VoidCallback onTapped;
  BoxField(
      {Key? key,
      required this.hintText,
      required this.nameTitle,
      required this.size,
      required this.icon,
      required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapped,
        child: BoxFieldContainer(
          size: size,
          nameTitle: nameTitle,
          child: Container(
            padding:
                EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0, top: 10),
            decoration: BoxDecoration(
                border: Border.all(color: colorGreyTetiary),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(hintText),
                ),
                icon
              ],
            ),
          ),
        ));
  }
}
