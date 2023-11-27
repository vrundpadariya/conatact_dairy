import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/continue/continuemodel.dart';
import '../provider/continueprovider/continueprovider.dart';

class contact extends StatelessWidget {
  const contact({super.key});

  @override
  Widget build(BuildContext context) {
    Continue c = Continue(Currentstep: 0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add contact ",
        ),
      ),
      body: Stepper(
        currentStep: Provider.of<continueprovider>(context).c.Currentstep,
        onStepContinue: () {
          Provider.of<continueprovider>(context, listen: false).Continuestep();
        },
        onStepCancel: () {
          Provider.of<continueprovider>(context, listen: false).cancelstep();
        },
        steps: [
          Step(
            title: const Text(
              "ADD Photo",
            ),
            content: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.blue.shade300,
            ),
          ),
          Step(
            title: const Text("NAME"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
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
          Step(
            title: Text("Email"),
            content: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ();
  }
}
