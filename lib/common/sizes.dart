import 'package:flutter/material.dart';

class Sizes{
  height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  width4dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 100;
  }

  width6dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 70;
  }

  width8dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 54;
  }

  width10dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 41;
  }

  width12dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 34;
  }

  width14dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 29;
  }

  width16dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 26;
  }

  width18dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 23;
  }

  width20dp(BuildContext context) {
    return MediaQuery.of(context).size.width / 20;
  }
}