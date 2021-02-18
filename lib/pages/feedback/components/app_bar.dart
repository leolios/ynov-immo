import 'package:flutter/material.dart';
import 'package:ynov_immo/constants.dart';

AppBar feedbackAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Ynov",
            style: TextStyle(color: ksecondaryColor),
          ),
          TextSpan(
            text: "Immo",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
    actions: <Widget>[
    ],
  );
}