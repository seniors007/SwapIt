import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:swapit/features/notification/presentation/views/notification_view.dart';
import 'package:swapit/features/profile/presentation/views/profile_view.dart';
import 'package:swapit/features/requests/presentation/views/requests_view.dart';
import 'package:swapit/features/search/presentation/views/search_page.dart';
import 'package:swapit/features/services/presentation/views/services_page.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final int _currentIndex = 0;

  List<Widget> _buildScreens() {
    return [
      const HomeViewBody(),
      const ServicesView(),
      const SearchPage(),
      const RequestsPage(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage('assets/home.png')),
        title: "Home",
        activeColorPrimary: kYellowColor,
        inactiveColorPrimary: kGreenColor,
        iconSize: 35,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage('assets/tasks.png')),
        title: "Services",
        activeColorPrimary: kYellowColor,
        inactiveColorPrimary: kGreenColor,
        iconSize: 35,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage('assets/search.png')),
        title: "Search",
        activeColorPrimary: kYellowColor,
        inactiveColorPrimary: kGreenColor,
        iconSize: 35,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage('assets/requests.png')),
        title: "Requests",
        activeColorPrimary: kYellowColor,
        inactiveColorPrimary: kGreenColor,
        iconSize: 35,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage('assets/profile icon.png')),
        title: "Profile",
        activeColorPrimary: kYellowColor,
        inactiveColorPrimary: kGreenColor,
        iconSize: 35,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF7F8FD),
        leading: IconButton(
          onPressed: () {},
          padding: const EdgeInsets.all(0.0),
          icon: Image.asset(
            'assets/swapIt.png',
          ),
        ),
        title: Image.asset(
          'assets/title name.png',
          width: 135,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const NotificationView());
              },
              icon: Image.asset('assets/bell.png'))
        ],
      ),
      //___________________ Navigation_________________//
      body: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: _currentIndex),
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: const Color(0xFFF7F8FD),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }
}
