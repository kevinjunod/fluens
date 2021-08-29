import 'package:flutter/material.dart';
import 'package:influencrot_flutter/constants.dart';

class Button extends StatelessWidget {
  final String label;
  final Function select;

  Button({
    Key key,
    this.label,
    this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        width: width * .5,
        height: height * .07,
        decoration: BoxDecoration(
          gradient: gradientPrimary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: select,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: colorWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
