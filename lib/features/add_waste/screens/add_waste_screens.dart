import 'package:flutter/material.dart';

import '../../../common_widgets/bg.dart';

class AddWasteScreen extends StatelessWidget {
  const AddWasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        bg()
      ],),
    );
  }
}
