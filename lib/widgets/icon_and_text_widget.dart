import 'package:flutter/cupertino.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  const IconAndText({Key? key , required this.iconData, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(iconData,color: color,),const SizedBox(width: 2,), SmallText(text: text)],);
  }
}
