// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
// import '/../pages/cardList/cardlist.dart';
// import '/../pages/sendmoney/sendmoney.dart';
import '/../ui/export.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] only for android black navigation bar. 3 button navigation control (legacy)

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: FvColors.edittext51Background,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            Homescreen(),
            Center(child: Text('Coming Soon')),
            Center(child: Text('Coming Soon')),
            Center(child: Text('Coming Soon')),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
                filledIcon: Icons.person,
                outlinedIcon: Icons.person_outline),
            BarItem(
              filledIcon: Icons.shopping_cart,
              outlinedIcon: Icons.shopping_cart_outlined
            ),
            BarItem(
              filledIcon: Icons.more_horiz,
              outlinedIcon: Iconsax.more
            ),
          ],
        ),
      ),
    );
  }
}

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   int _selectedIndex = 2;

//   static const List<Widget> _widgetOptions = <Widget>[
//     Sendmoney(),
//     CardList(),
//     Homescreen(),
//     Text(
//       'Coming Soon',
//     ),
//      Text(
//       'Coming Soon',
//     ),
//   ];

//   void _onItemTapped(int i) {
//     setState(() {
//       _selectedIndex = i;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: FvColors.edittext51Background,
//         body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//         bottomNavigationBar: ConvexAppBar.badge(
//           const {4: ''},
//           items: [
//             const TabItem(
//               icon: Iconsax.send_21,
//               title: 'Send',
//             ),
//             const TabItem(
//                 icon: FontAwesomeIcons.solidCreditCard, title: 'Cards'),
//             const TabItem(icon: FontAwesomeIcons.houseUser, title: 'Home'),
//             const TabItem(icon: Icons.bar_chart_rounded, title: 'Stats'),
//             const TabItem(icon: Iconsax.more, title: 'More'),
//           ],
//           color: Colors.grey.shade500,
//           activeColor: FvColors.maintheme,
//           backgroundColor: Colors.white,
//           initialActiveIndex: 2, //optional, default as 0
//           onTap: _onItemTapped,
//           elevation: 5,
//         ));
//   }
// }
