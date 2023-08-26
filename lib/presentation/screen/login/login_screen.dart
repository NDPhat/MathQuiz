import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/enum/login_status.dart';
import 'package:math/domain/bloc/login/login_cubit.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../widget/input_field_widget.dart';

class LoginUserApp extends StatefulWidget {
  const LoginUserApp({Key? key}) : super(key: key);

  @override
  State<LoginUserApp> createState() => _LoginUserApp();
}

class _LoginUserApp extends State<LoginUserApp> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future showLoginFailDialog() {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            headerAnimationLoop: false,
            animType: AnimType.topSlide,
            dismissOnTouchOutside: false,
            desc: '${'login fail'.tr()} ?',
            descTextStyle: s20GgBarColorMainTeal,
            btnCancelOnPress: () {})
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorMainBlue,
      body: MainPageHomePG(
        colorTextAndIcon: colorSystemYeloow,
        onBack: () {
          Navigator.pushNamed(context, Routers.chooseOptionUseApp);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 100.w,
                height: 35.h,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/splash.png',
                      height: 20.h,
                    ),
                    sizedBox,
                    Text('Hi Student',
                        style: GoogleFonts.cabin(
                            color: colorSystemWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    Text('sign in to continue'.tr(),
                        style: GoogleFonts.cabin(
                            color: colorSystemWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    sizedBox,
                  ],
                ),
              ),
              Container(
                height: 55.h,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                decoration: BoxDecoration(
                  color: colorSystemWhite,
                  //reusable radius,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.h),
                      topLeft: Radius.circular(10.h)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: Column(
                        children: [
                          BlocBuilder<LoginCubit, LoginState>(
                              buildWhen: (pre, now) {
                            return pre.emailError != now.emailError;
                          }, builder: (BuildContext context, state) {
                            return InputFieldWidget(
                              hintText: 'enter your email'.tr(),
                              nameTitle: 'your email'.tr(),
                              width: 80.w,
                              height: 8.h,
                              onChanged: (value) {
                                context.read<LoginCubit>().emailChanged(value);
                              },
                              validateText: state.emailError,
                              isHidden: state.emailError != "",
                              icon: const Icon(Icons.email_outlined),
                            );
                          }),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                              buildWhen: (pre, now) {
                            return pre.passError != now.passError;
                          }, builder: (BuildContext context, state) {
                            return InputFieldWidget(
                              hintText: 'enter your password'.tr(),
                              nameTitle: 'your password'.tr(),
                              width: 80.w,
                              height: 8.h,
                              onChanged: (value) {
                                context.read<LoginCubit>().passChanged(value);
                              },
                              iconRight: _obscureText
                                  ? GestureDetector(
                                      onTap: () {
                                        _toggle();
                                      },
                                      child: const Icon(Icons.visibility_off))
                                  : GestureDetector(
                                      onTap: () {
                                        _toggle();
                                      },
                                      child: const Icon(Icons.visibility)),
                              validateText: state.passError,
                              isHidden: state.passError != "",
                              showValue: _obscureText,
                              icon: const Icon(Icons.fingerprint),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 10.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ForgetPassWidget(
                            onForget: () {
                              Navigator.pushNamed(context, Routers.forgetPass);
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BlocConsumer<LoginCubit, LoginState>(
                                    listener: (context, state) {
                                  if (state.status == LoginStatus.success) {
                                    Navigator.pushNamed(
                                        context, Routers.homeUser);
                                  } else if (state.status ==
                                      LoginStatus.error) {
                                    showLoginFailDialog();
                                  }
                                }, builder: (context, state) {
                                  return CircleAvatar(
                                    radius: 50,
                                    backgroundColor: colorMainBlue,
                                    child: state.status == LoginStatus.onLoading
                                        ? SizedBox(
                                            height: 10.h,
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                color: colorSystemWhite,
                                                strokeWidth: 3,
                                              ),
                                            ),
                                          )
                                        : IconButton(
                                            color: Colors.white,
                                            onPressed: () async {
                                              context
                                                  .read<LoginCubit>()
                                                  .clearData();
                                              await context
                                                  .read<LoginCubit>()
                                                  .loginAppWithEmailAndPass();
                                            },
                                            icon: const Icon(
                                              Icons.arrow_forward,
                                              size: 30,
                                            )),
                                  );
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPassWidget extends StatelessWidget {
  const ForgetPassWidget({
    Key? key,
    required this.onForget,
  }) : super(key: key);
  final VoidCallback onForget;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 10.h,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: onForget,
          child: Text('${'forget password'.tr()} ?',
              style: const TextStyle(
                  decoration: TextDecoration.underline, color: colorMainBlue)),
        ));
  }
}
