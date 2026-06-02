import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool isCheck = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder()),
          onEditingComplete: () {
            setState(() {});
          },
        ),
        // Checkbox(
        //   value: isCheck,
        //   onChanged: (bool? value) {
        //     setState(() {
        //       isCheck = value!;
        //     });

        //   },

        // ),
        CheckboxListTile.adaptive(
          value: isCheck,
          onChanged: (bool? value) {
            setState(() {
              isCheck = value!;
            });
          },
          title: Text("click me "),
        ),
        // Switch(
        //   value: isSwitched,
        //   onChanged: (bool? value) {
        //     setState(() {
        //       isSwitched = value!;
        //     });
        //   },
        // ),
        SwitchListTile(
          value: isSwitched,
          onChanged: (bool? value) {
            setState(() {
              isSwitched = value!;
            });
          },
          title: Text("on"),
        ),
        Slider.adaptive(label: "100",
        max: 50,
          value: sliderValue,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
            });
            
          },
        ),
      ],
    );
  }
}
