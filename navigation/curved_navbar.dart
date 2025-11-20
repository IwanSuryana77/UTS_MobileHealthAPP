import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CurvedNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: Colors.white,
      buttonBackgroundColor: Colors.blue,
      height: 60,
      animationDuration: Duration(milliseconds: 300),
      index: currentIndex,
      items: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.home,
              size: 24,
              color: currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            Text(
              'Home',
              style: TextStyle(
                fontSize: 10,
                color: currentIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 24,
              color: currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            Text(
              'Search',
              style: TextStyle(
                fontSize: 10,
                color: currentIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
        Icon(
          Icons.add,
          size: 30,
          color: currentIndex == 2 ? Colors.white : Colors.grey,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history,
              size: 24,
              color: currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            Text(
              'History',
              style: TextStyle(
                fontSize: 10,
                color: currentIndex == 3 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person,
              size: 24,
              color: currentIndex == 4 ? Colors.white : Colors.grey,
            ),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 10,
                color: currentIndex == 4 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ],
      onTap: onTap,
    );
  }
}
