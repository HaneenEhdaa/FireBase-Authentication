import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_shoppingapp/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_shoppingapp/views/products_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignUpState();
}

class _SignUpState extends State<Login> {
  bool hiddenpass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? errorMessage;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF954535)),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  errorMessage = "Email cannot be empty !";

                  return "Email cannot be empty !";
                }
                if (!value.contains('@')) {
                  errorMessage = "Email must contain '@' ";

                  return "Email must contain '@' ";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              controller: passController,
              obscureText: hiddenpass,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  errorMessage = "Password must be more than 6 characters !";

                  return "Password must be more than 6 characters !";
                }
              },
              decoration: InputDecoration(
                  labelText: "password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      togglePassword();
                    },
                    icon: Icon(
                        hiddenpass ? Icons.visibility : Icons.visibility_off),
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FilledButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text,
                          );
                          if (credential.user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyProductCard()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Failed Login check your email or password"),
                              backgroundColor: Colors.red,
                            ));
                          }
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Failed Login check your email or passwordr"),
                            backgroundColor: Colors.red,
                          ));
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF954535),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FilledButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF954535),
                      ),
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  togglePassword() {
    hiddenpass = !hiddenpass;
    setState(() {});
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
