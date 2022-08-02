import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreenDesign extends StatelessWidget{
   final String _phoneNumber='01009676912';
  late final String otp;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const Text("Verify your phone number ",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 25,),
        RichText(
            text:  TextSpan(
          text:"enter your 6 digits code numbers sent to   " ,
            style: const TextStyle(
              height: 1.3,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          children: [
            TextSpan(
                text: _phoneNumber,
              style:const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),


            ),


          ]
        )),
        const SizedBox(
          height: 30,),
        buildVerifyFields(context),
        const SizedBox(
          height: 80,),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(100, 45),
                primary: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
            onPressed: (){},
            child: const Text("Verify",style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
        ),


      ],
    );
  }
  Widget buildVerifyFields(BuildContext context){
    return Container(
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.blue.shade50,
        enableActiveFill: true,

        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {

        },

      )

    );
  }
}