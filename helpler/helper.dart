import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore/storage/storage.dart';
import 'package:firestore/utils/utils.dart';

class AuthenticationHelper {
  // Instance FirebaseAuth
  final FirebaseAuth auth = FirebaseAuth.instance;
  // Get currentUser
  get user => auth.currentUser;

  //SIGN In
  Future signIn({required String email, required String password}) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      return e.message;
    }

    if(!empty(user)) {
      saveUserToHive(user);
    }
  }

  //SIGN OUT
  Future signOut() async {
    await auth.signOut();
  }
}
