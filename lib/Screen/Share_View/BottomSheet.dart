import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Basic/Constant.dart';

class BottomSheet_Cus extends StatelessWidget {
  BottomSheet_Cus({super.key, required this.getImageBoxStory});

  Widget getImageBoxStory;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.7,
          minChildSize: .2,
          builder: (context, scroll) => BlurryContainer(
              color: Colors.white70.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(36),
                topLeft: Radius.circular(36),
              ),
              blur: 20,
              child: _getGridViewWithSliver(scroll, context)),
        ),
  );

//The best performance

  _getGridViewWithSliver(scroll, context) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: CustomScrollView(controller: scroll, slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 67,
                    decoration: BoxDecoration(
                        color: color4, borderRadius: BorderRadius.circular(100)),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Share',
                            style: Theme.of(context).textTheme.headlineLarge),
                        Image.asset('images/Group103.png')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  _getSearchBox(context),
                  SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: 100,
                    (context, index) => Column(
                          children: [
                            getImageBoxStory,
                            SizedBox(height: 5,),
                            Text('abolfazl',
                                style: Theme.of(context).textTheme.titleLarge),
                          ],
                        )),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 20,mainAxisExtent: 95),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 90))
          ]),
        ),
      Visibility(
        child: Positioned(
          bottom: 32,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shadowColor: Colors.black
              ),
                onPressed: (){}, child: SizedBox(
                width: 100,
                height: 46,
                child: Center(child: Text('Send',style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)))),
          ),
        ),
      ),
  ]);

  _getSearchBox(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          height: 46,
          child: TextField(
            style: TextStyle(),
            textAlignVertical: TextAlignVertical(y: 1),
            decoration: InputDecoration(
                prefixIcon: Image.asset('images/Group19.png'),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70,width: 2),
                    borderRadius: BorderRadius.circular(13)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color4),
                    borderRadius: BorderRadius.circular(13)),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontFamily: 'GB',
                      color: color4,
                  fontWeight: FontWeight.w500
                )),
          ),
        ),
      );
}
