import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/domain/bloc/update_pass/update_pass_cubit.dart';
import 'package:math/presentation/widget/input_field_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/enum/update_pass_status.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class ChangePassWordScreen extends StatelessWidget {
  const ChangePassWordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainPageHomePG(
      colorTextAndIcon: Colors.black,
      textNow: 'update pass'.tr().toString(),
      onPressHome: () {},
      child: SingleChildScrollView(
        child: Container(
          height: 85.h,
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/image_update_pass.png',
                height: 25.h,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please enter your new password.',
                  style: s16f400ColorGreyTe,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 45.h,
                child: Column(
                  children: [
                    BlocBuilder<UpdatePassCubit, UpdatePassState>(
                        buildWhen: (pre, now) {
                      return pre.oldPassErrorMessage != now.oldPassErrorMessage;
                    }, builder: (BuildContext context, state) {
                      return InputFieldWidget(
                        hintText: 'Enter your old password',
                        width: 80.w,
                        height: 8.h,
                        nameTitle: "Password",
                        onChanged: (value) {
                          context.read<UpdatePassCubit>().oldPassChanged(value);
                        },
                        validateText: state.oldPassErrorMessage,
                        isHidden: state.oldPassErrorMessage != "",
                        icon: const Icon(Icons.fingerprint),
                      );
                    }),
                    SizedBox(
                      height: 3.h,
                    ),
                    BlocBuilder<UpdatePassCubit, UpdatePassState>(
                        buildWhen: (pre, now) {
                      return pre.passErrorMessage != now.passErrorMessage;
                    }, builder: (BuildContext context, state) {
                      return InputFieldWidget(
                        hintText: 'Enter your new password',
                        width: 80.w,
                        height: 8.h,
                        nameTitle: "Newp password",
                        onChanged: (value) {
                          context.read<UpdatePassCubit>().passChanged(value);
                        },
                        validateText: state.passErrorMessage,
                        isHidden: state.passErrorMessage != "",
                        icon: const Icon(Icons.fingerprint),
                      );
                    }),
                    SizedBox(
                      height: 3.h,
                    ),
                    BlocBuilder<UpdatePassCubit, UpdatePassState>(
                        buildWhen: (pre, now) {
                      return pre.confirmPassErrorMessage !=
                          now.confirmPassErrorMessage;
                    }, builder: (BuildContext context, state) {
                      return InputFieldWidget(
                        hintText: 'Re-enter your password',
                        width: 80.w,
                        height: 8.h,
                        nameTitle: "Re-password",
                        onChanged: (value) {
                          context
                              .read<UpdatePassCubit>()
                              .confirmPassChange(value);
                        },
                        validateText: state.confirmPassErrorMessage,
                        isHidden: state.confirmPassErrorMessage != "",
                        icon: const Icon(Icons.key),
                      );
                    }),
                  ],
                ),
              ),
              BlocConsumer<UpdatePassCubit, UpdatePassState>(
                  listener: (context, state) {
                if (state.status == UpdatePassStatus.success) {
                  Navigator.pushNamed(context, Routers.homeUser);
                }
              }, builder: (context, state) {
                return RoundedButton(
                    press: () {
                      context.read<UpdatePassCubit>().clearData();
                      context
                          .read<UpdatePassCubit>()
                          .changePassWithCredentials();
                    },
                    color: colorMainBlue,
                    width: 80.w,
                    height: 8.h,
                    child: state.status == UpdatePassStatus.onLoading
                        ? SizedBox(
                            height: 10.h,
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
        ),
      ),
    ));
  }
}
