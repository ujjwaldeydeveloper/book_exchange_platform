import 'package:book_exchange_platform/config/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'firebase_options.dart';
import 'home_page.dart';

// import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: const MyApp(),
    ),
  );
}

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
