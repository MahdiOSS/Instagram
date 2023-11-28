import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) => Container(
        decoration: _getDecor(),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _getBody(),
        ),
      );

  _getDecor() => BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/pattern1.png'),
            repeat: ImageRepeat.repeat),
      );

  _getBody() => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Center(
        child: Image.asset(
          "images/Startlogo.png",
          width: 155.8109893798828,
          height: 77,
        ),
      ),
      Positioned(
        bottom: 32,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('From',style: TextStyle(color: Colors.grey.shade700,fontSize: 12,
              fontWeight: FontWeight.w500,),),
            SizedBox(height: 2,),
            Text('Expert Flutter',style: TextStyle(color: Colors.cyan,fontSize: 14,
              fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
          ],
        ),
      ),
    ],
  );

}
