import 'package:flutter/material.dart';

import 'package:mnc_identifier_face/mnc_identifier_face.dart';
import 'package:mnc_identifier_face/model/liveness_detection_result_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LivenessDetectionResult? livenessResult;
  final _mncIdentifierFacePlugin = MncIdentifierFace();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liveness Identifier Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(livenessResult?.toJson().toString() ?? "Data masih kosong"),
              ElevatedButton(
                onPressed: () async {
                  livenessResult =
                      await _mncIdentifierFacePlugin.startLivenessDetection();
                  if (!mounted) return;

                  setState(() {});
                },
                child: const Text("START LIVENESS IDENTIFIER"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
