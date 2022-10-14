import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tradex/utils/signin.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({super.key, required this.page, required this.changePage});
  int page;
  final user = FirebaseAuth.instance.currentUser!;
  final changePage;
  @override
  State<StatefulWidget> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.user.photoURL!),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    widget.user.displayName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.dashboard, size: 22),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ],
            ),
            focusColor: Colors.teal.shade200,
            selected: widget.page == 1 ? true : false,
            onTap: () {
              widget.changePage(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.note_alt_outlined, size: 22),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Notes',
                    style: TextStyle(fontSize:19),
                  ),
                ),
              ],
            ),
            onTap: () {
              widget.changePage(2);
              Navigator.pop(context);
            },
            focusColor: Colors.teal.shade200,
            selected: widget.page == 2 ? true : false,
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.people, size: 22),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'About us',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ],
            ),
            onTap: () {
              widget.changePage(3);
              Navigator.pop(context);
            },
            focusColor: Colors.teal.shade200,
            selected: widget.page == 3 ? true : false,
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.logout,
                  size: 22,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ],
            ),
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
