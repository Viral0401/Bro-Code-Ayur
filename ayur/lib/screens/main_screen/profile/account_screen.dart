import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technovate/Database/database_apis.dart';
import 'package:technovate/screens/main_screen/profile/components/setting_component.dart';

import '../../../models/setting_component_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String? _im;
  List<SettingComponentModel> setElement=[
    SettingComponentModel(icons:Icons.call,text: 'Appointment',  color: const Color(0xffF86F77)),
    SettingComponentModel(icons:Icons.paste, text:'Online Consultation', color: const Color(0xff76C8A6)),
    SettingComponentModel(icons:CupertinoIcons.time,text: 'Reminder', color: const Color(0xff82C6E5)),
    SettingComponentModel(icons:Icons.access_alarm, text:'Medication', color: const Color(0xff126695)),
    SettingComponentModel(icons:CupertinoIcons.heart_fill, text:'My Surgery', color:const Color(0xffFFBD00)),
    SettingComponentModel(icons:Icons.medical_information, text:'Health Record', color: const Color(0xff5859CE)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC5F2F4),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(height: 100,
                  width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white
                    ),
                    child: _im == null
                        ? InkWell(
                      child: const Icon(
                        Icons.person,
                        size: 100,
                      ),
                      onTap: () {
                        imagePick();
                      },
                    )
                        : ClipRRect(


                      child: InkWell(
                          onTap: () {
                            imagePick();
                          },
                          child: Image.file(
                            File(_im!),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rohit Rai",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 27),
                      ),
                      Text(
                        "16 Year Old",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 500,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  physics:const NeverScrollableScrollPhysics() ,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2/ 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ), itemBuilder: (context,index){
                  return SettingComponent(icons: setElement[index].icons, name: setElement[index].text, color: setElement[index].color);
                }, itemCount: setElement.length,),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  selected: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  selectedColor: Colors.white,
                  selectedTileColor: Colors.white,
                  title:const  Text('Logout',style: TextStyle(color: Colors.red),),
                  trailing: const Icon(Icons.logout, color: Colors.red,),
                  onTap: (){

                    DatabaseApis.signOut(context);
                  },
                ),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      )
    );
  }
  void imagePick() async {
    ImagePicker _imagePicker = ImagePicker();
    final XFile? image =
    await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        // _im=image.path.toString();
        _im = image.path;
      });
      File capturedImage = File(_im!);
    }
  }
}
