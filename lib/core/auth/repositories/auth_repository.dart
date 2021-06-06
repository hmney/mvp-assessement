import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final facebookAuth = FacebookAuth.instance;

  Future<UserCredential?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await facebookAuth.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);
        return await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendEmailVerification(User user) async {
    try {
      await user.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
