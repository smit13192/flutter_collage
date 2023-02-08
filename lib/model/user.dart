import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  static String get email => FirebaseAuth.instance.currentUser!.email!;

  static Future<List<String>> get favorite async {
    List<String> favorite = [];
    var snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(email.split("@")[0])
        .collection("favorite")
        .get();

        List list = snapshot.docs;
        for(var l in list) {
          favorite.add(l.data()["fid"]);
        }
        return favorite;
  }
}
