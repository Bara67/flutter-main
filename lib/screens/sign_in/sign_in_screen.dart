import 'package:flutter/material.dart';

import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/JsonModels/users.dart';
import 'package:shop_app/SQLite/sqlite.dart';
import 'package:shop_app/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //We need two text editing controller

  //TextEditing controller to control the text when we enter into it
  final username = TextEditingController();
  final password = TextEditingController();

  //A bool variable for show and hide password
  bool isVisible = false;

  //Here is our bool variable
  bool isLoginTrue = false;

  final db = DatabaseHelper();

  //Now we should call this function in login button
  login() async {
    var response = await db
        .login(Users(usrName: username.text, usrPassword: password.text));
    if (response == true) {
      //If login is correct, then goto notes
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      //If not, true the bool value to show error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  //We have to create global key for our form
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            //We put all our textfield to a form to be controlled and not allow as empty
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  //Username field

                  //Before we show the image, after we copied the image we need to define the location in pubspec.yaml
                  Image.asset(
                    "lib/assets/login.png",
                    width: 500,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Username",
                      ),
                    ),
                  ),

                  // Password
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  //tombol login
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  
                  //tombol sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Belum Punya Akun?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>const SignUp()));
                        },
                        child: const Text("SIGN UP"),
                      ),
                    ],
                  ),
                  isLoginTrue? const Text("Username atau Password salah", 
                  style: TextStyle(color: Colors.red),
                  ): const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}