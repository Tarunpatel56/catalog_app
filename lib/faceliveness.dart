import 'package:flutter/material.dart';
import 'package:flutter_face_liveness/flutter_face_liveness.dart';

class FaceLivenessScreen extends StatelessWidget {
  const FaceLivenessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterFaceLiveness(

        // User actions
        actions: [
          LivenessAction.blink,
          LivenessAction.turnLeft,
          LivenessAction.turnRight,
        ],

        // Security configuration
        config: LivenessConfig(
          enableAntiSpoof: true,
          enableVideoReplayDetection: true,
          enableFaceId: true,
          randomizeActions: true,

          // Better performance
          targetFps: 15,

          // Debug info
          showDebugOverlay: false,
        ),

        // Success callback
        onSuccess: (LivenessResult result) {

          debugPrint("SUCCESS");

          debugPrint("Face ID: ${result.faceId}");
          debugPrint("Confidence: ${result.confidenceScore}");
          debugPrint("Replay Attack: ${result.videoReplayDetected}");
          debugPrint("Spoof Detected: ${result.spoofDetected}");

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Face Verification Success"),
            ),
          );

          Navigator.pop(context);
        },

        // Failure callback
        onFailed: (String reason) {

          debugPrint("FAILED: $reason");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(reason),
            ),
          );
        },
      ),
    );
  }
}