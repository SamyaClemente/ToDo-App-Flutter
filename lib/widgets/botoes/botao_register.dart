import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../paginas/login.dart';

class BotaoIconRegister extends StatelessWidget {
  final String icon;
  final String label;
  final double horizontal;

  const BotaoIconRegister({Key? key, required this.icon, required this.label, this.horizontal = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.push(context, PageTransition(child: TelaLogin(), type: PageTransitionType.bottomToTop));
      },
      icon: SvgPicture.asset(
        icon,
        width: 25,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: horizontal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Color(0xffffffff)),
    );
  }
}
