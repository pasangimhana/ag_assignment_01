import 'package:flutter/material.dart';
import 'package:new_project/dashboard.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MedicalReport(),
    );
  }
}

class MedicalReport extends StatefulWidget {
  @override
  _MedicalReportState createState() => _MedicalReportState();
}

class _MedicalReportState extends State<MedicalReport> {
  String patientName = '';
  String patientAge = '';
  String disorderType = '';
  String doctorComment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Patient Name'),
              onChanged: (value) {
                setState(() {
                  patientName = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Patient Age'),
              onChanged: (value) {
                setState(() {
                  patientAge = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Disorder Type'),
              onChanged: (value) {
                setState(() {
                  disorderType = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Therapist\'s Comment', style: TextStyle(fontSize: 18)),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  doctorComment = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 13, 162, 10),
              ),
              onPressed: () {
                // Create and display the medical report here.
                createMedicalReport();
              },
              child: Text('Generate Medical Report'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 227, 117, 15),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                    // Handle navigation to the Dashboard here.
                    // You can use Navigator to navigate to the dashboard page.
                  },
                  child: Text('Go to Dashboard'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 227, 117, 15),
                  ),
                  onPressed: () {
                    // Handle downloading the report here.
                    // You can implement the logic to download the report.
                  },
                  child: Text('Download Report'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void createMedicalReport() {
    // Generate the medical report with the entered information.
    // You can use this function to format and display the report or save it to a file or database.
  }
}
