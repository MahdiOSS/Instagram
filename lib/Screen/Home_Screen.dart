import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/Basic/Constant.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:instagram/Model/Post.dart';
import 'package:instagram/Model/Story.dart';
import 'package:instagram/Screen/Share_View/BottomSheet.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<Post> listPost = [
    Post('1.2K', '2.5K', 'amir.png', false, 'مدرس و برنامه نویس موبایل',
        'amirahmadadibi', 'amirahmad.png'),
    Post('14', '577', 'me.jpg', false, 'Mobile Developer', 'abolfazl.6s',
        'me.jpg'),
    Post('2.8K', '4.7K', 'pp.png', false, 'Photographer', 'Mahdi.Hesseini',
        'pr7.png'),
  ];

  List<Story> listStory = [
    Story('Your story', true, 64, [color4, color4], 'icon_plus.png'),
    Story('Abolfazl.6s', true, 64, [color2, color5], 'me.jpg'),
    Story('Mary_Elizabeth', true, 64, [color2, color5], 'pr1.png'),
    Story('Liz.Smith', true, 64, [color2, color5], 'pr3.png'),
    Story('Jim.Brown', true, 64, [color2, color5], 'pr4.png'),
    Story('Ada_María', true, 64, [color2, color5], 'pr5.png'),
    Story('guerrero.Pérez', true, 64, [color2, color5], 'pr6.png'),
    Story('Mahdi.Hosseini', true, 64, [color2, color5], 'pr7.png'),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color1, systemNavigationBarColor: color1));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: color1,
        appBar: _getAppbar(),
        body: SafeArea(
          child: _getBody(),
        ),
      );

  _getAppbar() => AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 150,
        toolbarHeight: 90,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 34.0, bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 17),
              Text('M',
                  style: TextStyle(
                      color: color4,
                      fontSize: 24,
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 2,
              ),
              Image(image: AssetImage('images/vector.png')),
              SizedBox(
                width: 2,
              ),
              Text('dinger',
                  style: TextStyle(
                      color: color4,
                      fontSize: 24,
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: 32,
              height: 32,
              child: Icon(Icons.groups),
            ),
          ),
          SizedBox(
            width: 17,
          ),
        ],
      );

  _getBody() => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _getStory(),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 16)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _getPost(
                  listPost[index],
                ),
              ),
            ),
          )
        ],
      );

  _getStory() => SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listStory.length,
            itemBuilder: (context, index) => _getYourStory(listStory[index],index == 0 ? true : false),
          ),
        ),
      );

  _getYourStory(Story story,bool isPlus) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(right: story.setSpace ? 14 : 0),
              child: _getImageBoxStory(story.size, story.color, story.img, 20,isPlus)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: SizedBox(
              width: 60,
              child: Text(
                story.name,
                style: TextStyle(
                  color: color4,
                  fontSize: 10,
                  fontFamily: 'GM',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      );

  _getImageBoxStory(size, color, image, double radius,bool isPlus) => Container(
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
              child: Image.asset('images/$image',fit: isPlus ? BoxFit.none : BoxFit.cover,)),
        ),
      );

  _getPost(Post post) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  _getImageBoxStory(
                      44.0, [color3, color1], post.profileImg, 50,false),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.userId,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        post.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.more_vert_rounded,
                color: color4,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(children: [
            Stack(alignment: AlignmentDirectional.topEnd, children: [
              SizedBox(
                height: 394,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset( 
                    'images/${post.uriPost}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 15,
                child: Icon(Icons.image_rounded, color: color4),
              )
            ]),
            Container(
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0x7fffffff), Color(0x33ffffff)],
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 29, child: Image.asset('images/like.png')),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        post.likeCount.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 31, child: Image.asset('images/comment.png')),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        post.commentCount.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) => _getBottomSheet());
                    },
                    child: SizedBox(
                      width: 29,
                      child: Image.asset('images/send1.png'),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(width: 29, child: Image.asset('images/save.png')),
                  ),
                ],
              ),
            )
          ]),
          SizedBox(height: 32)
        ],
      );

  _getBottomSheet() => BottomSheet_Cus(
        getImageBoxStory: _getImageBoxStory(
            60.0, [Colors.transparent, Colors.transparent], 'amir.png', 12.0,false ),
      );

}
