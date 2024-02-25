import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:technovate/screens/authScreens/result_screen.dart';


class Prescription extends StatefulWidget {
  static const routeName = "/prescription";
  const Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> with WidgetsBindingObserver{
  bool _isPermissionGranted = false;
  late final Future<void> _future;
  CameraController? _cameraController;
  final _textRecognizer = TextRecognizer();
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _future =_requestCameraPermission();
  }
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopCamera();
    _textRecognizer.close();
    super.dispose();
  }
  void didChangeAppLifecycleState(AppLifecycleState state){
    if(_cameraController==null || !_cameraController!.value.isInitialized){
      return;
    }
    if(state== AppLifecycleState.inactive){
      _stopCamera();
    }else if(state==AppLifecycleState.resumed && _cameraController!=null && _cameraController!.value.isInitialized){
      _startCamera();
    }
  }

  Future<void> _requestCameraPermission() async {

    final status = await Permission.camera.request();

    setState(() {
      _isPermissionGranted = status==PermissionStatus.granted;
    });


  }
  void _startCamera() {
    if(_cameraController!=null){
      _cameraSelected(_cameraController!.description);
    }
  }
  void _stopCamera(){
    if(_cameraController!=null){
      _cameraController?.dispose();

    }
  }
  void _initCameraController(List<CameraDescription>cameras){
    if(_cameraController!=null){
      return;
    }
    CameraDescription? camera;
    for(var i=0;i<cameras.length;i++){
      final CameraDescription current = cameras[i];
      if(current.lensDirection==CameraLensDirection.back){
        camera=current;
        break;
      }
    }
    if(camera!=null){
      _cameraSelected(camera);

    }
  }
  Future<void> _cameraSelected(CameraDescription camera) async{
    _cameraController= CameraController(camera,ResolutionPreset.max,enableAudio: false);
    await _cameraController?.initialize();
    if(!mounted){
      return;
    }
    setState(() {

    });
  }
  Future<void> _scanImage() async{
    if(_cameraController==null )return;
    final navigator = Navigator.of(context);
    try{
      final pictureFile =await _cameraController!.takePicture();
      final file=File(pictureFile.path);
      final inputImage = InputImage.fromFile(file);
      final recognizedText = await _textRecognizer.processImage(inputImage);
      await navigator.push(MaterialPageRoute(builder: (context)=>ResultScreen(text: recognizedText.text),),);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occured when scanning text")));
    }

  }
  @override
  Widget build(BuildContext context) {
    final sk =
        ModalRoute.of(context)?.settings.arguments ;
    return FutureBuilder(
        future: _future,
        builder:(context,snapshot){
          return Stack(
              children:[
                if(_isPermissionGranted)
                  FutureBuilder<List<CameraDescription>>(
                    future: availableCameras(),
                    builder:(context,snapshot) {
                      if (snapshot.hasData) {
                        _initCameraController(snapshot.data!);
                        return Center(child: CameraPreview(_cameraController!));
                      } else {
                        return const Center(child: LinearProgressIndicator(),);
                      }
                    },
                  ),
                Scaffold(
                  appBar: AppBar(
                    title: Text("Prescription"),
                    backgroundColor: Color(0xff263077),
                  ),
                  backgroundColor: _isPermissionGranted?Colors.transparent:null,
                  body: _isPermissionGranted?
                  Column(
                    children: [
                      Expanded(
                        child: Container(

                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Center(
                            child:ElevatedButton(
                              onPressed:_scanImage,
                              child: Text('Scan text'),
                            )
                        ),
                      )
                    ],
                  ):Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Text('Camera Permision Denied',textAlign: TextAlign.center,),
                    ),
                  ),
                ),

              ]
          );

        }
    );

  }
}
