import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import '/Backend/backend.dart';
import 'Widgets/widgets.dart';
import 'Screens/screens.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          '/': (context) => LoginPage()
        },
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Montserrat",
          textTheme: TextTheme(
            headline2: const TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold
            ),
            headline1: const TextStyle(
              color: Colors.white,
              fontSize: 36.0,
              fontWeight: FontWeight.normal
            ),
            bodyText1: const TextStyle(
              color: Colors.white,
              fontSize:24,
              fontWeight: FontWeight.normal
            )
          ),
          backgroundColor: const Color(0xff2B2E42),
          visualDensity: VisualDensity.adaptivePlatformDensity
        )
      ),
    );
  }
}