import 'package:flutter/material.dart';
import 'dart:async';
import 'package:abc/onboarding.dart';


class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:
      Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon( Icons.shopping_cart_rounded,color: Colors.yellow,
                size: 100,),
              Text("Shoply",style: TextStyle(color: Colors.indigo,
                  fontWeight: FontWeight.bold,fontSize:30 ),)
            ],
          )
          
      ),
    );
  }
}
