import 'package:flutter/material.dart';
import 'package:new_project/voiceu.dart';
import 'package:record/record.dart';

class Voicei extends StatefulWidget {
  const Voicei({super.key});

  @override
  State<Voicei> createState() => _VoiceiState();
}

class _VoiceiState extends State<Voicei> {
  late Record audioRecord;
  bool isRecording = false;
  String audioPath = '';
  int currentSample = 1; // Keeps track of the current sample being recorded.

  @override
  void initState() {
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });

        // Start a timer to stop recording after 4 seconds.
        Future.delayed(const Duration(seconds: 4), () {
          if (isRecording) {
            stopRecording();
          }
        });
      }
    } catch (e) {
      print('Error Start Recording : $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });

      // Move to the next sample if there are more samples to record.
      if (currentSample < 5) {
        setState(() {
          currentSample++;
        });
      } else {
        // All samples are recorded, navigate to the next screen.
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Voiceu()),
        );
      }
    } catch (e) {
      print('Error Stopping record : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Voice Sample (Vowel Sound i)'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  Text(
                    "Voice Samples of Vowel Sound i",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " 'INSTRUCTIONS: Keep the mobile phone 10cm away from the patient, and take 05 voice samples from the vowel sound 'i'. Then click Next>>> '",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: isRecording ? null : startRecording,
                    child: isRecording
                        ? const Text('Recording...')
                        : Text('Start Recording: Sample $currentSample'),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Voiceu()),
                      );
                    },
                    child: const Text("Next >>>"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
