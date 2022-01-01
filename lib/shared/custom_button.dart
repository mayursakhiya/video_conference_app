import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  const CustomButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              width: 90.0,
              height: 50.0,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: accentColor, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white38,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
