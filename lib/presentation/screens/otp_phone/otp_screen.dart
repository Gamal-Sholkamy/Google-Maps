import 'package:flutter/material.dart';
import 'package:google_maps/presentation/screens/otp_phone/otp_screen_design.dart';


class OtpScreen extends StatelessWidget{
  final String phoneNumber;
  const OtpScreen(this.phoneNumber, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 90),
                child: OtpScreenDesign(phoneNumber),
              ),
            ),

        )
    );
  }
}