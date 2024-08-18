import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kopi_oai/screens/tampilanPetani.dart';
import 'package:kopi_oai/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/Petani': (context) =>
            // ignore: prefer_const_constructors
            Petani(), // Ganti PetaniPage dengan nama halaman yang sesuai
        // Definisikan rute lainnya di sini jika diperlukan
      },
    );
  }
}
