import 'package:flutter/material.dart';
import 'package:we_green_v1/common_widgets/bg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        bg(),
        Image(image: AssetImage("assets/images/Ellipse 19 (1).png"),)
      ],),
    );
  }
}
