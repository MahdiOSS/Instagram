import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:instagram/Basic/Constant.dart';
import 'package:instagram/Model/Enums.dart';

import 'UserActivity_Screen.dart';
import 'UserActivity_Screen.dart';

class UserActivity_Screen extends StatefulWidget {
  const UserActivity_Screen({super.key});

  @override
  State<UserActivity_Screen> createState() => _UserActivity_ScreenState();
}

class _UserActivity_ScreenState extends State<UserActivity_Screen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: color1,
        body: SafeArea(child: _getBody()),
      );

  _getBody() => Container(
        child: Column(
          children: [SizedBox(height: 16), _getTabView(), _getTab()],
        ),
      );

  _getTabView() => TabBar(
        controller: tabController,
        labelStyle: Theme.of(context).textTheme.headlineMedium,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 35),
        indicatorWeight: 2,
        indicatorColor: color2,
        tabs: [
          Tab(
            text: 'Following',
          ),
          Tab(
            text: 'You',
          ),
        ],
      );

  _getTab() => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0),
          child: TabBarView(
            controller: tabController,
            children: [
              _getTabView1(),
              _getTabView1(),
            ],
          ),
        ),
      );

  _getTabView1() => CustomScrollView(
        slivers: [
          SliverPadding(padding: EdgeInsets.only(top: 32)),
          _getSection1(),
          SliverPadding(padding: EdgeInsets.only(top: 18)),
          _getItemActivity(true, false,'amirahmadadibi','Started Follow you','2H',itemMode.Message,''),
          _getItemActivity(true, false,'amirahmadadibi','Started Follow you','2H',itemMode.Message,''),
          SliverPadding(padding: EdgeInsets.only(top: 32)),
          _getSection2(),
          SliverPadding(padding: EdgeInsets.only(top: 18)),
          _getItemActivity(false, true,'amirahmadadibi','Started Follow you','2H',itemMode.Follow,''),
          _getItemActivity(false, true,'amirahmadadibi','Started Follow you','2H',itemMode.Follow,''),
          SliverPadding(padding: EdgeInsets.only(top: 32)),
          _getSection3(),
          SliverPadding(padding: EdgeInsets.only(top: 18)),
          _getItemActivity(false, false,'amirahmadadibi','Started Follow you','2H',itemMode.Image,'me.jpg'),
          _getItemActivity(false, false,'amirahmadadibi','Started Follow you','2H',itemMode.Image,'me.jpg'),
        ],
      );

  _getSection1() => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0),
          child: Text(
            'Next',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      );

  _getSection2() => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.0),
      child: Text(
        'Today',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ),
  );

  _getSection3() => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.0),
      child: Text(
        'This week',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ),
  );

  _getTabView2() => CustomScrollView(
        slivers: [SliverPadding(padding: EdgeInsets.only(top: 32))],
      );

  _getItemActivity(
          bool hasNew,
          bool hasStory,
          String userName,
          String description,
          String timeAgo,
          itemMode item,
          String? image) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: hasStory ? 4.0 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (hasNew)
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: color2,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  SizedBox(
                    width: 2,
                  ),
                  _getImageBoxStory(
                      44.0,
                      hasStory
                          ? [color2, color5]
                          : [Colors.transparent, Colors.transparent],
                      'amirahmad.png',
                      12.0),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Text(
                          userName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child:
                        Text(
                          description + ' ' + timeAgo,
                          style: TextStyle(
                            color: color3,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'GM',
                            fontSize: 11,
                          ),
                        ),)
                    ],
                  ),
                ],
              ),
              _getItemActionActivity(item,image)
            ],
          ),
        ),
      );

  _getItemActionActivity(itemMode mode,image) {

        switch(mode){
          case itemMode.Message : return _getMessage();
          case itemMode.Follow : return _getFollow();
          case itemMode.Image : return _getImageBox(image);
        }

  }

  _getMessage() => Container(
      width: 70,
      height: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color3,width: 2)
      ),
      child: Center(
        child: Text(
          'Message',
          style: TextStyle(
            color: color3,
            fontWeight: FontWeight.w400,
            fontFamily: 'GM',
            fontSize: 12,
          ),
        ),
      ));

  _getFollow() => ClipRRect(
    borderRadius: BorderRadius.circular(6),
    child: SizedBox(
        width: 70,
        height: 36,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color2,
            ),
            onPressed: () {},
            child: Text(
              'Follow',
              style: Theme.of(context).textTheme.titleLarge,
            ))),
  );

  _getImageBox(image) => _getImageBoxStory(
      50.0, [Colors.transparent, Colors.transparent], image, 12);

  _getImageBoxStory(size, color, image, double radius) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: GradientBoxBorder(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [color[0], color[1]]),
              width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: ClipRRect(
              borderRadius:
                  BorderRadius.circular((radius - (radius / 4)).toDouble()),
              child: Image.asset('images/$image')),
        ),
      );
}
