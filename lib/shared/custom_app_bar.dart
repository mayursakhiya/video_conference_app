import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_conference_app/resources/resources.dart';

import 'custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget tabWidget;

  final List<String> _images = [
    Images.image1,
    Images.image2,
    Images.image3,
    Images.image4,
    Images.image5,
    Images.image6,
    Images.image7,
    Images.image8
  ];

  CustomAppBar({Key? key, required this.tabWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.bell_solid,
                            color: accentColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings_rounded,
                            color: accentColor,
                          )),
                    ],
                  ),
                ),
                Text(
                  'Hangouts',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w600, color: accentColor),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: SizedBox(
              width: size.width,
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(65),
                            border: Border.all(
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                                width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(_images[index]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          PreferredSize(
              child: tabWidget, preferredSize: Size.fromHeight(kToolbarHeight))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 201);
}
