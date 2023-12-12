import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import 'addcontact/provider/Themeprovider/themeprovider.dart';
import 'addcontact/provider/contactprovider/contact provider.dart';

class home extends StatelessWidget {
  home({super.key});

  LocalAuthentication authentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'd');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contact",
        ),
        actions: [
          PopupMenuButton(
              onSelected: (val) async {
                if (val == 'theme') {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme();
                } else if (val == 'hidden') {
                  bool isDeviceSuported =
                      await authentication.isDeviceSupported();
                  bool canCheckBiometrics =
                      await authentication.canCheckBiometrics;

                  try {
                    if (isDeviceSuported == true &&
                        canCheckBiometrics == true) {
                      bool isAuthenticate = await authentication.authenticate(
                          localizedReason:
                              "You Need to Verify your self to see Hidden Contacts..");
                    } else {
                      log("Device is Not Supported.....");
                    }
                  } on PlatformException catch (e) {
                    log("${e.code}");
                    log("${e.message}");
                  }
                }
              },
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text("Theme"),
                      value: "theme",
                    ),
                    PopupMenuItem(
                      child: Text("Hidden Contact"),
                      value: "hidden",
                    ),
                  ])
        ],
      ),
      body: (Provider.of<ContactProvider>(context, listen: false)
              .allcontact
              .isNotEmpty)
          ? ListView.builder(
              itemCount: Provider.of<ContactProvider>(context, listen: false)
                  .allcontact
                  .length,
              itemBuilder: (ctx, i) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'd ',
                        arguments:
                            Provider.of<ContactProvider>(context, listen: false)
                                .allcontact[i]);
                  },
                  leading: const CircleAvatar(),
                  title: Text(
                      Provider.of<ContactProvider>(context, listen: false)
                          .allcontact[i]
                          .firstname),
                  subtitle: Text(
                      Provider.of<ContactProvider>(context, listen: false)
                          .allcontact[i]
                          .number),
                  trailing: IconButton(
                    onPressed: () {
                      launch(
                          "tel:+91${Provider.of<ContactProvider>(context, listen: false).allcontact[i].number}");
                    },
                    icon: const Icon(Icons.call),
                  ),
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "lib/model/Asset/Animation - 1700550644764.gif"),
                      ),
                    ),
                  ),
                  const Text(
                    "No Contact found",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
    );
  }
}
