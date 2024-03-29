import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/domain/bloc/forget_pass/forget_pass_cubit.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/enum/foget_pass_status.dart';
import '../../widget/input_field_widget.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainPageHomePG(
        textNow: "forget password".tr().toString(),
        colorTextAndIcon: Colors.black,
        onPressHome: () {},
        onBack: () {
          Navigator.pushNamed(context, Routers.login);
        },
        child: Container(
          padding:
              EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w, right: 5.w),
          height: 80.h,
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 5.h),
              child: Image.asset('assets/images/image_forget.png'),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Text(
              "Please enter your email in the field below\nto send the reset password request.",
              style: s16f400ColorGreyTe,
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              children: [
                BlocBuilder<ForgetPassCubit, ForgetPassState>(
                    buildWhen: (previousState, state) {
                  return previousState.emailErrorMessage !=
                      state.emailErrorMessage;
                }, builder: (context, state) {
                  return InputFieldWidget(
                    hintText: "your email".tr(),
                    icon: const Icon(Icons.email_outlined),
                    onChanged: (value) {
                      context.read<ForgetPassCubit>().emailChanged(value);
                    },
                    isHidden: state.emailErrorMessage != "",
                    validateText: state.emailErrorMessage,
                    width: 80.w,
                    height: 8.h,
                  );
                }),
                SizedBox(
                  height: 20.h,
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
                        context.read<ForgetPassCubit>().clearData();

                        context
                            .read<ForgetPassCubit>()
                            .submitEmailForGetOTPResetPass(state.email);
                      },
                      color: colorSystemWhite,
                      colorBorder: colorSystemYeloow,
                      width: 80.w,
                      height: 8.h,
                      child: state.status == ForgetPassStatus.onLoading
                          ? SizedBox(
                              height: 8.h,
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
            )
          ]),
        ),
      ),
    );
  }
}
