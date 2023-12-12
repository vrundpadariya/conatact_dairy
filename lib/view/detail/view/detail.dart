// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/global.dart';
import '../../addcontact/model/contactmodel/contacr model.dart';

class Contact_Detail extends StatelessWidget {
  Contact_Detail({super.key});

  TextStyle myStyle = const TextStyle(fontSize: 22);
  Color iconColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    Contact data = ModalRoute.of(context)?.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 101,
              child: CircleAvatar(
                radius: 100,
                foregroundImage: FileImage(
                  File(
                    "${Global.imagePath}",
                  ),
                ),
              ),
            ),
            Text(
              "${data.firstname}",
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.yellow.withOpacity(0.6),
                  onPressed: () {
                    launchUrl(Uri(scheme: "tel", path: "+91 ${data.number}"));
                  },
                  child: Icon(Icons.call, color: iconColor),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.yellow.withOpacity(0.6),
                  onPressed: () {
                    launchUrl(Uri(scheme: "sms", path: "${data.number}"));
                  },
                  child: Icon(Icons.message, color: iconColor),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.yellow.withOpacity(0.6),
                  onPressed: () {
                    launchUrl(Uri(scheme: "mailto", path: "${data.email}"));
                  },
                  child: Icon(Icons.mail, color: iconColor),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.yellow.withOpacity(0.6),
                  onPressed: () {
                    Share.share("${data.firstname}"
                        "+91 ${data.number}"
                        "${data.email}");
                  },
                  child: Icon(Icons.share, color: iconColor),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
//call
//onPressed: () {
//                     launchUrl(Uri(scheme: "tel", path: "${data.number}"));
//                   },
//sms
//onPressed: () {
//                     launchUrl(Uri(scheme: "sms", path: "${data.number}"));
//                   },
//email
// onPressed: () {
//                     launchUrl(Uri(scheme: "mailto", path: "${data.email}"));
//                   },
//onPressed: () {
//                     Share.share("${data.firstname}"
//                         "+91 ${data.number}"
//                         "${data.email}");
//                   },
