import 'package:flutter/material.dart';

class Searchpatient extends StatefulWidget {
  const Searchpatient({super.key});

  @override
  State<Searchpatient> createState() => _SearchpatientState();
}

class _SearchpatientState extends State<Searchpatient> {
  final TextEditingController _searchId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Patient"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(25),
                child: TextField(
                  controller: _searchId,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Search by Patient NIC",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform the search based on the _searchId.text value
                  String searchedId = _searchId.text;
                  // Add your logic here to search for the patient by ID
                  // You can navigate to a new page to display the patient details
                  // or show the patient details in a dialog, for example.
                },
                child: const Text("Search"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
