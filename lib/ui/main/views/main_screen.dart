import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kyla_task/ui/card/card_screen.dart';
import 'package:kyla_task/ui/favorites/favorites_screen.dart';
import 'package:kyla_task/ui/history/history_screen.dart';
import 'package:kyla_task/ui/home/views/home_screen.dart';
import 'package:kyla_task/ui/main/view_models/main_view_model.dart';
import 'package:kyla_task/ui/profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const _navigationMapper = <int, Widget>{
    0: HomeScreen(),
    1: FavoritesScreen(),
    2: HistoryScreen(),
    3: CardScreen(),
    4: ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    final MainViewModel viewModel = Get.put(MainViewModel());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Discover',
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          actions: const [
            Icon(Icons.search, color: Colors.black),
            SizedBox(width: 12),
            Icon(Icons.notifications_none, color: Colors.black),
            SizedBox(width: 24),
          ],
        ),
        body: _navigationMapper[viewModel.selectedPage.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: viewModel.selectedPage.value,
          selectedItemColor: Colors.pinkAccent,
          onTap: (int index) => viewModel.setSelectedPage(index),
        ),
      ),
    );
  }
}
