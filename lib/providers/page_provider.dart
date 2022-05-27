import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollerController = PageController();

  goTo(int index) {
    scrollerController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
