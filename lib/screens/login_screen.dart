import 'package:flutter/material.dart';
import 'package:flutter_application_1_21_9/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller_email = TextEditingController();
  var controller_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Login',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                  children: <TextSpan>[],
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: controller_email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                    hintText: "Enter Email Address"),
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
                    hintText: "Enter Password"),
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
                  print(controller_email.text);
                  print(controller_password.text);
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    child: Text(
                      "Forget password?",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 70),
                  TextButton(
                    child: Text(
                      "Create New account",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    ));
  }
}
