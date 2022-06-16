import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mnc_identifier_face/model/liveness_detection_result_model.dart';

class MncIdentifierFace {
  final MethodChannel _methodChannel =
      const MethodChannel("mnc_identifier_face");

  Future<LivenessDetectionResult> startLivenessDetection() async {
    try {
      var livenessResultRawData =
          await _methodChannel.invokeMethod("startLivenessDetection");
      LivenessDetectionResult livenessDetectionResult =
          LivenessDetectionResult.fromJson(jsonDecode(livenessResultRawData));
      return livenessDetectionResult;
    } catch (e) {
      rethrow;
    }
  }
}
