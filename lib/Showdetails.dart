// ignore: file_names
import 'package:flutter/material.dart';
//import 'package:new_project/dashboard.dart';
import 'package:new_project/patient.dart';
import 'package:new_project/recording.dart';
import 'package:new_project/voicerecordera.dart';
//import 'package:new_project/voicerecordera.dart';
//import 'package:new_project/voicerecordera.dart';

class showdetails extends StatelessWidget {
  final String id, name, tpnumber, birthday, history;

  const showdetails(
      {super.key,
      required this.id,
      required this.name,
      required this.birthday,
      required this.tpnumber,
      required this.history});

  @override
  Widget build(BuildContext context) {
    TextEditingController _id = TextEditingController(text: id);
    TextEditingController _name = TextEditingController(text: name);
    TextEditingController _birthday = TextEditingController(text: birthday);
    TextEditingController _tpnumber = TextEditingController(text: tpnumber);
    TextEditingController _history = TextEditingController(text: history);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Patient Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _id,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "ID Number",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _birthday,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Age",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _tpnumber,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Telephone Number",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _history,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Medical History",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PatientDetails()),
                );
                Align(
                  alignment: Alignment.bottomLeft,
                );
              },
              child: const Text("Edit Profile"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Voice()),
                );
                Align(
                  alignment: Alignment.bottomLeft,
                );
              },
              child: const Text("Get Voice Sample"),
            ),
          ],
        ),
      ),
    );
  }
}
