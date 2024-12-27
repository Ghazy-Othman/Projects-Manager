//
//
//
import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key, required this.image});
  final String image ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image) ,
          fit: BoxFit.cover
        )
      ),
      child: null,
    ) ;
  }
}
