import 'package:flutter/material.dart';
import 'package:technovate/screens/main_screen/NavigationBar.dart';
class ResultScreen extends StatefulWidget {
  final String text;
  const ResultScreen({super.key, required this.text});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OCR Demo'),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.text),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>navigationBar()));
              },child: Text("Authenticate and Proceed"),)
            ],

          ),
        )
    );
  }
}
