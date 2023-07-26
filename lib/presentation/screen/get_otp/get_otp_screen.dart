import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/enum/get_otp_status.dart';
import 'package:math/domain/bloc/get_otp/get_otp_cubit.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';
import '../../widget/input_field_widget.dart';

class GetOTPScreen extends StatefulWidget {
  GetOTPScreen({Key? key}) : super(key: key);

  @override
  State<GetOTPScreen> createState() => _GetOTPScreenScreen();
}

class _GetOTPScreenScreen extends State<GetOTPScreen> {
  late Timer timer;
  bool onTap = false;
  bool _enabledResend = true;
  int _start = 60;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            onTap = false;
            _enabledResend = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _enabledResend = true;
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(color: colorSystemWhite),
          )),
          child: Column(
            children: <Widget>[
              AppBarWidget(
                onBack: () {
                  Navigator.pop(context);
                },
                textTitle: 'GET OTP',
              ),
              SingleChildScrollView(
                child: Container(
                  height: 82.h,
                  padding: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                    top: 5.h,
                    bottom: 5.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 27.h,
                        child: Column(children: [
                          Container(
                            height: 23.h,
                            child: Column(
                              children: [
                                Image.asset(
                                    'assets/images/image_update_pass.png'),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 2.h,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Please enter the verification code.',
                              style: s16f400ColorGreyTe,
                            ),
                          ),
                        ]),
                      ),
                      BlocBuilder<GetOTPCubit, GetOTPState>(
                          buildWhen: (pre, now) {
                        return pre.verificationErrorMessage !=
                            now.verificationErrorMessage;
                      }, builder: (BuildContext context, state) {
                        return SizedBox(
                          height: 30.h,
                          width: 90.w,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InputFieldWidget(
                                  onChanged: (value) {
                                    context
                                        .read<GetOTPCubit>()
                                        .number1Changed(value);
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  maxLength: 1,
                                  typeText: TextInputType.number,
                                  width: 15.w,
                                  height: 10.h,
                                ),
                                InputFieldWidget(
                                  onChanged: (value) {
                                    context
                                        .read<GetOTPCubit>()
                                        .number2Changed(value);
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  typeText: TextInputType.number,
                                  maxLength: 1,
                                  width: 15.w,
                                  height: 10.h,
                                ),
                                InputFieldWidget(
                                  onChanged: (value) {
                                    context
                                        .read<GetOTPCubit>()
                                        .number3Changed(value);
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  typeText: TextInputType.number,
                                  maxLength: 1,
                                  width: 15.w,
                                  height: 10.h,
                                ),
                                InputFieldWidget(
                                  onChanged: (value) {
                                    context
                                        .read<GetOTPCubit>()
                                        .number4Changed(value);
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  typeText: TextInputType.number,
                                  maxLength: 1,
                                  width: 15.w,
                                  height: 10.h,
                                ),
                                InputFieldWidget(
                                  maxLength: 1,
                                  onChanged: (value) {
                                    context
                                        .read<GetOTPCubit>()
                                        .number5Changed(value);
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  typeText: TextInputType.number,
                                  width: 15.w,
                                  height: 10.h,
                                ),
                              ],
                            ),
                            Visibility(
                              visible: state.verificationErrorMessage != "",
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Image.asset(
                                          "assets/images/error_validate.png")),
                                  Text(state.verificationErrorMessage,
                                      style: s14f400ColorErrorPro)
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'You did not receive the code?',
                                    style: s16f400ColorGreyTe,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (_enabledResend == true) {
                                          startTimer();
                                          setState(() {
                                            onTap = true;
                                          });
                                          context
                                              .read<GetOTPCubit>()
                                              .clearData();
                                          context
                                              .read<GetOTPCubit>()
                                              .reSendOTPCode(email);
                                          setState(
                                              () => _enabledResend = false);

                                          // Enable it after 1s.
                                        }
                                      },
                                      child: onTap
                                          ? Text(
                                              "Resend $_start",
                                              style: s14f700ColorGreyDevi,
                                            )
                                          : const Text(
                                              "Resend now",
                                              style: s14f700ColorMainTealPri,
                                            )),
                                ]),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                                width: 90.w,
                                height: 1,
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: colorBGInput)),
                                )),
                          ]),
                        );
                      }),
                      Spacer(),
                      BlocConsumer<GetOTPCubit, GetOTPState>(
                          listener: (context, state) {
                        if (state.status == GetOTPStatus.success) {
                          Navigator.pushNamed(context, Routers.updatePass,
                              arguments: email);
                        }
                      }, builder: (context, state) {
                        return RoundedButton(
                            press: () {
                              String code = state.num1.trim().toString() +
                                  state.num2.trim().toString() +
                                  state.num3.trim().toString() +
                                  state.num4.trim().toString() +
                                  state.num5.trim().toString();
                              context.read<GetOTPCubit>().clearData();
                              context
                                  .read<GetOTPCubit>()
                                  .checkOTPCode(email, code);
                            },
                            color: colorMainBlue,
                            width: 80.w,
                            height: 8.h,
                            child: state.status == GetOTPStatus.onLoading
                                ? SizedBox(
                                    height: 10.h,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: colorSystemWhite,
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'go'.tr().toString(),
                                    style: s20f700ColorSysWhite,
                                  ));
                      })
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
