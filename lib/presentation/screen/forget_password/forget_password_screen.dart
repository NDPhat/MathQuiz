import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/domain/bloc/forget_pass/forget_pass_cubit.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:math/presentation/widget/login_input_field.dart';

import '../../../application/cons/text_style.dart';
import '../../../application/enum/foget_pass_status.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBarWidget(
            size: size,
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'Forget password',
          ),
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.05,
                bottom: size.height * 0.03,
                left: size.width * 0.05,
                right: size.width * 0.05),
            height: size.height * 0.8,
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(top: size.height * 0.043),
                child: Image.asset('assets/images/image_forget.png'),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Text(
                'Please enter your email in the field below to\nsend the reset password request.',
                style: s16f400ColorGreyTe,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Column(
                  children: [
                    BlocBuilder<ForgetPassCubit, ForgetPassState>(
                        buildWhen: (previousState, state) {
                      return previousState.emailErrorMessage !=
                          state.emailErrorMessage;
                    }, builder: (context, state) {
                      return LoginInputField(
                        hintText: 'Enter your email',
                        icon: const Icon(Icons.email_outlined),
                        onChanged: (value) {
                          context.read<ForgetPassCubit>().emailChanged(value);
                        },
                        isHidden:state.emailErrorMessage!="",
                        validateText: state.emailErrorMessage,
                        width: size.width * 0.8,
                        height: size.height * 0.1,
                      );
                    }),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    BlocConsumer<ForgetPassCubit, ForgetPassState>(
                        listener: (context, state) {
                      if (state.status == ForgetPassStatus.success) {
                        Navigator.pushNamed(context, Routers.getOTP,
                            arguments: state.email);
                      }
                    }, builder: (context, state) {
                      return RoundedButton(
                          press: () {
                            context
                                .read<ForgetPassCubit>()
                                .submitEmailForGetOTPResetPass(state.email);
                          },
                          color: colorMainBlue,
                          width: size.width * 0.8,
                          height: size.height * 0.08,
                          child: state.status == ForgetPassStatus.onLoading
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
                                  style: s20f700ColorSysWhite,
                                ));
                    })
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
