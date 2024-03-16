class loginWithEmailAndPasswordFailure {
  final String message;

  const loginWithEmailAndPasswordFailure(
      [this.message = 'An unknown error occured']);

  factory loginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'wrong-password':
        return const loginWithEmailAndPasswordFailure(
            'You entered a wrong password');
      case 'invalid-email':  
        return const loginWithEmailAndPasswordFailure(
            'Account not found');
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
