import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:instagram/Basic/Constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  var listP = [
    'p1.png',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: color1,
        body: _getBody(),
      );

  _getBody() => DefaultTabController(
    length: 2,
    child: NestedScrollView(
        headerSliverBuilder: (context, item) => [
              _getImageHeader(),
              _getHeaderContent(),
              _getHeaderHorizontal(),
              _getHeaderBottomTabbar(),
            ],
        body: _getBodyScroll()),
  );

  _getBodyScroll() => Container(
        child: TabBarView(
          children: [
            CustomScrollView(
              slivers: [
                _getStaggeredLayout()
              ],
            ),
            CustomScrollView(
              slivers: [
                _getStaggeredLayout()
              ],
            )
          ],
        ),
      );

  _getHeaderContent() => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              _getSection1(),
              SizedBox(height: 10),
              _getSection2(),
            ],
          ),
        ),
      );

  _getImageHeader() => SliverAppBar(
        // toolbarHeight: 40,
        // pinned: true,
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(top: 16.0,right: 16),
        //     child: Icon(Icons.menu_rounded),
        //   )
        // ],
        backgroundColor: color1,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'images/developer.png',
            fit: BoxFit.cover,
            height: 173,
            width: double.infinity,
          ),
        ),
        expandedHeight: 173,
        bottom: PreferredSize(
          child: Container(
              height: 10,
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)))),
          preferredSize: Size.fromHeight(0.0),
        ),
      );

  _getSection1() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _getImageBoxStory(70.0, [color2, color5], 'me.jpg', 15, false),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'برنامه نویس موبایل',
                    style: TextStyle(
                        color: color4,
                        fontSize: 14,
                        fontFamily: 'SM',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'abolfazl.6s',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: color3,
                        fontSize: 12,
                        fontFamily: 'GM',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Image.asset('images/group96.png')
        ],
      );

  _getSection2() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' ابوالفضل اسکویی هستم برنامه نویس اندروید و فلاتر \n'
            '. من عاشق برنامه نویسی موبایل هستم \n'
            'بیشتر از 2 ساله دارم موبایل کار میکنم و به تکنولوژی\n'
            '. علاقه زیادی دارم',
            textAlign: TextAlign.end,
            style: TextStyle(
                color: color4,
                fontSize: 10,
                fontFamily: 'SM',
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Image.asset('images/group91.png'),
              SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(
                        'https://mstorage2.jobinjacdn.com/records/files/uploads/documents/2dc9888a-7ee6-49cb-a2f1-66a49077fcca.pdf?requester=36332e3134312e34382e313831&resource=753a32343638363334&from=63765f7472616e73&X-Amz-Content-Sha256=e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=oetSom924MQvtCRu9N6vvQ4bt8cG9HSpRnxWU756SyWy5NVt6nTpmfA9aV2b%2F20231018%2F%2Fs3%2Faws4_request&X-Amz-Date=20231018T152000Z&X-Amz-SignedHeaders=host&X-Amz-Expires=1800&X-Amz-Signature=1fc4111b021e769f505d407207591947da85fc421344dd2e28dcc7f85d707a74'));
                  },
                  child: Text(
                    'Link: Resume_M.Mahdi',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                        fontFamily: 'GB',
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset('images/group101.png'),
              SizedBox(width: 6),
              Text('developer',
                  style: TextStyle(
                      color: color3,
                      fontSize: 12,
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w400)),
              SizedBox(
                width: 15,
              ),
              Image.asset('images/group67.png'),
              SizedBox(width: 6),
              Text('IRAN',
                  style: TextStyle(
                      color: color3,
                      fontSize: 12,
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w400)),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text('12',
                  style: TextStyle(
                      color: color4,
                      fontSize: 14,
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 5,
              ),
              Text(
                'Posts',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                    fontFamily: 'GM',
                    fontWeight: FontWeight.w400),
                strutStyle: StrutStyle(),
              ),
              SizedBox(
                width: 15,
              ),
              Text('907',
                  style: TextStyle(
                      color: color4,
                      fontSize: 14,
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 5,
              ),
              Text(
                'Followers',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                    fontFamily: 'GM',
                    fontWeight: FontWeight.w400),
                strutStyle: StrutStyle(),
              ),
              SizedBox(
                width: 15,
              ),
              Text('168',
                  style: TextStyle(
                      color: color4,
                      fontSize: 14,
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 5,
              ),
              Text(
                'Following',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                    fontFamily: 'GM',
                    fontWeight: FontWeight.w400),
                strutStyle: StrutStyle(),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(child: _getFollow()),
              SizedBox(
                width: 20,
              ),
              Expanded(child: _getMessage())
            ],
          ),
          SizedBox(height: 32),
        ],
      );

  _getFollow() => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
            height: 46,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color2,
                ),
                onPressed: () {},
                child: Text(
                  'Follow',
                  style: Theme.of(context).textTheme.headlineMedium,
                ))),
      );

  _getMessage() => Container(
      height: 46,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color3, width: 2)),
      child: Center(
        child: Text(
          'Message',
          style: TextStyle(
            color: color3,
            fontWeight: FontWeight.w400,
            fontFamily: 'GB ',
            fontSize: 16,
          ),
        ),
      ));

  _getHeaderHorizontal() => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        sliver: SliverToBoxAdapter(
          child: SizedBox(
            height: 64,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _getImageBoxStory(
                    64.0,
                    index == 0
                        ? [color4, color4]
                        : [Colors.transparent, Colors.transparent],
                    index == 0 ? 'icon_plus.png' : 'p1.png',
                    15,
                    index == 0 ? true : false)),
          ),
        ),
      );

  _getImageBoxStory(size, color, image, double radius, bool isPlus) => Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Container(
          width: isPlus ? size - 4 : size,
          height: isPlus ? size - 4 : size,
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
            padding: EdgeInsets.all(isPlus ? 4.0 : 0.0),
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular((radius - (radius / 4)).toDouble()),
                child: Image.asset(
                  'images/$image',
                  fit: isPlus ? BoxFit.none : BoxFit.cover,
                )),
          ),
        ),
      );

  _getHeaderBottomTabbar() => SliverPadding(
    padding: EdgeInsets.only(top: 32),
    sliver: SliverPersistentHeader(
          delegate: CustomTabBarDelegate(
            TabBar(
              indicatorColor: color2,
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 17),
              tabs: [
                Tab(
                  icon: Image.asset('images/group73.png'),
                ),
                Tab(
                  icon: Image.asset('images/group124.png'),
                )
              ],
            ),
          ),
          pinned: true,
          floating: true,
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
              QuiltedGridTile(1, 1),
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
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

class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  TabBar tabs;

  CustomTabBarDelegate(TabBar this.tabs);

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
          child: tabs,
              color: color1,
      );

  @override
  double get maxExtent => tabs.preferredSize.height;

  @override
  double get minExtent => tabs.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
