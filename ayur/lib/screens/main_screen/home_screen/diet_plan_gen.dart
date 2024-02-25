import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class DietPlanGen extends StatefulWidget {
  const DietPlanGen({super.key});

  @override
  State<DietPlanGen> createState() => _DietPlanGenState();
}

class _DietPlanGenState extends State<DietPlanGen> {
  ChatUser myself =ChatUser(id: "1",firstName: "Rohit");
  ChatUser bot =ChatUser(id:"2",firstName:"Diety");
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
    var data={"contents":[{"parts":[{"text":"""You are a nutrition expert tasked with creating personalized meal plans for individuals. Users will provide information about their dietary preferences, restrictions, and health goals. Your goal is to generate a well-balanced meal plan that aligns with their requirements.

Please ask the users about the following:
1. Dietary preferences (e.g., vegetarian, vegan, non-vegetarian).
2. Any specific dietary restrictions or allergies.
3. Health goals (e.g., weight loss, muscle gain, maintaining overall health).
4. Preferred meal frequency (e.g., 3 meals a day, snacks in between).
5. Any specific cuisines or food types they prefer or dislike.

Consider local and easily available ingredients, and provide detailed meal plans including breakfast, lunch, dinner, and snacks. Additionally, suggest homemade recipes suitable for their preferences.

Ensure that the meal plans are practical and can be followed in their local context.
$m.text"""}]}]};
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
        title: Text("Talk To !Diety"),
      ),
      body: DashChat(
          typingUsers: typing,
          currentUser: myself, onSend: (ChatMessage m){
        getData(m);
      }, messages: allMessages),
    );
  }
}

