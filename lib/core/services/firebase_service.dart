import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:myapp/firebase_options.dart';

@singleton
class FirebaseService {
  @PostConstruct(preResolve: true)
  Future<void> initialize() async {
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
