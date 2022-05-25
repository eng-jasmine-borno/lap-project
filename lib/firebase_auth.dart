import 'package:assignment_three/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AuthenticationService {
  AuthenticationService._();
 static AuthenticationService authHelper=AuthenticationService._();
 FirebaseAuth firebaseAuth= FirebaseAuth.instance;

  // AuthenticationService({this._firebaseAuth});
  final TextEditingController email= TextEditingController();
  final TextEditingController password = TextEditingController();

  Stream<User?> get authStateChanges => firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

    Future<String?> signIn(BuildContext context,{String? email, String? password}) async {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email!,
            password: password!
        );
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePageView() ),);
      } on FirebaseAuthException catch (e) {
        var snackBar = SnackBar(content: Text('الرجاء التأكد من الايميل وكلمة المرور جيد'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
  }
  Future<String?> signUp({String? email, String? password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

