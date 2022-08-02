import 'package:flutter/material.dart';
import 'package:google_maps/presintation/screens/otp_phone/otp_screen_design.dart';

class OtpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 90),
                child: OtpScreenDesign(),
              ),
            ),

        )
    );
  }
}