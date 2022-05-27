import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollerController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollerController = PageController(initialPage: getPageIndex(routeName));
    scrollerController.addListener(() {
      final index = (scrollerController.page ?? 0).round();
      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
      }
    });
  }

  int getPageIndex(String routeName) {
    // ignore: prefer_contains
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    scrollerController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
