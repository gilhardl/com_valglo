import 'package:flutter/material.dart';

class MQ {
  static const double smMaxWidth = 576;
  static const double mdMaxWidth = 768;
  static const double lgMaxWidth = 992;
  static const double xlMaxWidth = 1200;
  static const double xxlMinWidth = 1200;

  static bool sm(BuildContext context) =>
      MediaQuery.of(context).size.width < smMaxWidth;

  static bool md(BuildContext context) =>
      MediaQuery.of(context).size.width < mdMaxWidth;

  static bool lg(BuildContext context) =>
      MediaQuery.of(context).size.width < lgMaxWidth;

  static bool xl(BuildContext context) =>
      MediaQuery.of(context).size.width < xlMaxWidth;

  static bool xxl(BuildContext context) =>
      MediaQuery.of(context).size.width >= xxlMinWidth;
}
