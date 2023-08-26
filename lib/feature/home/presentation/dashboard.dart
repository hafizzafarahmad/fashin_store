import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../core/style/app_color.dart';
import '../../product/presentation/cart_page.dart';
import '../../product/presentation/product_page.dart';
import '../../product/presentation/wishlist_page.dart';
import '../../profile/presentation/profile_page.dart';
import '../controller/dashboard_controller.dart';
import 'home_page.dart';

class Dashboard extends StatefulWidget {

  const Dashboard({Key? key}) : super(key: key);
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {


  void changePage(var screen){
    if(screen != null){
      Navigator.pushNamed(context, '/$screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController controller){
        return Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            body:
            // HomePage(),
            PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageViewChange,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  HomePage(),
                  ProductPage(),
                  WishListPage(),
                  ProfilePage(),
                ]
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: BottomNavigationBar(
                  showUnselectedLabels: true,
                  selectedItemColor: AppColor.mainColor,
                  unselectedItemColor: Colors.black26,
                  unselectedFontSize: 13,
                  selectedFontSize: 13,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.selectedIndex,
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home, size: 26, color: Colors.black26),
                      label: 'Home',
                      activeIcon: Icon(Icons.home, size: 26,),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search, size: 26, color: Colors.black26),
                      label: 'Search',
                      activeIcon: Icon(Icons.search, size: 26,),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite, size: 26, color: Colors.black26),
                      label: 'Wishlist',
                      activeIcon: Icon(
                        Icons.favorite
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline, size: 26, color: Colors.black26),
                      label: 'Profile',
                      activeIcon: FaIcon(Icons.person_outline, size: 26,),
                    ),
                  ],
                  onTap: controller.navigationTapped,
//        onTap: navigationTapped,
                ),
              ),
            )
        );
      },
    );
  }
}
