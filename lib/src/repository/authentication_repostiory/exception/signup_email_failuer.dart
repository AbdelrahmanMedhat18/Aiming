class SignUpWithEmailAndPasswordFailure{
  final String message;

  SignUpWithEmailAndPasswordFailure([this.message = "An Unknown error."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){

    switch(code){
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure('Please Enter a Stronger Password. ');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('Email is Not Valid or Badly Formatted. ');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('An Account Already Exists for That Email. ');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('Operation is Not Allowed. Please Contact Support ');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure('This User has been Disabled. Please Contact Support ');
      default:
        return SignUpWithEmailAndPasswordFailure();

    }
  }
}