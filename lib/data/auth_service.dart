import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final dbUser = FirebaseDatabase.instance.ref().child('User');
  final dbAdmin = FirebaseDatabase.instance.ref().child('Admin');

  static Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User?> signUp(
      String email, String password, String role, String ussername) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User user = FirebaseAuth.instance.currentUser!;
        await FirebaseFirestore.instance
            .collection('tblUser')
            .doc(user.uid)
            .set({
          'userUID': user.uid,
          'email': email,
          'password': password,
          'role': role,
          'ussername': ussername,
        });
        return "SignedUp";
      });

      ///     UserCredential result = await _auth.createUserWithEmailAndPassword(
      ///      email: email, password: password);
      //User firebaseUser = result.user!;
      //return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential != null) {
        final User user = await _auth.currentUser!;
        final userID = user.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code != email) {
        print('No user found for that email.');
      } else if (e.code != password) {
        print('Wrong password provided for that user.');
      }
    }
  }

  static Future<User?> signUpWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }   

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User?> Function() get firebaseUserStream =>
      _auth.authStateChanges;
}
