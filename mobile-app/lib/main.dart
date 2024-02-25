import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technovate/providers/provider_state.dart';
import 'package:technovate/screens/hospital.dart';
import 'package:technovate/screens/main_screen/NavigationBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:technovate/screens/main_screen/donate_screen/donate_screen.dart';
import 'package:technovate/screens/main_screen/home_screen/medicine_generation.dart';
import 'package:technovate/screens/main_screen/map_screen.dart';
import 'package:technovate/screens/main_screen/profile/health_record.dart';
import 'package:technovate/screens/medicine_notify.dart';
import 'package:technovate/screens/splashScreen.dart';
import 'package:technovate/screens/welcome_screen.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'firebase_options.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Gemini.init(apiKey: 'AIzaSyApr28BlittTQ6b8gR77Js4Wsi0571jiro');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>MainProvider(),

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0FA47F)),
          appBarTheme: AppBarTheme(
            color: Color(0xFF0FA47F)
          ),
          useMaterial3: true,
        ),
        home: SplashScreen()),
    );
  }
}
