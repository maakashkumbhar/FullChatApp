

import 'package:chatapp/model/getxMessageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FlutterFire extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  String get user => _firebaseUser.value?.email;
  String get userUID => _firebaseUser.value.uid;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        // var current_UserEmail = FirebaseAuth.instance.currentUser!.email.obs;
      });

      return true;
    } on FirebaseException catch (e) {
      Get.snackbar("Something Went Wrong", "${e.message}");
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The Password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  bool signOut() {
    try {
      _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Something Went Wrong", "${e.message}");
      return false;
    }
  }

  Future<void> addMessage(
      {@required String message,
      @required DateTime messageat,
      @required bool isme}) {
    String uid = _auth.currentUser.uid;
    DocumentReference reference =
        FirebaseFirestore.instance.collection('Messages').doc();
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(reference);
        if (!snapshot.exists) {
          reference.set({
            "Message": message,
            "TimeStamp": messageat,
            "isme": isme,
            "user": uid
          });
        }
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Something Went Wrong", "${e.message}");
    }
  }

  getUserChats(){
    return FirebaseFirestore.instance.collection("Messages").get();
  }
  

}
