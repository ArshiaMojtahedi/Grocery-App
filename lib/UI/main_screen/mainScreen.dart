import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:grocery_app/UI/home/homeScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _tabController;

  int _tab = 1;
  // List<String> title = ["Activities", "Home", "Blog"];

  @override
  void initState() {
    super.initState();
    _tabController = new PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new HomeScreen(),
          new HomeScreen(),
          new HomeScreen(),
          new HomeScreen(),
          new HomeScreen(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        backgroundColor: Colors.white,
        snakeShape: SnakeShape.indicator,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        snakeViewColor: Colors.white,
        selectedItemColor: Color(0xFF53B175),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _tab,
        onTap: onTap,
        elevation: 10,
        shadowColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: _tab == 0
                    ? Image.asset(
                        "assets/images/tab_cart_on.png",
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_cart_off.png",
                        height: 24,
                      ),
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: _tab == 1
                    ? Image.asset(
                        "assets/images/tab_explore_on.png",
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_explore_off.png",
                        height: 24,
                      ),
              ),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: _tab == 2
                    ? Image.asset(
                        "assets/images/tab_shop_on.png",
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_shop_off.png",
                        height: 24,
                      ),
              ),
              label: 'Shop'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: _tab == 3
                    ? Image.asset(
                        "assets/images/tab_favorites_on.png",
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_favorites_off.png",
                        height: 24,
                      ),
              ),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: _tab == 4
                    ? Image.asset(
                        "assets/images/tab_account_on.png",
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_account_off.png",
                        height: 24,
                      ),
              ),
              label: 'Account'),
        ],
      ),
    );
  }

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });
  }
}
