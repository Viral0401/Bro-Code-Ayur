import 'package:flutter/material.dart';
class ReelSideActionBar extends StatefulWidget {
  const ReelSideActionBar({super.key});

  @override
  State<ReelSideActionBar> createState() => _ReelSideActionBarState();
}

class _ReelSideActionBarState extends State<ReelSideActionBar> {
  final double _iconSize=32;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline, size: _iconSize,color: Colors.white,)),
          const Text("1.34K", style: TextStyle(color: Colors.white,fontSize: 10, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline, size: _iconSize,color: Colors.white,)),
          const Text("22", style: TextStyle(color: Colors.white,fontSize: 10, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.send_outlined, size: _iconSize,color: Colors.white,)),
          const SizedBox(height: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz, size: _iconSize,color: Colors.white,)),
          const SizedBox(height: 10,),
          Container(height: 30,width: 30,decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(8)),child: const Icon(Icons.person),),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
