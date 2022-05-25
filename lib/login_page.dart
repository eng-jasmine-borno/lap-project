import 'package:assignment_three/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assignment_three/home_page.dart';
import 'package:assignment_three/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageView extends StatelessWidget with InputValidationMixin {
  const LoginPageView({Key? key}) : super(key: key);

  static final  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formStateKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  validator: (email) {
                    if (isEmailValid(email.toString())) {
                      return null;
                    } else {
                      return 'Enter Email Id';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ID',
                      hintText: 'EnterEnter Email Id'),
                ),
              ),
              Padding(
                padding:const  EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  validator: (password) {
                    if (isPasswordValid(password.toString())) {
                      return null;
                    } else {
                      return 'Enter  password';
                    }
                  },
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter password'),
                ),
              ),
              FlatButton(

                onPressed: (){
                },
                child:const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(0)),
                child: FlatButton(
                  onPressed: ()async {
                    if(formStateKey.currentState!.validate()) {
                      formStateKey.currentState!.save();
                   await AuthenticationService.authHelper.signIn(context,email:AuthenticationService.authHelper.email.text,password:AuthenticationService.authHelper.password.text);


                    }
                  },
                  child:const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),

                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              InkWell(onTap: (){
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (_) => SignupPageView() ),ModalRoute.withName(''));
              },child: const Text('New User? Create Account'))
            ],
          ),
        ),
      ),
    );
  }


}


  mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) {
    RegExp regex =  RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }
}