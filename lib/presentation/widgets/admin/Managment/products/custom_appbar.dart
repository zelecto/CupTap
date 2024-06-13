import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actionText;
  final Widget? leading;
  final Widget? titleWidget;
  final Color? bgColor;
  final bool showAction;
  final void Function()? onTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.titleWidget,
    this.bgColor = Colors.white,
    required this.showAction,
    this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: bgColor,
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: IconButton(
                            icon: const Icon(Icons.chevron_left,
                                color: Colors.black),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ),
                      ),
                    ),
                if (showAction)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: InkWell(
                      onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: actionText,
                      ),
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
