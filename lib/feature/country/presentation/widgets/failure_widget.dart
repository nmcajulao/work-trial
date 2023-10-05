import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(EvaIcons.alertTriangle),
        SizedBox(
          height: 5,
        ),
        Text(
          "An error has occured. Please contact the developer for this matter!",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
