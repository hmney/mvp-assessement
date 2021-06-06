import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mvp_assessement/core/auth/repositories/auth_repository.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final authRepository = Modular.get<AuthRepository>();
  final Future<FirebaseApp> initFirebaseApp = Firebase.initializeApp();
  Stream<User?> authStateChangesStream() =>
      authRepository.firebaseAuth.authStateChanges();

  void signInWithGoogle() => authRepository.signInWithGoogle();
  void signInWithFacebook() => authRepository.signInWithFacebook();
  void signOut() => authRepository.signOut();
}
