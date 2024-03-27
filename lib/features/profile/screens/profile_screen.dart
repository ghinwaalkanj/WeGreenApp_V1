import 'package:flutter/material.dart';

import '../../../common_widgets/bg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        bg()
      ],),
    );
  }
}
