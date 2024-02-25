import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:technovate/screens/main_screen/map_screen.dart';
import 'package:technovate/screens/main_screen/profile/account_screen.dart';
import 'package:technovate/screens/main_screen/doctors_screens/doctors_screen.dart';
import 'package:technovate/screens/main_screen/home_screen/home_screen.dart';
import 'package:technovate/screens/main_screen/schedule_screen.dart';
import 'package:technovate/screens/main_screen/sideMenu.dart';
import 'package:technovate/widgets/bottomNavbarItem.dart';
class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
    int selectedIndex=0;
    final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

   List<Widget> pages=[
     const HomeScreen(),
     const DoctorScreen(),
     const MapScreen(),
     const AccountScreen()
   ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            pages[selectedIndex],
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu), // Add the drawer icon here
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),),
          ],
        ),
      ),
      bottomNavigationBar:Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: GNav(
            backgroundColor: Colors.white70,
              padding: const EdgeInsets.all(7),
              gap: 10,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: const Color(0xFF0FA47F),
              tabMargin: const EdgeInsets.only(bottom: 10),
              tabBorderRadius: 16,
              onTabChange: (index){
              setState(() {
                selectedIndex=index;
              });
              },
              selectedIndex: selectedIndex,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              tabs: const [
            GButton(icon:Icons.home, text: "Home",iconSize: 26, ),
            GButton(icon:Icons.people_alt, text: "Doctor",iconSize: 26, ),
            GButton(icon:Icons.paste, text: "Schedule", iconSize: 26,),
            GButton(icon:CupertinoIcons.person, text: "Account",iconSize: 26, ),
          ]),
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
