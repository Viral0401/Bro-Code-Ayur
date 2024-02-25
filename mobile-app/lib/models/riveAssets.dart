import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:technovate/screens/main_screen/community_reels/blog_screen.dart';
import 'package:technovate/screens/main_screen/community_reels/reels.dart';
import 'package:technovate/screens/main_screen/community_reels/scheme_screens.dart';
import 'package:technovate/screens/main_screen/doctors_screens/doctors_screen.dart';
import 'package:technovate/screens/main_screen/donate_screen/donate_screen.dart';
import 'package:technovate/screens/main_screen/home_screen/home_screen.dart';
import 'package:technovate/screens/main_screen/profile/account_screen.dart';
import 'package:technovate/screens/main_screen/schedule_screen.dart';



class RiveAssets {
  final String artboard, stateMachineController, title, src;
  late SMIBool? input;
  final Widget pages;

  RiveAssets(this.src, this.pages,
      { required this.artboard, required this.stateMachineController, required this.title, this.input});

  set setInput(SMIBool status) {
    input = status;
  }

}

// List<RiveAssets> bottomNavs = [
//   RiveAssets("assets/RiveAssets/icons.riv", const HomeScreen(), artboard: "CHAT",
//     stateMachineController: "CHAT_Interactivity",
//     title: "Chat",),
//   RiveAssets("assets/RiveAssets/icons.riv", const DoctorScreen(), artboard: "SEARCH",
//       stateMachineController: "SEARCH_Interactivity",
//       title: "Search"),
//   RiveAssets(
//       "assets/RiveAssets/icons.riv", const HomeScreen(), artboard: "HOME",
//       stateMachineController: "HOME_interactivity",
//       title: "Home"),
//   RiveAssets("assets/RiveAssets/icons.riv", const DoctorScreen(), artboard: "BELL",
//       stateMachineController: "BELL_Interactivity",
//       title: "Notifications"),
//   RiveAssets("assets/RiveAssets/icons.riv", const HomeScreen(), artboard: "USER",
//       stateMachineController: "USER_Interactivity",
//       title: "Profile"),
// ];

List<RiveAssets> sideMenus = [
  RiveAssets("assets/images/icons.riv", const HomeScreen(), artboard: "HOME",
      stateMachineController: "HOME_interactivity",
      title: "Home"),
  RiveAssets("assets/images/icons.riv",const DonationScreen(), artboard: "SEARCH",
      stateMachineController: "SEARCH_Interactivity",
      title: "Doctors"),
  RiveAssets("assets/images/icons.riv", const ReelScreen(), artboard: "LIKE/STAR",
      stateMachineController: "STAR_Interactivity",
      title: "Medical Community"),
  RiveAssets("assets/images/icons.riv", const SchemeScreen(), artboard: "REFRESH/RELOAD",
      stateMachineController: "RELOAD_Interactivity",
      title: "Schemes"),
  RiveAssets("assets/images/icons.riv", const BlogScreen(), artboard: "AUDIO",
      stateMachineController: "AUDIO_Interactivity",
      title: "Blogs"),
];

List<RiveAssets> sideMenu2 = [
  RiveAssets("assets/images/icons.riv", HomeScreen(), artboard: "TIMER",
      stateMachineController: "TIMER_Interactivity",
      title: "History"),
  RiveAssets("assets/images/icons.riv", AccountScreen(), artboard: "BELL",
      stateMachineController: "BELL_Interactivity",
      title: "Notification"),
];

