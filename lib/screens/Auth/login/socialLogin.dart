import 'package:flutter/material.dart';
import 'package:influencrot_flutter/constants.dart';

class SocialLogin extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onPressed;
  SocialLogin({
    this.colors,
    this.iconData,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorPrimary,
        ),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(
            iconData,
            color: colorBackground,
          ),
        ),
      ),
    );
  }
}
