// To parse this JSON data, do
//
//     final livenessDetectionResult = livenessDetectionResultFromJson(jsonString);

import 'dart:convert';

LivenessDetectionResult livenessDetectionResultFromJson(String str) =>
    LivenessDetectionResult.fromJson(json.decode(str));

String livenessDetectionResultToJson(LivenessDetectionResult data) =>
    json.encode(data.toJson());

class LivenessDetectionResult {
  LivenessDetectionResult({
    required this.attempt,
    required this.detectionResult,
    required this.errorMessage,
    required this.isSuccess,
    required this.totalTimeMilis,
  });

  final int attempt;
  final List<DetectionResult> detectionResult;
  final String errorMessage;
  final bool isSuccess;
  final int totalTimeMilis;

  factory LivenessDetectionResult.fromJson(Map<String, dynamic> json) {
    return LivenessDetectionResult(
      attempt: json["attempt"],
      detectionResult: List<DetectionResult>.from(
          json["detectionResult"].map((x) => DetectionResult.fromJson(x))),
      errorMessage: json["errorMessage"] ?? "",
      isSuccess: json["isSuccess"],
      totalTimeMilis: json["totalTimeMilis"] ?? json["totalTimeMillis"],
    );
  }

  Map<String, dynamic> toJson() => {
        "attempt": attempt,
        "detectionResult":
            List<dynamic>.from(detectionResult.map((x) => x.toJson())),
        "errorMessage": errorMessage,
        "isSuccess": isSuccess,
        "totalTimeMilis": totalTimeMilis,
      };
}

class DetectionResult {
  DetectionResult({
    required this.detectionMode,
    required this.imagePath,
    required this.timeMilis,
  });

  final String detectionMode;
  final String imagePath;
  final int timeMilis;

  factory DetectionResult.fromJson(Map<String, dynamic> json) =>
      DetectionResult(
        detectionMode: json["detectionMode"],
        imagePath: json["imagePath"].toString(),
        timeMilis: json["timeMilis"] ?? 1000,
      );

  Map<String, dynamic> toJson() => {
        "detectionMode": detectionMode,
        "imagePath": imagePath,
        "timeMilis": timeMilis,
      };
}
