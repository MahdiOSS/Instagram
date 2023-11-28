import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Basic/Constant.dart';

class Explore_Screen extends StatefulWidget {
  const Explore_Screen({super.key});

  @override
  State<Explore_Screen> createState() => _Explore_ScreenState();
}

class _Explore_ScreenState extends State<Explore_Screen> {

  var filters = [
    'All', 'Account', 'Caption', 'Story', 'Comment', 'Others'
  ];

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: color1,
        body: SafeArea(
          child: _getBody(),
        ),
      );

  _getBody() =>
      Container(
        child: CustomScrollView(
          slivers: [
            _getSearchBox(context),
            _getHorizontalFilterMode(),
            _getStaggeredLayout()
          ],
        ),
      );

  _getSearchBox(context) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: ColoredBox(
              color: Color(0xff272b40),
              child: SizedBox(
                height: 46,
                child: TextField(
                  style: TextStyle(),
                  textAlignVertical: TextAlignVertical(y: 0),
                  decoration: InputDecoration(
                      suffixIcon: Image.asset('images/group55.png'),
                      prefixIcon: Image.asset('images/Group19.png'),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                          fontSize: 13,
                          fontFamily: 'GB',
                          color: color4,
                          fontWeight: FontWeight.w500
                      )),
                ),
              ),
            ),
          ),
        ),
      );

  _getHorizontalFilterMode() =>
      SliverToBoxAdapter(
        child: SizedBox(
          height: 24,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) => _getFilterItem(filters[index])),
        ),
      );

  _getFilterItem(String sort) =>
      Padding(
        padding: EdgeInsets.only(left: 17.0),
        child: Container(
          width: 60,
          height: 23,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff272b40)
          ),
          child: Center(child: Text(sort, style: Theme
              .of(context)
              .textTheme
              .titleSmall)),
        ),
      );

  _getStaggeredLayout() =>
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 17,vertical: 20),
        sliver: SliverGrid(
          gridDelegate: SliverQuiltedGridDelegate(
            mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 3, pattern: [
            QuiltedGridTile(2,1),
            QuiltedGridTile(2,2),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(2,2),
            QuiltedGridTile(2,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
            QuiltedGridTile(1,1),
          ]),
          delegate: SliverChildBuilderDelegate((context, index) =>  _getItemStaggered())),
      );

  _getItemStaggered() => Container(
    decoration: BoxDecoration(
        color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(4)
    ),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset('images/me.jpg',fit: BoxFit.cover,)),
  );

}
