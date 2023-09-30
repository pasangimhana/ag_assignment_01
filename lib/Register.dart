import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? confirmPasswordError;

  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final idController = TextEditingController();
  final NameController = TextEditingController();
  final ConfirmpassController = TextEditingController();
  final TPnumberController = TextEditingController();
  final PlaceController = TextEditingController();
  bool passToggle = true;
  bool _isValidEmail(String email) {
    // Define a regular expression for email validation
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

  Future<void> insertrecord() async {
    try {
      String uri = "http://127.0.0.1:3308/Newproject_api/insert_record.php";

      var res = await http.post(Uri.parse(uri), body: {
        "TherapistID": idController.text,
        "name": NameController.text,
        "email": emailController.text,
        "password": passController.text,
        "confirmpassword": ConfirmpassController.text,
        "tpnumber": TPnumberController.text,
        "workplace": PlaceController.text
      });

      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Record Inserted");
      } else {
        print("Some Issue");
      }
    } catch (e) {
      print(e);
    }
  }

  void _showLoginSuccessDialog(BuildContext context) {
    if (_formfield.currentState!.validate()) {
      if (passController.text != ConfirmpassController.text) {
        setState(() {
          confirmPasswordError = "Passwords do not match";
        });
      } else {
        setState(() {
          confirmPasswordError = null;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("You have Successfully Registered in"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginpage(),
                      ),
                    ); // Close the dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
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
                      "Register",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create Account",
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
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: idController,
                          decoration: InputDecoration(
                            labelText: "TherapistID",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter ID";
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: NameController,
                          decoration: InputDecoration(
                            labelText: "Name With Initials",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter ID";
                            }
                          },
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
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
                              return "Enter Password";
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: ConfirmpassController,
                          obscureText: passToggle,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
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
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else if (value != passController.text) {
                              return "Passwords do not match";
                            }
                            return null; // No error
                          },
                        ),
                        Text(
                          confirmPasswordError ?? '',
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: TPnumberController,
                          decoration: InputDecoration(
                            labelText: "Telephone Number",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter NB";
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: PlaceController,
                          decoration: InputDecoration(
                            labelText: "Work Place/ Hospital",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter ID";
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
                        insertrecord();
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
                        "Register",
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
                      "Already Have an Account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()));
                        },
                        child: Text(
                          "Login",
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
