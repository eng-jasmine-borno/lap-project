import 'package:assignment_three/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assignment_three/login_page.dart';
import 'package:assignment_three/slider_page.dart';
import 'package:assignment_three/main.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue, title: const Text("All categories")),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: () => _goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text("SOny"),
              color: Colors.blue[50],
            ),
          ),
          InkWell(
            onTap: () => _goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('APPLE'),
              color: Colors.blue[100],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('HUAWEI'),
              color: Colors.blue[100],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('SAMSUNG'),
              color: Colors.blue[50],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('NOKIA'),
              color: Colors.blue[50],
            ),
          ),
          InkWell(
            onTap: ()=>_goToSlider(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('XIOMI'),
              color: Colors.blue[100],
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }



  void _goToSlider(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SliderPageView()));
  }
}
class Drawer extends StatelessWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.3,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 80,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                    'Menu',                  ////////////////////////////////////////////////menu
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          ListTile(
            title: const Text('Shop'),
            onTap: () {
              // Update the state of the app
              // ...
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));
            },
          ),
          ListTile(
            title: const Text('Orders'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));
            },
          ),
          ListTile(
            title: const Text('Manage Product'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));
            },
          ),

          ListTile(
            title: const Text('Categories'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              MyApp.navigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (_) => SliderPageView()));

            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              AuthenticationService.authHelper.signOut();
              // Update the state of the app
              // ...
              // Then close the drawer
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginPageView() ));
              });
            },
          ),
        ],
      ),
    );
  }

}
