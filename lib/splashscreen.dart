import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamusfrench_indo/home.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {
  
  //init state  menjalankan splashscreen secara otomatis
  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3); //widget durasi 3deit
    //setelah 3 detik pindah ke home page
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.book,
              size: 100.0,
              color: Colors.white,
            ),

            SizedBox(height: 24.0,),

            Text("Kamus Prancis - Indonesia",
              style : TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            )

          ],
        ),
      ),  //mengambil text dan icon
    );
  }
}