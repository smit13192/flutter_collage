import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 40,
                child: const Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello ,",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser!.email!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          leading: Icon(Icons.shopping_cart_outlined),
          title: Text(
            "Cart",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.favorite_border_outlined),
          title: Text(
            "Favourite",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.email_outlined),
          title: Text(
            "Email",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
        ListTile(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
          },
          leading: const Icon(Icons.logout),
          title: const Text(
            "Log Out",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
