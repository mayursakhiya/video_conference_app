import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:video_conference_app/resources/resources.dart';
import 'package:video_conference_app/shared/custom_button.dart';
import 'package:video_conference_app/shared/custom_colors.dart';

import 'shared/custom_app_bar.dart';
import 'shared/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Hangout',
      theme: customTheme(context),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          tabWidget: TabBar(
              tabs: [
                Tab(
                  text: 'Upcoming',
                ),
                Tab(text: 'Past'),
                Tab(text: 'Canceled'),
              ],
              labelStyle:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
              indicatorSize: TabBarIndicatorSize.label,
              //makes it better
              labelColor: Colors.red,
              //Google's sweet blue
              unselectedLabelColor: accentColor,
              //niceish grey
              isScrollable: true,
              //up to your taste

              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 3,
                  indicatorColor: accentColor,
                  indicatorSize: MD2IndicatorSize.tiny)),
        ),
        body: TabBarView(
          children: [
            UpcomingView(),
            PastView(),
            CanceledView(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          child: Center(
            child: Icon(
              Icons.add_box_rounded,
              color: accentColor,
            ),
          ),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45), color: Colors.amber),
        ),
      ),
    );
  }
}

class UpcomingView extends StatelessWidget {
  UpcomingView({Key? key}) : super(key: key);

  final List<String> _images = [
    'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
    'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
            padding: EdgeInsets.only(left: 16, bottom: 74, right: 16, top: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetialsView())),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          colors: gradientColors.call(),
                          begin: index.isEven
                              ? Alignment.bottomRight
                              : Alignment.topRight,
                          end: index.isEven
                              ? Alignment.topLeft
                              : Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wed, 15 Feb, 4PM - 5PM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Daily meeting with team',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: accentColor, fontSize: 18),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            FlutterImageStack(
                              imageList: _images,
                              showTotalCount: true,
                              totalCount: 3,
                              itemRadius: 60,
                              // Radius of each images
                              itemCount: 3,
                              // Maximum number of images to be shown in stack
                              itemBorderWidth:
                                  3, // Border width around the images
                            ),
                            Spacer(),
                            CustomButton(onPressed: () {}, label: 'Join')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (__, _) => SizedBox(
                  height: 15,
                ),
            itemCount: 2),
      ),
    );
  }
}

class PastView extends StatelessWidget {
  const PastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class CanceledView extends StatelessWidget {
  const CanceledView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class EventDetialsView extends StatelessWidget {
  EventDetialsView({Key? key}) : super(key: key);

  final List<String> _image = [
    Images.image1,
    Images.image2,
    Images.image3,
    Images.image4,
    Images.image5,
    Images.image6,
    Images.image7,
    Images.image8
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: accentColor,
        body: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(45)),
                  child: Image.asset(
                    _image[Random().nextInt(_image.length)],
                    width: size.width,
                    height: size.height / 1.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 50,
                  height: 7,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45)),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Colors.white.withOpacity(.3)),
                      borderRadius: BorderRadius.circular(45)),
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Colors.white.withOpacity(.3)),
                              borderRadius: BorderRadius.circular(45)),
                        ),
                        Text(
                          'Design system',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white),
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(.3),
                          child: Icon(
                            Icons.person,
                            color: accentColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 4,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 2,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 2,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 1,
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(0)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.chevron_left,
                              color: primaryColor,
                            ),
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white30, width: 4),
                              borderRadius: BorderRadius.circular(45)),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Feather.send,
                            color: primaryColor,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30, width: 4),
                            borderRadius: BorderRadius.circular(45)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.more_vert,
                            color: primaryColor,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30, width: 4),
                            borderRadius: BorderRadius.circular(45)),
                      )
                    ],
                  )),
            ),
            Positioned(
              top: size.height / 1.5,
              left: 0,
              right: 0,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container(
                      width: 250,
                      height: 60.0,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Ionicons.md_videocam,
                                color: accentColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                FontAwesome.microphone,
                                color: accentColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                CupertinoIcons.person_2_fill,
                                color: accentColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Transform.rotate(
                                angle: pi / 2,
                                child: Icon(
                                  Icons.call,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
