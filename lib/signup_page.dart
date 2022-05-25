import 'package:assignment_three/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assignment_three/home_page.dart';
import 'package:assignment_three/login_page.dart';

class SignupPageView extends StatelessWidget with InputValidationMixin {
  const SignupPageView({Key? key}) : super(key: key);

  static final  GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('SignUp'),
        backgroundColor: Colors.blue,

      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formStateKey,
          child: Column(
            children: <Widget>[

              Padding(
                padding:const  EdgeInsets.only(top:200 , left:15, right: 15),
                child: TextFormField(
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'enter username',
                      hintText: 'enter username'),
                ),
              ),



              Padding(
                  padding:const EdgeInsets.only(bottom: 20 ),
                child: Center(
                  child: Container(
                      ),
                ),
              ),
              Container(
               // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding:const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(controller: AuthenticationService.authHelper.email,
                  validator: (email) {
                    if (isEmailValid(email.toString())) {
                      return null;
                    } else {
                      return 'Enter Email ID';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Email ID'),
                ),
              ),
              Padding(
                padding:const  EdgeInsets.only(left: 15.0, right: 15.0, top:20,bottom: 20),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(controller: AuthenticationService.authHelper.password,
                  obscureText: true,
                  validator: (password) {
                    if (isPasswordValid(password.toString())) {
                      return null;
                    } else {
                      return 'Enter password';
                    }
                  },
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter password'),
                ),
              ),
              SizedBox(height: 40,),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(0)),
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async{
                    if(_formStateKey.currentState!.validate()) {
                      _formStateKey.currentState!.save();
                   await  AuthenticationService.authHelper.signUp(email: AuthenticationService.authHelper.email.text,password: AuthenticationService.authHelper.password.text);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomePageView()));
                    }
                  },

                  child:const Text(
                    'SignUp',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,

              ),

              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPageView()));
                  },
                  child: const Text('Already Have Account? Login here'))
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