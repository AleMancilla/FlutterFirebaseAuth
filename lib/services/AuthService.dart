import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'http://www.google.com/auth/contacts.readonly'
    ]
  );

Stream<GoogleSignInAccount> get onGoogleCurrentUserChanged  => _googleSignIn.onCurrentUserChanged;

Future<void> singInWithGoogle() async {
  await _googleSignIn.signIn();
}

Future<void> singInFirebase(String email, String pass)async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
}

Future<void> singOutFirebase() async{
  await FirebaseAuth.instance.signOut();
}

Future<void> singOutGoogle()async{
  await _googleSignIn.signOut();
}

}



final autService = AuthService();