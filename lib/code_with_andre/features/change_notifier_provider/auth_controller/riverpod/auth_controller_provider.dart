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

// The ChangeNotifier API makes it easy to break two important rules: immutable state and unidirectional data flow.
//
// As a result, ChangeNotifier is discouraged, and we should use StateNotifier instead.
//
// When used incorrectly, ChangeNotifier leads to mutable state and makes our code harder to maintain. StateNotifier gives us a simple API for dealing with immutable state. For a more in-depth overview, read: Flutter State Management: Going from setState to Freezed & StateNotifier with Provider
//
