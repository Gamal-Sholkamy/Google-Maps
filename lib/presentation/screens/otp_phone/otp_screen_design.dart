import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:google_maps/business_logic/authentication_cubit/authentication_states.dart';
import 'package:google_maps/presentation/screens/map_screen/map_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreenDesign extends StatelessWidget {
 final String phoneNumber ;
 OtpScreenDesign(this.phoneNumber);
  late final String otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationStates>(
      listener: (context,state){
        if(state is AuthenticationVerificationState){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MapScreen()),
                  (route) => false);
        }
      },
      builder: (context,state){
        AuthenticationCubit authenticationCubit=AuthenticationCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Verify your phone number ",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 25,
            ),
            RichText(
                text: TextSpan(
                    text: "enter your 6 digits code numbers sent to   ",
                    style: const TextStyle(
                        height: 1.3,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    children: [
                      TextSpan(
                        text: phoneNumber,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ])),
            const SizedBox(
              height: 30,
            ),
            buildVerifyFields(context),
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 45),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                onPressed: () {
                  authenticationCubit.submittedOTB(otpCode);
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildVerifyFields(BuildContext context) {
    return Container(
        child: PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 55,
          fieldWidth: 45,
          activeFillColor: Colors.tealAccent,
          activeColor: Colors.yellowAccent,
          selectedFillColor:  Colors.grey[200],
          selectedColor:  Colors.yellowAccent,
          errorBorderColor: Colors.amber,
        borderWidth: 2,
        disabledColor:  Colors.amberAccent,
        inactiveFillColor:  Colors.white,
        inactiveColor: Colors.yellowAccent,
      ),
      animationDuration: const Duration(milliseconds: 400),
      backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      onCompleted: (code) {
        otpCode=code;
      },
      onChanged: (value) {},
    ));
  }
}
