import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technovate/Database/database_apis.dart';

import '../../../Database/db_user_model.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String? _im;
  List<bool> _selection = [false, false];
  bool isChecked = false;

  late Receipent receipentData;
  String _age = " ";
  String _name = " ";
  String _height = " ";
  String _weight = " ";
  String _health_details = " ";
  String _blood = " ";
  String _organs = " ";

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Donor Record'),
        centerTitle: true,
        backgroundColor: const Color(0xffE7EFFA),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      backgroundColor: const Color(0xffE7EFFA),
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: DatabaseApis.getReceipentDetails(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(
                child: SizedBox(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              final document = snapshot.data;
              if (document != null && document.exists) {
                receipentData =
                    Receipent.fromJson(document.data() as Map<String, dynamic>);
                // Now you have the data from the document in 'receipentData'
                // Do something with the data here
                return Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        Container(
                          height: 220,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.green,
                                        ),
                                        child: _im == null
                                            ? InkWell(
                                                child: const Icon(
                                                  Icons.person,
                                                  size: 40,
                                                ),
                                                onTap: () {
                                                  imagePick();
                                                },
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: InkWell(
                                                    onTap: () {
                                                      imagePick();
                                                    },
                                                    child: Image.file(
                                                      File(_im!),
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        initialValue: receipentData.userName??"No data",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                            hintText: "Enter your Name",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            )),
                                        onSaved: (val) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 8.0, right: 3, top: 2),
                                child: Divider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  initialValue: receipentData.age??"No Data Found",
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      hintText: "Enter your Age",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      )),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                    "He is great guys wants to do something in life very good guy hello world some thing sis yo"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 160,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white),
                                          child: Image.asset(
                                            "assets/images/height.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Height"),
                                            SizedBox(
                                              width: 40,
                                              height: 30,
                                              child: TextFormField(
                                                initialValue: receipentData.height??"0",
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        )),
                                                onSaved: (val) {
                                                  _height = val!.trim();
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white),
                                          child: Image.asset(
                                            "assets/images/age.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Age"),
                                            SizedBox(
                                              width: 40,
                                              height: 30,
                                              child: TextFormField(
                                                initialValue: receipentData.age??"0",
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        )),
                                                onSaved: (val) {
                                                  _age = val!.trim();
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white),
                                          child: Image.asset(
                                            "assets/images/weight.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Weight"),
                                            SizedBox(
                                              width: 40,
                                              height: 30,
                                              child: TextFormField(
                                                initialValue: receipentData.weight??"0",
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        )),
                                                onSaved: (val) {
                                                  _weight = val!.trim();
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white),
                                          child: Image.asset(
                                            "assets/images/blood.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Blood"),
                                            SizedBox(
                                              width: 40,
                                              height: 30,
                                              child: TextFormField(
                                                initialValue: receipentData.blood??"0",
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration:
                                                    const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        )),
                                                onSaved: (val) {
                                                  _blood = val!.trim();
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "liver,kidney,etc",
                                label: const Text("Organs"),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                )),
                            onSaved: (val) => _organs = val!,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.platform,
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value as bool;
                              });
                            },
                            title: Text("Do You Pledge for Organ Donation"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Would you like to detail your ",
                                  ),
                                  Text(
                                    "medical history ?",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),

                            // SizedBox(height: 20,),
                            ToggleButtons(
                              isSelected: _selection,
                              selectedColor: Colors.lightBlueAccent,
                              onPressed: (index) {
                                // setState(() {
                                //   _selection[index]=!_selection[index];
                                // });
                                setState(() {
                                  for (int buttonIndex = 0;
                                      buttonIndex < _selection.length;
                                      buttonIndex++) {
                                    if (buttonIndex == index) {
                                      _selection[buttonIndex] = true;
                                    } else {
                                      _selection[buttonIndex] = false;
                                    }
                                  }
                                });
                              },
                              children: const [
                                Icon(Icons.check_circle_outline),
                                Icon(Icons.cancel_outlined)
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        const Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Attach Legal documents here"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _selection[0] == true
                            ? Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                            "Add Your Medical details here (Preffered Point wise)")),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 300,
                                        child: TextFormField(
                                          maxLines: 200,
                                          minLines: 20,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                borderSide: const BorderSide(
                                                    color: Colors.red),
                                              )),
                                          onSaved: (val) {
                                            _health_details = val!.trim();
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              )
                            : SizedBox()
                      ]),
                );
              }
          }
          return SizedBox();
        },
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _formKey.currentState!.save();
            DatabaseApis.updateReceipentDetails(
                _age, _blood, _weight, _height, _health_details, context);
            DatabaseApis.addDonor(_organs.trim(), isChecked.toString());
            // DatabaseApis.addDonor("", consent)
          },
          label: const Text("Save Details")),
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
