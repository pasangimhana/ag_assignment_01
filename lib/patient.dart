import 'package:flutter/material.dart';
import 'package:new_project/Showdetails.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Voice Disorder",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _tpnumber = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _history = TextEditingController();

  // Define three boolean variables to track the checkboxes' state.
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Enter Patient Detail"),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _id,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter NIC"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Name with Initials"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _birthday,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Age"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _tpnumber,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Contact Number"),
              ),
            ),
            // Checkbox for Medical History
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Medical History",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                      ),
                      Text("Pressure"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                      Text("Heart Problems"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                      ),
                      Text("Cholesterol"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                      ),
                      Text("Allergies"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                      ),
                      Text("Other"),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => showdetails(
                      id: _id.text,
                      name: _name.text,
                      birthday: _birthday.text,
                      tpnumber: _tpnumber.text,
                      history:
                          "${isChecked1 ? 'Pressure, ' : ''}${isChecked2 ? 'Heart Problems, ' : ''}${isChecked3 ? 'Cholesterol' : ''}${isChecked1 ? 'Allergies, ' : ''}${isChecked1 ? 'Other, ' : ''}",
                    ),
                  ),
                );
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
