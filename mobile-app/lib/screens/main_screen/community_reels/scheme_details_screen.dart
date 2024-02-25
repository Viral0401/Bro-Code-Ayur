
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SchemeDetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  final String logo;
  final String url;

  const SchemeDetailScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.content,
    required this.logo,
    required this.url,
  }) : super(key: key);

  Future<void> openBrowserURL({required String url, bool inApp = false}) async {
    final Uri uri=Uri.parse(url);
    if(await canLaunchUrl(uri)){
      launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else{
      throw "cannot launch url";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffE7EFFA),
              ),
              child: Hero(
                tag: id,
                child: Image.network(
                  logo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "About",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                content,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  openBrowserURL(url: url, inApp: true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D5ED0),
                  minimumSize: const Size(350, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: const Text(
                  "Explore Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
