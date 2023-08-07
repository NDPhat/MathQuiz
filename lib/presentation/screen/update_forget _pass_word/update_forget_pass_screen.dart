import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/model/user_global.dart';

import 'package:math/domain/bloc/update_pass/update_pass_cubit.dart';
import 'package:math/main.dart';
import 'package:math/presentation/widget/input_field_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/enum/update_pass_status.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class UpdateForgetPasswordScreen extends StatelessWidget {
  const UpdateForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = (ModalRoute.of(context)!.settings.arguments as String?) ??
        instance.get<UserGlobal>().email!;
    return Scaffold(
        body: MainPageHomePG(
      onBack: () {
        Navigator.pop(context);
      },
      colorTextAndIcon: Colors.black,
      textNow: 'update password'.tr().toString(),
      onPressHome: () {},
      child: SingleChildScrollView(
        child: Container(
          height: 85.h,
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            top: 5.h,
            bottom: 5.h,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/image_update_pass.png',
                height: 25.h,
              ),
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'change your password.'.tr(),
                  style: s16f400ColorGreyTe,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 35.h,
                child: Column(
                  children: [
                    BlocBuilder<UpdatePassCubit, UpdatePassState>(
                        buildWhen: (pre, now) {
                      return pre.passErrorMessage != now.passErrorMessage;
                    }, builder: (BuildContext context, state) {
                      return InputFieldWidget(
                        hintText: 'enter your password'.tr(),
                        width: 80.w,
                        height: 8.h,
                        nameTitle: "your new password".tr(),
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
                        hintText: 're-enter your password'.tr(),
                        width: 80.w,
                        height: 8.h,
                        nameTitle: "your re-password".tr(),
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
                          .updatePassWithCredentials(email);
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
                        :  Text(
                            'go'.tr(),
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
