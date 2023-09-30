import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class Recording extends StatefulWidget {
  // const Recording({Key? key}) : super(key: key);
  const Recording({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _RecordingState createState() => _RecordingState();
}

class _RecordingState extends State<Recording> {
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioRecord = Record();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      // Handle any potential errors here.
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> playReording() async {
    try {
      Source urlSourse = UrlSource(audioPath);
      await audioPlayer.play(urlSourse);
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recording"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isRecording)
              const Text(
                'Recording Progress',
                style: TextStyle(fontSize: 30),
              ),
            ElevatedButton(
              onPressed: isRecording ? stopRecording : startRecording,
              child: isRecording
                  ? const Text(
                      'Stop Recording',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    )
                  : const Text(
                      'Start Recording A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 3, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal:
                        40), // Adjust the padding here to make the button larger
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: isRecording ? stopRecording : startRecording,
              child: isRecording
                  ? const Text(
                      'Stop Recording',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    )
                  : const Text(
                      'Start Recording I',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 3, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal:
                        40), // Adjust the padding here to make the button larger
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: isRecording ? stopRecording : startRecording,
              child: isRecording
                  ? const Text(
                      'Stop Recording',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    )
                  : const Text(
                      'Start Recording U',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 3, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal:
                        40), // Adjust the padding here to make the button larger
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (!isRecording)
              ElevatedButton(
                onPressed: playReording,
                child: const Text(
                  'Play recording',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff0095ff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
              ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
