import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tradex/Page/aboutusPage.dart';
import 'package:tradex/Page/dashboardPage.dart';
import 'package:tradex/Page/drawerPage.dart';
import 'package:tradex/Page/notesPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page =1;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    changePage(newPage) {
      setState(() {
        page = newPage;
      });
    }
    Widget pagewidget;

    switch(page) { 
      case 1: { 
        pagewidget = DashboardPage(user: user,);
      } 
      break; 
      
      case 2: { 
        
        pagewidget = const NotesPage();
      } 
      break; 

      case 3: { 
        
        pagewidget = const AboutusPage();
      } 
      break; 
      
      default: { 
        pagewidget = DashboardPage(user: user,);
      }
      break; 
    } 

    return Scaffold(
      appBar: AppBar(title: const Text("Tradex")),
      drawer: DrawerPage(page: page, changePage: changePage),
      body: pagewidget
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Padding(
      //           padding: const EdgeInsets.only(top: 10, bottom: 30),
      //           child: CircleAvatar(
      //             radius: 50,
      //             backgroundImage: NetworkImage(user.photoURL!),
      //           )),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 10, bottom: 10),
      //         child: Text(
      //           user.displayName!,
      //           style:
      //               const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //         ),
      //       ),
      //       Text(
      //         "${page}",
      //         style: const TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 10, bottom: 10),
      //         child: ElevatedButton(
      //             onPressed: () {
      //               final provider = Provider.of<GoogleSignInProvider>(context,
      //                   listen: false);
      //               provider.googleLogout();
      //             },
      //             child: const Text("Logout")),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
