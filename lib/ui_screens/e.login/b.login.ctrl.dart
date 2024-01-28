part of '_index.dart';

class LoginCtrl {
  initUser() {
    dt.rxUser.subscription = FirebaseAuth.instance.authStateChanges().listen(
          (event) => dt.rxUser.state = event,
        );
  }

  signInAnonymous() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  signInByGoogle() async {
    final provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
    await FirebaseAuth.instance.signInWithPopup(provider);
  }
}
