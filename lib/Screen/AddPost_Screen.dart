import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/Basic/Constant.dart';

class AddPost_Screen extends StatefulWidget {
  const AddPost_Screen({super.key});

  @override
  State<AddPost_Screen> createState() => _AddPost_ScreenState();
}

class _AddPost_ScreenState extends State<AddPost_Screen> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: color1,
        body: SafeArea(child: _getBody()),
      );

  _getBody() =>
      Container(
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
        Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
          child:
          CustomScrollView(
              slivers: [
                SliverPadding(padding: EdgeInsets.only(top: 32)),
                _getHeaderSection(),
                SliverPadding(padding: EdgeInsets.only(top: 25)),
                _getSelectImage('me.jpg'),
                _getPostsItem()
              ],
            ),),
              Positioned(child: _getBottomSheet())
          ]),
      );

  _getHeaderSection() =>
      SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Post', style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,),
                SizedBox(width: 15,),
                Image.asset('images/bottomArrow.png')
              ],
            ),
            Row(
              children: [
                Text('Next', style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,),
                SizedBox(width: 15,),
                Image.asset('images/group66.png')
              ],
            )
          ],
        ),
      );

  _getSelectImage(image) => SliverToBoxAdapter(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset('images/$image',height: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
    ),
  );

  _getPostsItem() =>
      SliverPadding(
        padding: EdgeInsets.only(top: 5),
        sliver: SliverGrid(delegate: SliverChildBuilderDelegate((context, index) =>
            _getPostItem()),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5)),
      );

  _getPostItem() => Container(
    decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(4)
    ),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset('images/me.jpg',fit: BoxFit.cover,)),
  );

  _getBottomSheet() => Container(
    decoration: BoxDecoration(
  color: Color(0xff272b40),
  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
    ),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Draft',style: _Style_H4(color2),),
        Text('Gallery',style: _Style_H4(color4),),
        Text('Take',style: _Style_H4(color4),),
      ],
    ),
  );

  _Style_H4(color) => TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'GB',
      fontWeight: FontWeight.w500
  );

}
