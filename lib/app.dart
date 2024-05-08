import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [CustomAppBar()],
          ),
          // SliverLayoutBuilder(builder: builder),
          // SliverConstrainedCrossAxis(maxExtent: maxExtent, sliver: sliver),
          SliverFillRemaining(child: MyHomePage()),
        ],
      );
  }
}
