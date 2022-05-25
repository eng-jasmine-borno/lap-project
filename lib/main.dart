import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:assignment_three/login_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    const title = 'Assignment3';
    return  MaterialApp(
      navigatorKey: navigatorKey,
      title: title,
      debugShowCheckedModeBanner: false,
      home: const LoginPageView(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  Widget normalField({ String? hint , InputBorder? border , bool? isPassword = false}){
    return  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        obscureText: isPassword!,
        decoration: InputDecoration(
          border:border?? const OutlineInputBorder(borderSide: BorderSide(color: Colors.black) ),
          hintText:hint.toString() ,
          focusedBorder:  border?.copyWith(
              borderSide: const BorderSide(color: Colors.black)),
        ),
      ),
    );
  }

  Widget iconFieldWidget({ String? hint , InputBorder? border , IconData? icon}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:const EdgeInsets.only(top: 28),
          child: Icon(icon??Icons.person),
        ),
        const SizedBox(width: 10,),
        Expanded(child: normalField(hint: hint??"User Name",border:border??const  UnderlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(20))))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization=Firebase.initializeApp();
    return FutureBuilder(
      future: initialization,
      builder: (context,snapshot)  {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("Student Enrollment"),
              const SizedBox(height: 10,),
              CircleAvatar(radius: 40,child: ClipOval(child: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png")),),
              const SizedBox(height: 20,),
              iconFieldWidget(),
              const SizedBox(height: 10,),
              normalField(hint: "First Name",border:const  OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(20)))),
              const SizedBox(height: 10,),
              normalField(hint: "Last Name",border: const UnderlineInputBorder()),
              const SizedBox(height: 10,),
              normalField(hint: "Password",border: const UnderlineInputBorder(),isPassword: true),
              const SizedBox(height: 10,),
              normalField(hint: "Email ID",border: const UnderlineInputBorder(),isPassword: true),
              const SizedBox(height: 10,),
              iconFieldWidget(hint: "Number",border: const UnderlineInputBorder() ,icon:const IconData(0xe4a2, fontFamily: 'MaterialIcons'))
            ],
          ),
        );
    //     if(snapshot.hasError){
    //       return Scaffold(body:Container(child: Text('Erorr'),),);
    //     }
    //     if(snapshot.connectionState==ConnectionState.done){
    //        return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 15),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       const Text("Student Enrollment"),
    //       const SizedBox(height: 10,),
    //       CircleAvatar(radius: 40,child: ClipOval(child: Image.network("https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png")),),
    //       const SizedBox(height: 20,),
    //       iconFieldWidget(),
    //       const SizedBox(height: 10,),
    //       normalField(hint: "First Name",border:const  OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(20)))),
    //       const SizedBox(height: 10,),
    //       normalField(hint: "Last Name",border: const UnderlineInputBorder()),
    //       const SizedBox(height: 10,),
    //       normalField(hint: "Password",border: const UnderlineInputBorder(),isPassword: true),
    //       const SizedBox(height: 10,),
    //       normalField(hint: "Email ID",border: const UnderlineInputBorder(),isPassword: true),
    //       const SizedBox(height: 10,),
    //       iconFieldWidget(hint: "Number",border: const UnderlineInputBorder() ,icon:const IconData(0xe4a2, fontFamily: 'MaterialIcons'))
    //     ],
    //   ),
    // );}
        });
  }
}