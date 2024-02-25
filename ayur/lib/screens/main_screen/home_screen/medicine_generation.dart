import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedicineGeneration extends StatefulWidget {
  const MedicineGeneration({super.key});

  @override
  State<MedicineGeneration> createState() => _MedicineGenerationState();
}

class _MedicineGenerationState extends State<MedicineGeneration> {
  ChatUser myself = ChatUser(id: "1", firstName: "Rohit");
  ChatUser bot = ChatUser(id: "2", firstName: "MediRecomend");
  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];
  final ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyApr28BlittTQ6b8gR77Js4Wsi0571jiro";
  final headers = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});
    var data = {
      "contents": [
        {
          "parts": [
            {
              "text":
                  """You are a medicine suggestion expert, patients will tell you about your disease and you will suggest them the medicines
they can take to cure the disease and help them get better.
The medicines you suggest will be the exact name of the tablet that is to be taken by the patient..
Also this is for people in rural areas so also suggest homemmade remedies too, after all the tablets are listed.
Ensure that tablets are found in India.
These medicines should be listed in a python list.:${m.text}
"""
            }
          ]
        }
      ]
    };
    await http
        .post(
            Uri.parse(
              ourUrl,
            ),
            headers: headers,
            body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1 = ChatMessage(
          user: bot,
          createdAt: DateTime.now(),
          text: result['candidates'][0]['content']['parts'][0]['text'],
        );
        allMessages.insert(0, m1);
      } else {
        print("error occured");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine Chatbot"),
      ),
      body: DashChat(
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m) {
            getData(m);
          },
          messages: allMessages),
    );
  }
}
