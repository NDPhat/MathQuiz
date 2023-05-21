import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
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
                              LoginInputField(
                                hintText: 'Email your email',
                                width: size.width * 0.8,
                                height: size.height * 0.1,
                                onChanged: (value) {},
                                hasError: false,
                                isHidden: false,
                                validateText: 'No',
                                icon: Icon(Icons.email_outlined),
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                              ),
                              LoginInputField(
                                hintText: 'Email your password',
                                width: size.width * 0.8,
                                height: size.height * 0.1,
                                onChanged: (value) {},
                                hasError: false,
                                iconRight: _obscureText
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                clickIcon: () {
                                  _toggle();
                                },
                                showValue: _obscureText,
                                isHidden: false,
                                validateText: 'No',
                                icon: const Icon(Icons.fingerprint),
                              ),
                            ],
                          ),
                        ),
                        ForgetPassWidget(
                          size: size,
                          onForget: () {},
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlocListener<LoginCubit, LoginState>(
                                  listener: (context, state) {
                                    if(state.loginsuccess==true){
                                      Navigator.pushNamed(
                                          context, Routers.homeUser);
                                    }
                                    else{
                                      print('login fail');
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: colorMainBlue,
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: () async {
                                          await context
                                              .read<LoginCubit>()
                                              .loginAppWithEmailandPass(
                                                  'huy@gmail.com', '12131');

                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                          size: 30,
                                        )),
                                  ))
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
