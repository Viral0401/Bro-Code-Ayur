import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selectedIndex;
  const BottomNavItem({super.key, required this.icon, required this.text, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return
        AnimatedContainer(
            duration:const  Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: selectedIndex?Colors.blue:Colors.transparent
            ),
            child: IconButton(onPressed: (){}, icon: Icon(icon)));

  }
}
