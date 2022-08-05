abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates {}
class AuthenticationLoadingState extends AuthenticationStates {}
class AuthenticationSubmittedState extends AuthenticationStates {}
class AuthenticationErrorState extends AuthenticationStates {
  final String error;
  AuthenticationErrorState(this.error);
}
class AuthenticationVerificationState extends AuthenticationStates {}