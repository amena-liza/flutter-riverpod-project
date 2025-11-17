// The ChangeNotifier class is part of the Flutter SDK.
// We can use it to store some state and notify listeners when it changes.
// For example, here's a ChangeNotifier subclass along with the corresponding ChangeNotifierProvider:

/*class AuthController extends ChangeNotifier {
  // mutable state
  User? user;
  // computed state
  bool get isSignedIn => user != null;

  Future<void> signOut() {
    // update state
    user = null;
    // and notify any listeners
    notifyListeners();
  }
}

final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController();
});*/
