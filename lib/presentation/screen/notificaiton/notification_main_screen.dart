import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/domain/bloc/notifi_local/notifi_cubit.dart';
import 'package:math/presentation/widget/app_bar.dart';

import '../../../application/cons/color.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class LocalNotifiMainScreen extends StatelessWidget {
  const LocalNotifiMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            size: size,
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'Notification',
          ),
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ENABLE",
                      style: s16f500ColorGreyTe,
                    ),
                    BlocBuilder<NotifiCubit, NotifiState>(
                        buildWhen: (pre, now) {
                      return pre.enable != now.enable;
                    }, builder: (BuildContext context, state) {
                      return FlutterSwitch(
                        value: state.enable,
                        onToggle: (value) {
                          context.read<NotifiCubit>().enableChanged(value);
                        },
                      );
                    }),
                  ],
                ),
                BlocBuilder<NotifiCubit, NotifiState>(buildWhen: (pre, now) {
                  return pre.enable != now.enable;
                }, builder: (BuildContext context, state) {
                  return Visibility(
                      visible: state.enable,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Container(
                            height: 1,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 2, color: colorGrayBG),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.15,
                            width: size.width,
                            child: Center(
                              child: RoundedButton(
                                  press: () async {
                                    Navigator.pushNamed(
                                        context, Routers.addNotifiScreen);
                                  },
                                  color: colorMainBlue,
                                  width: size.width * 0.8,
                                  height: size.height * 0.1,
                                  child: const Text(
                                    'CREATE',
                                    style: s30f500colorSysWhite,
                                  )),
                            ),
                          ),
                          Container(
                            height: 1,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 2, color: colorGrayBG),
                              ),
                            ),
                          ),
                          Container(
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: size.height * 0.6,
                                width: size.width * 0.9,
                              ),
                            ),
                          )
                        ],
                      ));
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
