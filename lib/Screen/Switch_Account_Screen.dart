import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/Basic/Constant.dart';

class Switch_Account_Screen extends StatefulWidget {
  const Switch_Account_Screen({super.key});

  @override
  State<Switch_Account_Screen> createState() => _Switch_Account_ScreenState();
}

class _Switch_Account_ScreenState extends State<Switch_Account_Screen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/pattern1.png'),
              repeat: ImageRepeat.repeat),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _getBody(),
        ),
      );

  _getBody() => Container(
        child: Stack(
          alignment: AlignmentDirectional.center,
            children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_getImageBackgroundSection(), _getFooterSection()],
          ),
          _getCenterSection(),
        ]),
      );

  _getFooterSection() => Padding(
        padding: const EdgeInsets.only(bottom: 63, top: 132.38),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Don\'t have an account? /  ',
              style: TextStyle(color: Colors.grey, fontSize: 15,fontFamily: 'GB'),
              textAlign: TextAlign.center,
            ),
            Text(
              'Sign Up',
              style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'GB'),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );

  _getImageBackgroundSection() => Expanded(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/shapes.png'), fit: BoxFit.cover)),
        ),
      );

  _getCenterSection() => Positioned(
    top: 242,
    child: Center(

            child: BlurryContainer(
              blur: 1000,
              color: Colors.blueGrey.withOpacity(0.2),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 120
                    )
                  ]
                ),
                child: Container(
                  width: 320,
                  height: 340,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Colors.grey.withOpacity(0.9),
                        Colors.grey.withOpacity(0.6),
                        Colors.grey.withOpacity(0.5),
                        Colors.grey.withOpacity(0.4),
                        Colors.blueGrey.withOpacity(0.1),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: AssetImage('images/me.jpg'),
                          width: 129,
                          height: 129,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.3),
                              blurRadius: 5,
                              blurStyle: BlurStyle.normal
                            )
                          ]
                        ),
                        child: Text(
                          'MoMahdi_A.Oskooii',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(height: 20),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: 129,
                          height: 46,
                          child: ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: (){},
                            child: Text('Confirm',style: Theme.of(context).textTheme.headlineMedium),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      Text(
                        'switch account',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ),
  );
}
