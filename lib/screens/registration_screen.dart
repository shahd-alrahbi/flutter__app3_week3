import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_21_9/screens/home_screen.dart';
import 'package:flutter_application_1_21_9/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var controller_name = TextEditingController();
  var controller_email = TextEditingController();
  var controller_phone = TextEditingController();
  var controller_password = TextEditingController();

  SharedPreferences? prefs;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
  }

  File? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image == null
                  ? MaterialButton(
                      onPressed: () async {
                        XFile? file =
                            await picker.pickImage(source: ImageSource.gallery);

                        image = File(file!.path);
                        setState(() {});
                      },
                      child: const Text("Choose image"),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 75,
                    ),
              SizedBox(height: 30),
              TextFormField(
                controller: controller_name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                    hintText: "Name"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller_email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                    hintText: "Email"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller_phone,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                    hintText: "Phone"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller_password,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_sharp,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                    hintText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 52, 2, 190)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 150, vertical: 16)),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
