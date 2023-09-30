import 'package:flutter/material.dart';
import 'package:new_project/Diagnosisreport.dart';

class Classifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VoiceRecordingsList(),
    );
  }
}

class VoiceRecordingsList extends StatefulWidget {
  @override
  _VoiceRecordingsListState createState() => _VoiceRecordingsListState();
}

class _VoiceRecordingsListState extends State<VoiceRecordingsList> {
  // List of 15 voice recordings, where true represents Healthy and false represents Pathology.
  final List<bool> voiceRecordings =
      List.generate(15, (index) => index % 2 == 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Sample Collector'),
      ),
      body: ListView.builder(
        itemCount: voiceRecordings.length,
        itemBuilder: (context, index) {
          final isHealthy = voiceRecordings[index];
          return ListTile(
            title: Text('Recording ${index + 1}'),
            subtitle: Text(isHealthy ? 'Healthy' : 'Pathology'),
            trailing: isHealthy
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Diagnose the disorder here when the recording is Pathology.
                      diagnoseDisorder(index);
                    },
                    child: Text('Diagnose'),
                  ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            style:
            ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 9, 174, 25),
            );
            // Navigate to the Diagnosis Report page here.
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Report(),
            ));
          },
          child: Text('Make the Diagnosis Report'),
        ),
      ),
    );
  }

  // Function to diagnose the disorder for a specific recording.
  void diagnoseDisorder(int recordingIndex) {
    // Implement your diagnosis logic here.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Diagnosis Result'),
          content: Text('Diagnosing Recording ${recordingIndex + 1}...'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog.
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
