import 'package:flutter/material.dart';
import 'package:technovate/screens/main_screen/community_reels/components/reels_detail.dart';
import 'package:technovate/screens/main_screen/community_reels/components/reels_side_action_bar.dart';
class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("SELF CARE", style: TextStyle(color: Colors.white),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(

        scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context,index){
        return Container(
          decoration: BoxDecoration(
              border:Border.all(color: Colors.black),
              image: DecorationImage(image: NetworkImage(
                  "https://picsum.photos/id/${index +1047}/800/1000"), fit: BoxFit.cover)),
          child:  Center(child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                  begin: const Alignment(0,-0.75),
                    end: const Alignment(0,0.1)
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                      begin: const Alignment(0,-0.75),
                      end: const Alignment(0,0.1)
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                          flex: 14,
                          child: ReelsDetail()),
                      Flexible(
                           flex: 2,
                          child: ReelSideActionBar())
                    ],
                  )
                ],
              )
            ],
          )),
        );
      }),
    );
  }
}
