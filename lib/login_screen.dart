import 'package:catalog_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_liveness/flutter_face_liveness.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFaceScreen extends StatelessWidget {
  const LoginFaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterFaceLiveness(

        actions: [
          LivenessAction.blink,
          LivenessAction.turnRight,
        ],

        config: LivenessConfig(
          enableFaceId: true,
          enableAntiSpoof: true,
          enableVideoReplayDetection: true,
        ),

        onSuccess: (result) async {

          SharedPreferences prefs =
              await SharedPreferences.getInstance();

          String? savedFaceId =
              prefs.getString("saved_face_id");

          String? currentFaceId =
              result.faceId;

          // MATCH
          if(savedFaceId == currentFaceId){

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            );

          }else{

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Face Not Matched"),
              ),
            );
          }
        },

        onFailed: (reason) {

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