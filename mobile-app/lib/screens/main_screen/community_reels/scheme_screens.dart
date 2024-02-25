import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technovate/models/schemes.dart';
import 'package:technovate/screens/main_screen/community_reels/scheme_details_screen.dart';

class SchemeScreen extends StatefulWidget {
  const SchemeScreen({super.key});

  @override
  State<SchemeScreen> createState() => _SchemeScreenState();
}

class _SchemeScreenState extends State<SchemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7EFFA),
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
          child: GridView.builder(
              itemCount: schemedList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SchemeDetailScreen(
                                  id: schemedList[index].id,
                                  title: schemedList[index].title,
                                  content: schemedList[index].content,
                                  logo: schemedList[index].logo,
                                  url: schemedList[index].link)));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: Hero(
                                tag: schemedList[index].id,
                                child: CachedNetworkImage(
                                  imageUrl: schemedList[index].logo,
                                  placeholder: (context, url) =>
                                      const CircleAvatar(radius: 50,backgroundColor: Colors.grey,),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                schemedList[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
