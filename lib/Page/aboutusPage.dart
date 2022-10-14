import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  void _launchMail() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'gowthamanks17@gmail.com',
    );
    try {
      await launchUrl(url);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 30),
            child: Image(
              image: AssetImage("assets/logo1.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Tradex is a personal project",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Only for study purpose",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Text(
                  "For suggestions connect with us",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: IconButton(
                    onPressed: () => _launchMail(),
                    icon: const Icon(Icons.mail,size: 35,),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
