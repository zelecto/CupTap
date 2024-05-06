import 'package:cutap/presentation/views/admin/admin_views.dart';
import 'package:cutap/presentation/widgets/admin/custom_button_navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;

  HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = <Widget>[
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
