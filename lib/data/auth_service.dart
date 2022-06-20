import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signInAnonymous() async {
  try{
    UserCredential result = await _auth.signInAnonymously();
     User? firebaseUser = result.user;
    return firebaseUser;
  } catch(e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user!;

      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

    static Future<User?> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password
      );
      } on FirebaseAuthException catch (e) {
        if (e.code != email) {
          print('No user found for that email.');
      } else if (e.code != password) {
        print('Wrong password provided for that user.');
      }
}
  }

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

    //return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
      return null;
  }
  } 

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User?> Function() get firebaseUserStream => _auth.authStateChanges;
}