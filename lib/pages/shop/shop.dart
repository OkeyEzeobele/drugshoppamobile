// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_view_indicators/circle_page_indicator.dart';

// import '../../../models/products.dart';
// import '../../services/api_service.dart';
// import '../../services/shared_service.dart';
// import '../../ui/pallete.dart';

// class Shop extends StatefulWidget {
//   const Shop({Key? key}) : super(key: key);

//   @override
//   _ShopState createState() => _ShopState();
// }

// class _ShopState extends State<Shop> {
//   late Future<List<Products?>> products;
//   String params = '?category=157';

//   Future<Products?> _getProducts() async {
//     Future<Products?> model =
//         await SharedService.isRecentlyArrivedProductsSaved()
//             ? SharedService.recentlyArrivedProducts()
//             : APIService.getProducts(params);
//     return model;
//   }

//   @override
//   void initState() {
//     super.initState();
//     products = _getProducts() as Future<List<Products?>>;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double marginFromSafeArea = 24;
//     var heightOfScreen =
//         MediaQuery.of(context).size.height - marginFromSafeArea;
//     var widthOfScreen = MediaQuery.of(context).size.width;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         FutureBuilder<List<Products?>>(
//           future: products,
//           builder: (context, productModel) {
//             var items = productModel.data;
//             if (productModel.hasData) {
//               final _currentPageNotifier = ValueNotifier<int>(0);
//               _buildCircleIndicator() {
//                 return Positioned(
//                   left: 0.0,
//                   right: 0.0,
//                   bottom: 0.0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: CirclePageIndicator(
//                       itemCount: items!.length,
//                       currentPageNotifier: _currentPageNotifier,
//                       dotColor: Colors.grey,
//                       selectedDotColor: FvColors.maintheme,
//                     ),
//                   ),
//                 );
//               }

//               final _pageController = PageController(
//                 viewportFraction: 0.9,
//               );
//               if (items!.isEmpty) {
//                 return SizedBox(
//                   height: heightOfScreen * 0.3,
//                   width: widthOfScreen,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: FvColors.maintheme,
//                     ),
//                     margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Nothing to see here',
//                           style: GoogleFonts.inconsolata(
//                             fontSize: 15.0,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }
//               return SizedBox(
//                 height: 50,
//                 width: 50,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: items.length,
//                   onPageChanged: (int i) {
//                     _currentPageNotifier.value = i;
//                   },
//                   physics: BouncingScrollPhysics(),
//                   itemBuilder: (context, i) {
//                     return Column(
//                       children: [
//                         SizedBox(
//                           height: 48,
//                           width: 48,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: Image.network(items[i]!.images[0].src) as ImageProvider,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                             padding: EdgeInsets.all(20),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text('data'),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     );
//                   },
//                 ),
//               );
//             }
//             return SizedBox(
//               height: heightOfScreen * 0.3,
//               width: widthOfScreen,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: FvColors.maintheme,
//                 ),
//                 margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Nothing available for now',
//                       style: GoogleFonts.inconsolata(
//                         fontSize: 15.0,
//                         color: Colors.white,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
