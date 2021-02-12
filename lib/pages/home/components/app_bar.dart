import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ynov_immo/constants.dart';
import 'package:ynov_immo/pages/real-estate-visits-list/real-estate-visits-list-screen.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RealEstateVisitsScreen();
        }));
      },    ),
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
      IconButton(
        icon: SvgPicture.asset("assets/icons/notification.svg"),
        onPressed: () {},
      ),
    ],
  );
}
