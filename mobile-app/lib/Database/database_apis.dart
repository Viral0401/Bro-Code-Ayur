import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:technovate/Database/db_donor_model.dart';
import 'package:technovate/Database/db_user_model.dart';
import 'package:technovate/screens/authScreens/ocr_text.dart';
import 'package:technovate/screens/main_screen/NavigationBar.dart';
import 'package:technovate/screens/welcome_screen.dart';

import '../helper/helper_functions.dart';

class DatabaseApis {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static User? user = firebaseAuth.currentUser;
  late Donor donor;

  static void createUser(String email, String userName, String password,
      String phoneNumber, BuildContext context) {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      user = value.user!;
      addUser(Receipent(
          image:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
          userName: userName,
          age: " ",
          email: email,
          confirmPassword: password,
          phoneNumber: phoneNumber,
          receipent_id: user!.uid,
          blood: " ",
          weight: " ",
          height: " ",
          health_details: " ",
          organ: " ",
          consent: " "));
      Navigator.pop(context);
      Helpers.showSnackBar(context, "Registered Succesfully", Colors.green);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Prescription()));
    }).catchError((error) {
      Navigator.pop(context);
      Helpers.showSnackBar(context, error.toString(), Colors.red);
    });
  }

  static void addUser(Receipent receipent) async {
    await firestore
        .collection('Receipent')
        .doc(receipent.receipent_id)
        .set(receipent.toJson());
  }

  static void loginUser(String email, String password, BuildContext context) {
    Helpers.showProgressBar(context);
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      Helpers.showSnackBar(context, "Login Succesful", Colors.green);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const navigationBar()));
    }).onError((error, stackTrace) {
      Navigator.pop(context);
      Helpers.showSnackBar(context, error.toString(), Colors.red);
    });
  }

  static void signOut(BuildContext context) {
    firebaseAuth.signOut().then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
    });
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getReceipentDetails() {
    return firestore.collection('Receipent').doc(user!.uid).snapshots();
  }

  static void updateReceipentDetails(String age, String blood, String weight,
      String height, String health_details, BuildContext context) {
    firestore.collection('Receipent').doc(user!.uid).update({
      'age': age,
      'blood': blood,
      'weight': weight,
      'height': height,
      'health_details': health_details
    }).then((value) {
      Helpers.showSnackBar(context, "Details saved", Colors.green);
    });
  }

  static void addDonor(String organs, String consent) async {
    await firestore.collection('Receipent').doc(user!.uid).update({
      'organ': organs,
      'consent': consent,
    });
  }

  static void request(bool val, Receipent receipent, BuildContext context) async {
    await firestore.collection('Hospitals').doc(receipent.receipent_id).set({
      ' image':
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      'userName': receipent.userName,
      "age": receipent.age,
      "email": receipent.email,
      "confirmPassword": receipent.confirmPassword,
      'phoneNumber': receipent.phoneNumber,
      "receipent_id": user!.uid,
      'age': receipent.age,
      'blood': receipent.blood,
      'weight': receipent.weight,
      'height': receipent.height,
      'health_details': receipent.health_details,
      'organ': receipent.organ,
      'consent': receipent.consent,
      'request':val,
    }).then((value) {
      Helpers.showSnackBar(context, "You will get notified once request accepted", Colors.green);
    });
  }
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getHospitalRequestDetails() {
    return firestore.collection('Hospitals').doc(user!.uid).snapshots();
  }
  static void sendSOS(BuildContext context){
    firestore.collection('NotificationsHospitals').doc(user!.uid).set({'Hospital Name':"Mukund Hospital",'Urgency':"${user!.uid} in emergency","Hospital_id":234}).then((value){
      Helpers.showSnackBar(context, "Urgent Alert Sent to hospitals", Colors.green);
    });
  }


}
