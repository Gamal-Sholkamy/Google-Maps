import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_states.dart';
class AuthenticationCubit extends Cubit<AuthenticationStates>{
  AuthenticationCubit():super(AuthenticationInitialState());
  static AuthenticationCubit get(context)=>BlocProvider.of(context);
  late String verificationId;
  Future<void>submitPhoneNumber(String phoneNumber )async{
    emit(AuthenticationLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
        timeout: const Duration(seconds: 30),
        verificationCompleted:verificationCompleted ,
        verificationFailed: verificationFailed,
        codeSent:codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

  }
  void verificationCompleted(PhoneAuthCredential credential)async{
    await signIn(credential);
  }
  void verificationFailed(FirebaseAuthException exception){
    emit(AuthenticationErrorState(exception.toString()));
  }
  void codeSent(String verificationId,int ?resendToken){
    this.verificationId=verificationId;
    emit(AuthenticationSubmittedState());
  }
  void codeAutoRetrievalTimeout(String verificationId){
    print('verificationId');
  }
  Future<void>submittedOTB(String otbCode)async{
    PhoneAuthCredential credential=PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode:otbCode,
    );
    await signIn(credential);

    }
  Future<void>signIn(PhoneAuthCredential credential)async{
    try{
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(AuthenticationVerificationState());
    }
        catch(error){
      emit(AuthenticationErrorState(error.toString()));
        }
  }
  Future<void>logOut()async{
    await FirebaseAuth.instance.signOut();
  }
  User getLoggedInUser(){
    User firebaseUser=FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}