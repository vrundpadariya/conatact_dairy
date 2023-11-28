import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addcontact/provider/Themeprovider/themeprovider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'c');
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contact",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<TheamProvider>(context, listen: false).ChangeTheam();
            },
            icon: Icon((Provider.of<TheamProvider>(context, listen: false)
                        .myTheamModel
                        .isDark ==
                    false)
                ? Icons.sunny
                : Icons.wb_sunny_outlined),
          )
          // PopupMenuButton(
          //     itemBuilder: (ctx) => [
          //           PopupMenuItem(
          //             child: Text("Dark Theme"),
          //           ),
          //           PopupMenuItem(
          //             child: Text("Autication"),
          //           ),
          //         ])
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "lib/model/Asset/Animation - 1700550644764.gif"),
                ),
              ),
            ),
            Text(
              "No Contact found",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
