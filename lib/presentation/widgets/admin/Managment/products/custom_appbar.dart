import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? titleWidget;

  const CustomAppBar(
      {super.key, required this.title, this.leading, this.titleWidget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 2.5),
        child: Stack(
          children: [
            Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)))
                    : Center(child: titleWidget)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(
                        color: Colors.black,
                      ),
                    )
              ],
            )
          ],
        ),
      ),
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
