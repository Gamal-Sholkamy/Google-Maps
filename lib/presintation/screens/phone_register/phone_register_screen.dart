import 'package:flutter/material.dart';
import 'package:google_maps/presintation/screens/phone_register/phone_register_design.dart';

class PhoneRegisterScreen extends StatelessWidget{
  final GlobalKey _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 90),
                child: PhoneRegisterDesign(),
              ),
            ),
          ),
        )
    );
  }
}