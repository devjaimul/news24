
import 'package:flutter/material.dart';
import 'colors.dart';

class HeadingTwo extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? backGroundColor;
  final bool? isTrue ;
  const HeadingTwo({
    super.key, required this.data, this.fontWeight, this.fontSize, this.color, this.backGroundColor, this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: 1,
      style: TextStyle(
        color: color ?? AppColors.secondaryColor,
        fontSize: fontSize ??  25,
        fontWeight: fontWeight?? FontWeight.w500,
        backgroundColor: backGroundColor,
        decoration:isTrue==true? TextDecoration.underline:TextDecoration.none,
        overflow: TextOverflow.ellipsis,
      ),

    );
  }
}

class HeadingThree extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? backGroundColor;
  const HeadingThree({
    super.key, required this.data, this.fontWeight, this.fontSize, this.color, this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color ?? AppColors.secondaryColor,
        fontSize: fontSize ??  14,
        fontWeight: fontWeight?? FontWeight.w500,
        backgroundColor: backGroundColor,

      ),
    );
  }
}
class HeadingFour extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? number;

  final Color? backGroundColor;
  const HeadingFour({
    super.key, required this.data, this.fontWeight, this.fontSize, this.backGroundColor, this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(

        fontSize: fontSize ??  15,
        fontWeight: fontWeight?? FontWeight.w500,
        backgroundColor: backGroundColor,
          overflow:number==1? TextOverflow.ellipsis:null
      ),
      maxLines: number,

    );
  }
}


