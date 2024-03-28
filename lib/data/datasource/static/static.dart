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

  static final List<String> imagePaths = [
    AppImages.waste,
    AppImages.learn,
    AppImages.meet,
    AppImages.points,
  ];

  static final List routs = [
    ControlWasteScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

}
