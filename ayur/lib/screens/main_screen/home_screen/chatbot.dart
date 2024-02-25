import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  ChatUser myself =ChatUser(id: "1",firstName: "Rohit");
  ChatUser bot =ChatUser(id:"2",firstName:"Maddy");
  List<ChatMessage> allMessages=[];
  List<ChatUser> typing=[];
  final ourUrl="https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyApr28BlittTQ6b8gR77Js4Wsi0571jiro";
  final headers={
    'Content-Type': 'application/json'
  };

  getData(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {

    });
    var data={"contents":[{"parts":[{"text":m.text}]}]};
    await http.post(Uri.parse(ourUrl,), headers:headers,body:jsonEncode(data)).then((value) {
      if(value.statusCode==200){
        var result =jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1=ChatMessage(user: bot, createdAt: DateTime.now(), text: result['candidates'][0]['content']['parts'][0]['text'],);
        allMessages.insert(0, m1);

      }else{
        print("error occured");
      }
    }).catchError((e){});
    typing.remove(bot);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talk To !Maddy"),
      ),
      body: DashChat(
          typingUsers: typing,
          currentUser: myself, onSend: (ChatMessage m){
        getData(m);
      }, messages: allMessages),
    );
  }
}

