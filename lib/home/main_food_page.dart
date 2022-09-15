import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
    Container(
      margin: const EdgeInsets.only(top: 45, bottom: 15),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child:
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          BigText(color: AppColors.mainColor, text: "IRAN"),
          Row(children: [SmallText(text: "Sari"), const Icon(Icons.arrow_drop_down_rounded)],),],),
        Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15) ,
        color: AppColors.mainColor,),
        child: const Center(child: Icon(Icons.search, color: Colors.white,),),)
        ],),),
      const FoodPageBody()
    ],));
  }
}
