import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ms/model/user.dart';

class FavoriteIcon extends StatefulWidget {
  final String id;
  const FavoriteIcon({required this.id, super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isfavorite = false;

  @override
  void initState() {
    super.initState();
    checkIsFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        enableFeedback: true,
        splashColor: Colors.transparent,
        iconSize: 20,
        onPressed: onPressed,
        icon: isfavorite
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border_outlined,
              ),
      ),
    );
  }

  checkIsFavorite() async {
    List list = await AppUser.favorite;
    isfavorite = list.contains(widget.id);
    setState(() {});
  }

  onPressed() async {
    if (isfavorite) {
      var snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(AppUser.email.split("@")[0])
          .collection('favorite')
          .where("fid", isEqualTo: widget.id)
          .get();
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(AppUser.email.split("@")[0])
          .collection('favorite')
          .doc(snapshot.docs[0].id)
          .delete();
      Fluttertoast.showToast(msg: "Remove Favorite");
    } else {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(AppUser.email.split("@")[0])
          .collection('favorite')
          .doc()
          .set({"fid": widget.id});
      Fluttertoast.showToast(msg: "Add Favorite");
    }
    isfavorite = !isfavorite;
    checkIsFavorite();
  }
}
