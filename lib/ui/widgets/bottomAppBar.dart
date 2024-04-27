import 'package:guzo_go_demo/theme/theme.dart';
import 'package:guzo_go_demo/ui/screens/home_page.dart';
import 'package:flutter/material.dart';


Widget bottomNavigation(
    {required BuildContext context,
    required int selectedIndex,
    required var onItemTapped}) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Container(
      decoration: BoxDecoration(    
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
  ,color: AppColors.primaryAppColor,
),
      
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
      
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primaryAppColor,
        unselectedItemColor: AppColors.lightGrayText,
        backgroundColor: AppColors.whiteColor,
        iconSize: 30,
        onTap: (value) => onItemTapped(value),
        elevation: 30,
      ),
    ),
  );
}



class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {

  int selectedIndex = 0;
 void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var pages = [
      HomePage(),
     // ProfilePage(),
    ];
    return Scaffold(
      body: pages[selectedIndex],
       bottomNavigationBar: bottomNavigation(
              context: context,
              selectedIndex: selectedIndex,
              onItemTapped: _onItemTapped),
    );
  }
}