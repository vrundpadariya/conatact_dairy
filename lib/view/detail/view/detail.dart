import 'package:flutter/material.dart';

class detail extends StatelessWidget {
  const detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact"),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              radius: 100,
              child: Image(
                image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/2815/2815428.png",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Name"),
          ],
        ),
      ),
    );
  }
}
