import 'package:flutter/material.dart';
import 'package:instagram/Basic/Constant.dart';

class Login_Screen extends StatefulWidget {
  Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  //States(var,bool...)

  FocusNode mFocusNode = FocusNode();
  FocusNode mFocusNode2 = FocusNode();

  Color labelColor = color4;
  Color labelColor2 = color4;

  @override
  void initState() {
    super.initState();
    //Add listeners ! this place
    mFocusNode.addListener(() {
      setState(() {
        labelColor = mFocusNode.hasFocus ? color5 : color4;
      });
    });
    mFocusNode2.addListener(() {
      setState(() {
        labelColor2 = mFocusNode2.hasFocus ? color5 : color4;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              //Color(0x323A99), color5 --> Nice
              colors: [Color(0xff323A99), Color(0xffF98BFC)]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _getBody(),
        ),
      );

  _getBody() => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _getContainer1(),
          _getContainer2(),
        ],
      );

  _getContainer1() => Positioned(
        top: 40,
        left: 0,
        right: 0,
        bottom: 0,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('images/rocket1.png'),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      );

  _getContainer2() => Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  SizedBox(
                    height: 42,
                  ),
                  _getMood(),
                  SizedBox(
                    height: 36,
                  ),
                  _getTextField('Email', false, mFocusNode, labelColor),
                  SizedBox(
                    height: 30,
                  ),
                  _getTextField('Password', true, mFocusNode2, labelColor2),
                  SizedBox(
                    height: 32,
                  ),
                  _getElevated(),
                  SizedBox(
                    height: 50,
                  ),
                  _getFooterSection(),
                ],
              ),
            ),
          ),
        ],
      );

  _getMood() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in to',
            style: TextStyle(
                color: color4,
                fontFamily: 'GB',
                fontSize: 20,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 5,
          ),
          Image(image: AssetImage('images/minilogo.png'))
        ],
      );

  _getTextField(label, bool pass, focus, color) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 44,
          width: 340,
          child: TextField(
            style: Theme.of(context).textTheme.headlineSmall,
            obscureText: pass,
            focusNode: focus,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 25),
              labelStyle:
                  TextStyle(color: color, fontSize: 16, fontFamily: 'GB'),
              label: Text(' $label '),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color3, width: 3),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color5, width: 3),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      );

  _getElevated() => ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 129,
        height: 46,
        child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {},
            child: Text(
              'Sign in',
              style: Theme.of(context).textTheme.headlineMedium,
            )),
      ));

  _getFooterSection() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Don\'t have an account? /  ',
            style:
                TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'GB'),
            textAlign: TextAlign.center,
          ),
          Text(
            'Sign Up',
            style:
                TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'GB'),
            textAlign: TextAlign.center,
          )
        ],
      );

  @override
  void dispose() {
    mFocusNode.dispose();
    mFocusNode2.dispose();
    super.dispose();
  }
}
