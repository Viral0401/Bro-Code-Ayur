import 'package:flutter/material.dart';

class Helpers {
  static void showProgressBar(BuildContext context) {
    showDialog(context: context,
        builder: (_) => const Center(child: CircularProgressIndicator()));
  }

  static void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,));
  }
}