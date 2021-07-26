import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> get getUser => Future.value(_auth.currentUser!);
  Stream<User?> get user => _auth.authStateChanges();

  Future<void> updateUserData(User user) {
    DocumentReference reportRef = _db.collection('reports').doc(user.uid);

    return reportRef.set({
      'uid': user.uid,
      'lastActivity': DateTime.now()
    }
    );
  }

  Future<User?> googleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;

      updateUserData(user!);

      return user;
    }
    catch(error) {
      print(error.toString());
      return null;
    }
  }

  void signout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
  void userSignOut() async {
    _auth.signOut();
  }
} 