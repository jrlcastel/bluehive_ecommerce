// packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// local files
import 'app.dart';

Future<void> main() async {

  // widget binding recommended by bloc and firebase
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase database plugin
  await Firebase.initializeApp();

  runApp (
    const BlueHiveEcommerceApp()
  );

}


