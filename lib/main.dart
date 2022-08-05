import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:google_maps/presentation/screens/map_screen/map_screen.dart';
import 'package:google_maps/presentation/screens/phone_register/phone_register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Widget startPage = PhoneRegisterScreen();
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      startPage = PhoneRegisterScreen();
    } else {
      startPage = const MapScreen();
    }
  });
  runApp(MyApp(startPage));
}

class MyApp extends StatelessWidget {
  final Widget startPage;

  const MyApp(this.startPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => AuthenticationCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: startPage,
        ));
  }
}
