import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class introduction extends StatelessWidget {
  const introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Contact app",
              body: "Hello",
              image: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/model/Asset/contact1.gif"),
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: "Contact app",
              body: "Hello",
              image: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/model/Asset/contact2.gif"),
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: "Contact app",
              body: "Hello",
              image: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/model/Asset/contact3.gif"),
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: "Contact app",
              body: "Hello",
              image: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/model/Asset/contact2.gif"),
                  ),
                ),
              ),
            ),
          ],
          onDone: () async {
            Navigator.pushReplacementNamed(context, 'home');
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setBool("Isvisited", true);
          },
          done: Text("Done"),
          showNextButton: true,
          next: Text("Next"),
        ),
      ),
    );
  }
}
