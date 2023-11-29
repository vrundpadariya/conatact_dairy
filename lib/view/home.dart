import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import 'addcontact/provider/Themeprovider/themeprovider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  LocalAuthentication authentication = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'c');
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
                }
              },
              itemBuilder: (ctx) => [
                    const PopupMenuItem(
                      child: Text("Theme"),
                      value: "theme",
                    ),
                    const PopupMenuItem(
                      child: Text("Hidden contact"),
                      value: "hidden",
                    ),
                  ])
        ],
      ),
      body: Center(
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
