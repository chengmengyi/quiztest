import 'package:flutter/material.dart';

class ImageView extends StatelessWidget{
  String imagesName;
  double? width;
  double? height;
  BoxFit? fit;
  ImageView({
    required this.imagesName,
    this.width,
    this.height,
    this.fit
  });

  @override
  Widget build(BuildContext context) => Image.asset(
    "images/$imagesName.png",
    width: width,
    height: height,
    fit: fit,
  );
}