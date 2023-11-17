import 'package:flutter/material.dart';
import 'package:onlayn_magazin_app/constants/colors.dart';

class ExitAlertDialog extends StatelessWidget {
  final Function() onYpressed;
  final Function() onHpressed;
  const ExitAlertDialog(
      {super.key, required this.onYpressed, required this.onHpressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text(
        'Are you sure you want to exit the app?',
        style: TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.ff192a3a),
              onPressed: onYpressed,
              child: const Text(
                "No",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.ff192a3a),
              onPressed: onHpressed,
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
