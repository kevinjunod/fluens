import 'package:flutter/material.dart';

const baseurl = 'http://188.166.227.76:3000/api/v1/'; //uri API

const colorPrimary = Color(0xffFFC107);
const colorLightPrimary = Color(0xffffecb3);
const colorDarkPrimary = Color(0xffffa000);
const colorSecondary = Color(0xff00BCD4);
const colorText = Color(0xff080808);
const colorGreyText = Color(0xff696969);
const colorBackground = Color(0xfff5f5f5);
const colorBlack = Color(0xff000000);
const colorWhite = Color(0xffFFFFFF);

enum accountType { INFLUENCER, BRAND }

final Shader gradient = LinearGradient(
  colors: <Color>[colorPrimary, colorWhite],
).createShader(Rect.fromLTRB(0, 100, 0, 70));

final gradientPrimary = LinearGradient(
  colors: <Color>[colorPrimary, colorDarkPrimary],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
