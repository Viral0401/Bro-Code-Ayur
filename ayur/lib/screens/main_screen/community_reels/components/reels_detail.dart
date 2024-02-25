import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ReelsDetail extends StatefulWidget {
  const ReelsDetail({super.key});

  @override
  State<ReelsDetail> createState() => _ReelsDetailState();
}

class _ReelsDetailState extends State<ReelsDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text(
              "hello - follow",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            minLeadingWidth: 0,
            horizontalTitleGap: 12,
            leading: CircleAvatar(radius: 14, child: Icon(Icons.person)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: ExpandableText(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
              style: TextStyle(
                  fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
              expandText: "more",
              collapseText: "less",
              expandOnTextTap: true,
              collapseOnTextTap: true,
              maxLines: 1,
              linkColor: Colors.grey,
            ),
          ),
          // ListTile(
          //   title: Text(
          //     "music title - original music",
          //     style:
          //     TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
          //   ),
          //   minLeadingWidth: 0,
          //   horizontalTitleGap: 12,
          //   leading: Icon(Icons.graphic_eq_outlined, size: 20,),
          // ),
          ListTile(
            title: Row(
              children: [
                Container(
                height: 20,
                width: 125,
                  child: Marquee(
                    text: 'There once was a boy who told this story about a boy:',
                    scrollAxis: Axis.horizontal,
                    velocity:10 ,
                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                  ),
              ),
                const Padding(
                  padding:  EdgeInsets.only(left: 12),
                  child: Icon(Icons.person,color: Colors.white,size: 16,),
                ),
                  const SizedBox(width: 2,),
                const Expanded(child:  Text("Tagged Person", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 13),))
              ],
            ),
            minLeadingWidth: 0,
            horizontalTitleGap: 12,
            leading: const Icon(Icons.graphic_eq_outlined, size: 20,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
