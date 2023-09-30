import 'package:flutter/material.dart';
import 'package:new_project/Register.dart';
import 'package:new_project/dashboard.dart';
//import 'package:new_project/patient.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  bool _isValidEmail(String email) {
    // Define a regular expression for email validation
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

  void _showLoginSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("You have Successfully Logged in"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Dashboard())); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your Account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formfield,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            } else if (!_isValidEmail(value)) {
                              return "Enter a valid Email";
                            }
                            return null; // No error
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passController,
                          obscureText: passToggle,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passToggle = !passToggle;
                                  });
                                },
                                child: Icon(passToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                /*const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),*/
                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        if (_formfield.currentState!.validate()) {
                          _showLoginSuccessDialog(context);
                          print("Success");
                          emailController.clear();
                          passController.clear();
                        }
                      },
                      color: const Color(0xff0095ff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't Have an Account ?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    /*Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )*/
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

//Create a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
