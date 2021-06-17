import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import '/backend/backend.dart';
import 'Widgets/widgets.dart';

void main() async {

  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(value: AuthService().user, initialData: null)
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (fcontext) => ErrorScreen()
        },
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Montserrat",
          textTheme: TextTheme(
            headline2: const TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold
            )
          )
        )
      ),
    );
  }
}