
import 'package:book_exchange_platform/home_page.dart';
import 'package:flutter/material.dart';

import '../pages/shop_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MyHomePage());

      case '/shop':
        return _materialRoute(ShopPage());

      // case '/SavedArticles':
      //   return _materialRoute(const SavedArticles());
        
      default:
        return _materialRoute(const MyHomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
