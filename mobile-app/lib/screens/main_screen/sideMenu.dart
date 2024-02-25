
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rive/rive.dart';

import '../../helpers/rive_utils.dart';
import '../../models/riveAssets.dart';
import '../../widgets/InfoCard.dart';
import '../../widgets/sideMenuTile.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAssets selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: 270,
          height: double.infinity,
          color: const Color(0xFF0FA47F),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoCard(
                  name: "Rohit Rai",
                  profession: "Indian",
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 32,
                    bottom: 16,
                  ),
                  child: Text(
                    "Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sideMenus.map((menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                    RiveUtils.getRiveController(artboard,
                        stateMachineName: menu.stateMachineController);
                    menu.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>menu.pages));
                  },
                  isActive: selectedMenu == menu ? true : false,
                )),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 32,
                    bottom: 16,
                  ),
                  child: Text(
                    "History".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sideMenu2.map((menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                    RiveUtils.getRiveController(artboard,
                        stateMachineName: menu.stateMachineController);
                    menu.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu ? true : false,
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
