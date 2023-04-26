class SignUpWithEmailandPasswordFailure{
  final String message;

  const SignUpWithEmailandPasswordFailure([this.message = "Unknown Error Occurred"]);

  factory SignUpWithEmailandPasswordFailure.code(String code){
    switch(code){
      case '': return SignUpWithEmailandPasswordFailure('');
      case 'weak-password': return const SignUpWithEmailandPasswordFailure('Weak password');
      case 'invalid-email': return const SignUpWithEmailandPasswordFailure('Invalid email');
      case 'email-already-in-use': return const SignUpWithEmailandPasswordFailure('Email already in use');
      default: return SignUpWithEmailandPasswordFailure();
    }
  }

}