import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      color: Colors.white,

      padding: EdgeInsets.symmetric(horizontal: 16),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Logo
          Image.asset('assets/images/company_logo.png'),

          // Spacer between Logo and Avatar
          SizedBox(width: 110),

          // Circular Profile Image
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar_image.png'),
            radius: 16,
          ),

          SizedBox(width: 16),

          // Globe Icon
          Image.asset('assets/images/globe.png'),

          SizedBox(width: 16),

          // Menu Drawer Icon
          Image.asset('assets/images/menu.png'),
        ],
      ),
    );
  }
}