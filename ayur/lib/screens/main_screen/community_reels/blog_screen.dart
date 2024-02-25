import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';
class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xffE7EFFA),
        appBar: AppBar(

          title: const Text("Blogs"),
          centerTitle: true,
          elevation: 1,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
      ),
      body:SafeArea(
        child: Column(
          children: [
            Container(height: 500,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height:200,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network("https://images.macrumors.com/t/U9dWJ6fomqjpKkfPbAusKqDrc_g=/1600x/article-new/2023/06/top-stories-17jun2023.jpg")),
                      )),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider()),
                  const SizedBox(height: 5,),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("How technology revolutionizing healthcare", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16,),textAlign: TextAlign.center,)),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Text("With WWDC now in the rear-view mirror, we've finally had time to really dig into the new software updates and discover some of our favorite new features and changes. New hardware was of course another big focus for WWDC, and while the Vision Pro isn't co…", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w100,fontSize: 16,),textAlign: TextAlign.center,)),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
