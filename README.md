# mnc_identifier_face






![banner liveness](/screenshots/banner_liveness.jpeg)

Flutter package for liveness detection using mlkit face recognition to detect live person present at the point of capture.

## Installation
---
### Android

This plugin requires Android SDK 21 or higher.


### iOS

This plugin requires iOS 11.0 or higher.

Add this code to your Info.plist 

```
    <key>NSPhotoLibraryUsageDescription</key>               
	<string>(Reason to use Photo Library)</string> 
	<key>NSCameraUsageDescription</key> <!-- added this for camera permission -->
	<string>(Reason to use camera access)</string>
```

## Usage


```dart
import 'package:mnc_identifier_face/mnc_identifier_face.dart';
import 'package:mnc_identifier_face/model/liveness_detection_result_model.dart';

...

 Future<void> startDetection() async {
    try {
      LivenessDetectionResult livenessResult =
                      await MncIdentifierFace().startLivenessDetection();
      debugPrint("result is $livenessResult");
    } catch (e) {
      debugPrint('Something goes unexpected with error is $e');
    }
  }
```

## Bugs or Contributing

If you encounter any problems feel free to open an issue. If you feel the library is missing a feature, please raise a ticket. Pull request are also welcome.



