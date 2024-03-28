import 'package:flutter/material.dart';
import 'package:we_green_v1/features/profile/screens/profile_screen.dart';

import '../../../core/constant/image_strings.dart';
import '../../../features/control_waste/screens/controle_waste_screen.dart';

class DataLists {
  static final List<String> texts = [
    'Control Your Waste',
    'Learn',
    'Meet',
    'WeGreen Points'
  ];
  static final List<String> texts2 = [
    'Instead of using paper cups or bottled water, use coffee mugs or personal water bottles',
    'use cloth gift bags and stop ripping the paper off gifts!',
    'Read more and more to know about the 3’rs reduse,reuse, recycle.',
  ];

  static final List<String> imagePaths = [
    AppImages.waste,
    AppImages.learn,
    AppImages.meet,
    AppImages.points,
  ];
  static final List<String> imagePaths2 = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  static final List routs = [
    ControlWasteScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

}
