import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/global.dart';
import '../model/contactmodel/contacr model.dart';
import '../model/continue/continuemodel.dart';
import '../provider/contactprovider/contact provider.dart';
import '../provider/continueprovider/continueprovider.dart';

class contact extends StatefulWidget {
  contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  XFile? image;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    Continue c = Continue(Currentstep: 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add contact ",
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Contact contact_data = Contact(
                  firstname: Global.firstname!,
                  lastname: Global.lastname!,
                  number: Global.number!,
                  email: Global.email!,
                );

                Provider.of<ContactProvider>(context, listen: true)
                    .add_contact(contact: contact_data);
                Navigator.pushNamed(context, 'home');
                //Navigator.of(context).pushNamed('home');
              }
              Global.firstEditingController.clear();
              Global.lastEditingController.clear();
              Global.emailEditingController.clear();
              Global.numberEditingController.clear();
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
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
            isActive: (c.Currentstep == 0) ? true : false,
            title: Text(
              "ADD Photo",
            ),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 90,
                  foregroundImage: FileImage(
                    File(
                      "${image?.path}",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        image = await Global.picker.pickImage(
                          source: ImageSource.camera,
                        );
                        setState(() {
                          Global.imagePath = image!.path;
                        });
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        image = await Global.picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {
                          Global.imagePath = image!.path;
                        });
                      },
                      icon: const Icon(
                        Icons.panorama,
                        size: 35,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Step(
            isActive: (c.Currentstep == 1) ? true : false,
            title: const Text("NAME"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter First Name ",
                    hintStyle: TextStyle(),
                  ),
                  controller: Global.firstEditingController,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter  Second Name ",
                    hintStyle: TextStyle(),
                  ),
                  controller: Global.lastEditingController,
                ),
              ],
            ),
          ),
          Step(
            isActive: (c.Currentstep == 3) ? true : false,
            title: const Text("Phone Number"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: Global.numberEditingController,
                ),
              ],
            ),
          ),
          Step(
            isActive: (c.Currentstep == 4) ? true : false,
            title: const Text("Email"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: Global.emailEditingController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
