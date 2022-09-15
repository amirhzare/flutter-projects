import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/colors.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;
  SmallText({Key? key, this.color=const Color(0xFFCCC7C5), required this.text, this.overFlow=TextOverflow.ellipsis, this.size=12, this.height=1.2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,overflow: overFlow,maxLines: 1,style: TextStyle(color: color, fontFamily: 'Roboto', fontWeight: FontWeight.w400, height: height),);
  }
}


