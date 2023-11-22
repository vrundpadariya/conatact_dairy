import 'package:contactapp/model/global.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add contact ",
        ),
      ),
      body: Stepper(
        currentStep: global.currentstep,
        onStepContinue: () {
          setState(() {
            if (global.currentstep != 3) {
              global.currentstep++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (global.currentstep != 0) {
              global.currentstep--;
            }
          });
        },
        steps: [
          Step(
            isActive: true,
            title: Text(
              "ADD Photo",
            ),
            content: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.blue.shade300,
            ),
          ),
          Step(
            title: Text("NAME"),
            content: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter First Name ",
                    hintStyle: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter  Second Name ",
                    hintStyle: TextStyle(),
                  ),
                ),
              ],
            ),
          ),
          Step(
            title: Text("Phone Number"),
            content: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          Step(title: Text("Email"), content: content)
        ],
      ),
    );
  }
}
