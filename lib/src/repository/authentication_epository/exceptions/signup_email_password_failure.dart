class loginWithEmailAndPasswordFailure {
  final String message;

  const loginWithEmailAndPasswordFailure(
      [this.message = 'An unknown error occured']);

  factory loginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const loginWithEmailAndPasswordFailure(
            'Please enter a stronger password');
      case 'invalid-email':  
        return const loginWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const loginWithEmailAndPasswordFailure(
            'An account already exists for that email');
      case 'operation-not-allowed':
        return const loginWithEmailAndPasswordFailure(
            'Operation not allowed. Please contact support');
      case 'user-disabled':
        return const loginWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help');
      default:
        return const loginWithEmailAndPasswordFailure();
    }
  }
}
