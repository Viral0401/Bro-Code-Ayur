import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final TextEditingController _symptomsController = TextEditingController();
  String finalPrediction = "";
  String responseMessage = "";
  List<String> medicines = [];

  Future<void> makePredictionRequest() async {
    final String url = "https://8469-182-76-21-121.ngrok-free.app/final-medic";

    final response = await http.post(
      Uri.parse(url),
      body: {"input": _symptomsController.text},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        finalPrediction = data["predictions"]["final_prediction"];
        responseMessage = data["response"];
        medicines = responseMessage.split("\n");
      });
    } else {
      Fluttertoast.showToast(
        msg: "Failed to make a prediction request",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instant HealthCare Solution'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _symptomsController,
              decoration: InputDecoration(
                labelText: "Enter Symptoms (comma-separated)",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                makePredictionRequest();
              },
              child: Text("Get Medicine Prediction"),
            ),
            SizedBox(height: 16.0),
            Text("Diseases: $finalPrediction"),
            SizedBox(height: 16.0),
            Text("Treatments:"),
            Expanded(
              child: ListView.builder(
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(medicines[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
