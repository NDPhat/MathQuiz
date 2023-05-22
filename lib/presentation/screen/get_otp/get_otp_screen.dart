import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/domain/bloc/get_otp/get_otp_cubit.dart';
import 'package:math/main.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/login_input_field.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

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

  late String _emailReset;
  @override
  void initState() {
    _emailReset = "";
    super.initState();
    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            _emailReset = prefValue.getString('emailReset') ?? "";
          })
        });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(color: colorSystemWhite),
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBarWidget(
                size: size,
                onBack: () {
                  Navigator.pop(context);
                },
                textTitle: 'GET OTP',
              ),
              SingleChildScrollView(
                child: Container(
                  height: size.height * 0.82,
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.height * 0.05,
                    bottom: size.height * 0.05,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.27,
                        child: Column(children: [
                          Container(
                            height: size.height * 0.27 * 0.9,
                            child: Column(
                              children: [
                                Image.asset(
                                    'assets/images/image_update_pass.png'),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.27 * 0.1,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Please enter the verification code.',
                              style: s16f400ColorGreyTe,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      BlocBuilder<GetOTPCubit, GetOTPState>(
                          buildWhen: (pre, now) {
                        return pre.verificationErrorMessage !=
                            now.verificationErrorMessage;
                      }, builder: (BuildContext context, state) {
                        return SizedBox(
                          height: size.height * 0.2,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                LoginInputField(
                                  onChanged: (value) {},
                                  width: size.width * 0.15,
                                  hintText: '',
                                  height: size.height * 0.1,
                                  validateText: '',
                                  isHidden: false,
                                  hasError: false,
                                ),
                                LoginInputField(
                                  onChanged: (value) {},
                                  width: size.width * 0.15,
                                  hintText: '',
                                  height: size.height * 0.1,
                                  validateText: '',
                                  isHidden: false,
                                  hasError: false,
                                ),
                                LoginInputField(
                                  onChanged: (value) {},
                                  width: size.width * 0.15,
                                  hintText: '',
                                  height: size.height * 0.1,
                                  validateText: '',
                                  isHidden: false,
                                  hasError: false,
                                ),
                                LoginInputField(
                                  onChanged: (value) {},
                                  width: size.width * 0.15,
                                  hintText: '',
                                  height: size.height * 0.1,
                                  validateText: '',
                                  isHidden: false,
                                  hasError: false,
                                ),
                                LoginInputField(
                                  onChanged: (value) {},
                                  width: size.width * 0.15,
                                  hintText: '',
                                  height: size.height * 0.1,
                                  validateText: '',
                                  isHidden: false,
                                  hasError: false,
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
                                  const Text(
                                      'Wrong verification code. Please type again.',
                                      style: s14f400ColorErrorPro)
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
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
                                          instance
                                              .get<UserAPIRepo>()
                                              .reSendOTPMAIL(email);
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
                              height: size.height * 0.02,
                            ),
                            Container(
                                width: size.width * 0.9,
                                height: 1,
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: colorBGInput)),
                                )),
                          ]),
                        );
                      }),
                      Spacer(),
                      RoundedButton(
                          press: () {},
                          color: colorMainBlue,
                          width: size.width * 0.8,
                          height: size.height * 0.08,
                          child: const Text(
                            'GO',
                            style: s20f700ColorSysWhite,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
