import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/enum/add_player_status.dart';
import 'package:math/data/model/ava_player.dart';
import 'package:math/domain/bloc/add_player/add_player_cubit.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:sizer/sizer.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../routers/navigation.dart';
import '../../widget/input_field_widget.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class AddNewGuestPlayerScreen extends StatefulWidget {
  const AddNewGuestPlayerScreen({Key? key}) : super(key: key);
  @override
  State<AddNewGuestPlayerScreen> createState() =>
      _AddNewGuestPlayerScreenState();
}

class _AddNewGuestPlayerScreenState extends State<AddNewGuestPlayerScreen> {
  List<AvaPlayer> listAva = [
    AvaPlayer(imageLink: "assets/images/player/player_0.png", accept: false),
    AvaPlayer(imageLink: "assets/images/player/player_1.png", accept: false),
    AvaPlayer(imageLink: "assets/images/player/player_2.png", accept: false),
    AvaPlayer(imageLink: "assets/images/player/player_4.png", accept: false),
    AvaPlayer(imageLink: "assets/images/player/player_5.png", accept: false),
    AvaPlayer(imageLink: "assets/images/player/player_6.png", accept: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBlueQuaternery,
        resizeToAvoidBottomInset: false,
        body: MainPageHomePG(
            onBack: () {
              Navigator.pop(context);
            },
            textNow: 'New player',
            onPressHome: () {},
            colorTextAndIcon: Colors.black,
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
                      Text('Hi',
                          style: GoogleFonts.cabin(
                              color: colorErrorPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      Text('Welcome to MATHQUIZ',
                          style: GoogleFonts.cabin(
                              color: colorErrorPrimary,
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
                        height: 6.h,
                      ),
                      SizedBox(
                        height: 13.h,
                        child: BlocBuilder<AddPlayerCubit, AddPlayerState>(
                            buildWhen: (pre, now) {
                          return pre.nameError != now.nameError;
                        }, builder: (BuildContext context, state) {
                          return InputFieldWidget(
                            hintText: 'Enter your name',
                            nameTitle: 'Your name',
                            width: 80.w,
                            height: 8.h,
                            onChanged: (value) {
                              context.read<AddPlayerCubit>().nameChanged(value);
                            },
                            validateText: state.nameError,
                            isHidden: state.nameError != "",
                            icon: const Icon(Icons.supervised_user_circle),
                          );
                        }),
                      ),
                      Text(
                        "Choose your player",
                        style: GoogleFonts.saira(
                            color: colorErrorPrimary, fontSize: 20),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 15.h,
                        width: 90.w,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: listAva.map((AvaPlayer e) {
                              return BlocBuilder<AddPlayerCubit,
                                      AddPlayerState>(
                                  builder: (BuildContext context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    int past = listAva.indexWhere(
                                        (element) => element.accept == true);
                                    setState(() {
                                      if (past >= 0) {
                                        listAva[past].accept = false;
                                      }
                                      e.accept = !e.accept;
                                    });
                                    context
                                        .read<AddPlayerCubit>()
                                        .imageChanged(e.imageLink);
                                  },
                                  child: Container(
                                    width: 12.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color: (e.accept == true)
                                            ? colorMainBlue
                                            : colorBGInput),
                                    child: Center(
                                      child: Image.asset(
                                        e.imageLink,
                                        height: 8.h,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              });
                            }).toList()),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      BlocConsumer<AddPlayerCubit, AddPlayerState>(
                          listener: (context, state) {
                        if (state.status == AddPlayerStatus.success) {
                          Navigator.pushNamed(context, Routers.homeGuest);
                        }
                      }, builder: (context, state) {
                        return RoundedButton(
                            press: () {
                              context.read<AddPlayerCubit>().clearData();
                              context
                                  .read<AddPlayerCubit>()
                                  .addPlayerToLocal(state.imageUser);
                            },
                            color: colorMainBlue,
                            width: 80.w,
                            height: 8.h,
                            child: Center(
                              child: Text(
                                "Add",
                                style: GoogleFonts.saira(
                                    color: colorSystemWhite, fontSize: 20),
                              ),
                            ));
                      }),
                    ],
                  ),
                ),
              ],
            )));
  }
}
