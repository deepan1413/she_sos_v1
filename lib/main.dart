import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:she_sos_v1/app.dart';
import 'package:she_sos_v1/configs/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
