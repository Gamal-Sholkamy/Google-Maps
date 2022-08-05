import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:google_maps/business_logic/authentication_cubit/authentication_states.dart';
import 'package:google_maps/constants/colors.dart';

import '../otp_phone/otp_screen.dart';

class PhoneRegisterDesign extends StatelessWidget{
  final _phoneController=TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationStates>(
        listener: (context,state){
          if(state is AuthenticationSubmittedState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(_phoneController.text)));
          }
        },
      builder: (context,state){
          AuthenticationCubit authenticationCubit=AuthenticationCubit.get(context);
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("What is your phone number ?",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              const SizedBox(height: 25,),
              const Text("Please enter your phone number to verify your account",maxLines: 2,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColors.lightGray),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child: Text('${generateCountryFlag()} +20',style: const TextStyle(fontSize: 18,letterSpacing: 2.0),),

                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    flex: 2,
                    child:Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColors.blue),
                          borderRadius: const BorderRadius.all(Radius.circular(6))
                      ),
                      child: TextFormField(
                        controller: _phoneController,
                        autofocus: true,
                        style: const TextStyle(fontSize: 18,letterSpacing: 2.0),
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,

                        ),
                        cursorColor: Colors.black,
                        validator: (value){
                          if(value!.isEmpty){
                            return "please enter your phone number";}
                          else if (value.length<11){
                            return "Too short to phone number";
                          }
                          else {
                            return null;
                          }
                        },
                        onSaved: (value){},

                      ),

                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(100, 45),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      authenticationCubit.submitPhoneNumber(_phoneController.text);
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(_phoneController.text)));
                    }
                  },
                  child: const Text("Next",style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),

            ],
          ),
        );
      },

    );
  }

  String generateCountryFlag(){
    String countryCode='eg';
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) =>String.fromCharCode(match.group(0)!.codeUnitAt(0)+127397));
  }

}