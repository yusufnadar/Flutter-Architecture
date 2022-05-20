import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_project/constants/theme/theme.dart';

class AlreadyAccount extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String subtext;

  const AlreadyAccount({Key? key, required this.onTap, required this.text, required this.subtext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '$text ', style: regularFontStyle()),
            TextSpan(
              text: subtext,
              style: mediumFontStyle(),
              recognizer: TapGestureRecognizer()
                ..onTap = () => onTap(),
            ),
          ],
        ),
      ),
    );
  }
}
