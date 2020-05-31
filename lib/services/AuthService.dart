import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  bool isSignIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user ;
  //GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<void> handleSingIn ()async { // encargarse de iniciar session
  // //https://www.youtube.com/watch?v=deJXYjEH6cs&t=753s
  // GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  // GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  // AuthCredential credential = GoogleAuthProvider.getCredential(
  //   idToken: googleSignInAuthentication.idToken,
  //   accessToken: googleSignInAuthentication.accessToken
  // );
  // AuthResult result = (await _auth.signInWithCredential(credential));
  // _user = result.user;
  // 
  // }

  GoogleSignIn _googleSignIn = GoogleSignIn();

Stream<GoogleSignInAccount> get onGoogleCurrentUserChanged  => _googleSignIn.onCurrentUserChanged;

Future<void> singInWithGoogle() async {
  // await _googleSignIn.signIn();
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken
  );
  AuthResult result = (await _auth.signInWithCredential(credential));
  _user = result.user;
  
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