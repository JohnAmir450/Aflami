import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/material.dart';

class CustomListViewMovie extends StatelessWidget {
  final double height;
  final double? width;
  final String title;
  final Widget listItem;
  const CustomListViewMovie({
    super.key, required this.height, required this.title, required this.listItem, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.font20WhiteSemiBold,
          ),
          SizedBox(
            height: height,
            width: width,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => listItem ,
            ),
          ),
        ],
      ),
    );
  }
}