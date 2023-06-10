import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_application_1/widgets/paginas/login.dart';

class BotaoIcon extends StatelessWidget {
  final String icon;
  final String label;
  final double horizontal;

  const BotaoIcon({Key? key, required this.icon, required this.label, this.horizontal = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.push(context, PageTransition(child: TelaLogin(), type: PageTransitionType.bottomToTop));
      },
      icon: SvgPicture.asset(
        icon,
        width: 25,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: horizontal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Color(0xff3e977a)),
    );
  }
}
