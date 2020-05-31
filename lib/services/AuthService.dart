import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  bool isSignIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user ;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FacebookLogin _facebookLogin = FacebookLogin();
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

Future<void> signInFacebook() async {


final FacebookLoginResult facebookLoginResult = await _facebookLogin.logIn(['email', 'public_profile']);
FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);
_user = (await _auth.signInWithCredential(authCredential)).user;

//  _facebookLogin.logIn(['email','public_profile'])
//  .then((result){
//    switch(result.status){
//      case FacebookLoginStatus.loggedIn:
//        
//      default 
//    }
//  }).catchError((e){print("**************************FACEBOOK ERROR $e");});
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
Future<void> singOutFacebook()async{
  await _facebookLogin.logOut();
}

}



final autService = AuthService();