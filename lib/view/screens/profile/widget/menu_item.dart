import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          Text('$title'),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.pink,
          )
        ],
      ),
    );

    // return Padding(
    //   padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL, horizontal: Dimensions.PADDING_SIZE_DEFAULT),
    //   child: Row(
    //     children: [
    //       SizedBox(
    //           width: Dimensions.PROFILE_PAGE_ICON_SIZE, height: Dimensions.PROFILE_PAGE_ICON_SIZE, child: Image.asset(image, fit: BoxFit.contain)),
    //       SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
    //       Text(title, style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
    //       Spacer(),
    //       Icon(
    //         Icons.arrow_forward_ios_rounded,
    //         size: Dimensions.RADIUS_SIZE_DEFAULT,
    //       ),
    //     ],
    //   ),
    // );
  }
}

class MenuSegment extends StatelessWidget {
  MenuSegment({
    Key key,
    @required this.title,
    @required this.menuItem,
  }) : super(key: key);
  final String title;
  final List<Widget> menuItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '$title',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 8, bottom: 5, top: 4),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: menuItem,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
