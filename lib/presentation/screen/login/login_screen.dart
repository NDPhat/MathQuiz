import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/application/enum/login_status.dart';
import 'package:math/domain/bloc/login/login_cubit.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/login_input_field.dart';

import '../../widget/input_field.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              AppBarWidget(
                size: size,
                onBack: () {
                  Navigator.pop(context);
                },
                onSetting: () {},
                textTitle: '',
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: size.height * 0.02, right: size.width * 0.1),
                    alignment: Alignment.center,
                    width: size.width,
                    child: Image.asset(
                      "assets/images/login_main.png",
                      height: size.height * 0.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.03,
                        left: size.width * 0.1,
                        right: size.width * 0.1),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          child: const Text(
                            "WELCOME BACK",
                            style: s20f700ColorMBlue,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        SizedBox(
                          height: size.height * 0.23,
                          child: Column(
                            children: [
                              BlocBuilder<LoginCubit, LoginState>(
                                  buildWhen: (pre, now) {
                                return pre.emailError != now.emailError;
                              }, builder: (BuildContext context, state) {
                                return LoginInputField(
                                  hintText: 'Email your email',
                                  width: size.width * 0.8,
                                  height: size.height * 0.1,
                                  onChanged: (value) {
                                    context
                                        .read<LoginCubit>()
                                        .emailChanged(value);
                                  },
                                  validateText: state.emailError,
                                  isHidden: state.emailError != "",
                                  icon: Icon(Icons.email_outlined),
                                );
                              }),
                              SizedBox(
                                height: size.height * 0.025,
                              ),
                              BlocBuilder<LoginCubit, LoginState>(
                                  buildWhen: (pre, now) {
                                return pre.passError != now.passError;
                              }, builder: (BuildContext context, state) {
                                return LoginInputField(
                                  hintText: 'Email your password',
                                  width: size.width * 0.8,
                                  height: size.height * 0.1,
                                  onChanged: (value) {
                                    context
                                        .read<LoginCubit>()
                                        .passChanged(value);
                                  },
                                  iconRight: _obscureText
                                      ? GestureDetector(
                                          onTap: () {
                                            _toggle();
                                          },
                                          child:
                                              const Icon(Icons.visibility_off))
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
                        ForgetPassWidget(
                          size: size,
                          onForget: () {
                            Navigator.pushNamed(context, Routers.forgetPass);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlocConsumer<LoginCubit, LoginState>(
                                  listener: (context, state) {
                                if (state.status == LoginStatus.success) {
                                  Navigator.pushNamed(
                                      context, Routers.homeUser);
                                } else  if (state.status == LoginStatus.error){
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
                                              child: Text('LOGIN FAIL',
                                                  style: s16f700ColorError,
                                                  textAlign: TextAlign.center),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          border: Border.all(
                                                              color:
                                                                  colorSystemYeloow)),
                                                      child: const Center(
                                                        child: Text(
                                                          'BACK',
                                                          style:
                                                              s15f700ColorErrorPri,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  }),
                                            ],
                                          )));
                                }
                              }, builder: (context, state) {
                                return CircleAvatar(
                                  radius: 50,
                                  backgroundColor: colorMainBlue,
                                  child: state.status == LoginStatus.onLoading
                                      ? SizedBox(
                                          height: size.height * 0.1,
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
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.75),
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: Image.asset(
                "assets/images/login_bot.png",
                height: size.height * 0.25,
                width: size.width * 0.5,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ForgetPassWidget extends StatelessWidget {
  const ForgetPassWidget({
    Key? key,
    required this.size,
    required this.onForget,
  }) : super(key: key);

  final Size size;
  final VoidCallback onForget;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          bottom: size.height * 0.05,
        ),
        child: GestureDetector(
          onTap: onForget,
          child: const Text('Forget password ?',
              textAlign: TextAlign.right,
              style: TextStyle(
                  decoration: TextDecoration.underline, color: colorMainBlue)),
        ));
  }
}
