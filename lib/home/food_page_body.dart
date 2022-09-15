import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  var _scaleFactor = 0.8;
  double _height =220;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {setState(() {
      _currPageValue = pageController.page!;
      // print(_currPageValue.toString());
    });});
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.all(0),
        child: PageView.builder(
         controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
          return _buildPageItem(position);
        }),);
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()){
        var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      // print('$currScale index:$index _currPageValue:$_currPageValue');
      print('$currScale index:$index _currPageValue:$_currPageValue');
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }else {
      var currScale=0.8;
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,  0);
    }
    return Transform(transform: matrix, child:   Stack(children: [
      Container(height: 220, margin: const EdgeInsets.all(5),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xFF89DAD0),image: const DecorationImage(image: AssetImage("assets/images/food_1.jpg"), fit: BoxFit.fitWidth)),),
      Align(alignment: Alignment.bottomCenter,
        child: Container(height: 120,margin: const EdgeInsets.only(right: 30, left: 30, bottom: 15),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xFFFFFFFF),),
          child: Container(padding: const EdgeInsets.all(15.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,children: [
              BigText(text: "Desert"),
              const SizedBox(height: 10),
              Row(children: [
                Wrap(children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor,size: 15,)),),
                const SizedBox(width: 5,),
                SmallText(text: "4.5"),
                const SizedBox(width: 10,),
                SmallText(text: "1278"),
                const SizedBox(width: 5,),
                SmallText(text: "comments")
              ],),
              Row( children: const [IconAndText(iconData: Icons.circle_sharp, text: "Normal", color: Colors.orangeAccent,),
                SizedBox(width: 15,),
                IconAndText(iconData: Icons.location_on, text: "1.7 km", color: Colors.blue,),
                SizedBox(width: 15,),
                IconAndText(iconData: Icons.lock_clock, text: "32 min", color: Colors.lightGreenAccent,),
              ],),


            ],),) ,)
        ,)


    ],) ,);
   }
}
