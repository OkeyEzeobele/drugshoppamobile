// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/products.dart';
import '../../../services/api_service.dart';
import '../../../services/shared_service.dart';
import '../../../ui/pallete.dart';

class Promos extends StatefulWidget {
  const Promos({Key? key}) : super(key: key);

  @override
  _PromosState createState() => _PromosState();
}

class _PromosState extends State<Promos> {
  late Future<List<Products>> products;
  String params = '?category=157';

  Future<List<Products>> _getProducts() async {
    Future<List<Products>> model =
        (
          // await SharedService.isRecentlyArrivedProductsSaved()
          //   ? SharedService.recentlyArrivedProducts()
          //   : 
            APIService.getProducts(params));
    return model;
  }

  @override
  void initState() {
    super.initState();
    products = APIService.getProducts(params);
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: widthOfScreen * 0.05,
            ),
            Text(
              'New Arrivals',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        SizedBox(
          height: heightOfScreen * 0.01,
        ),
        FutureBuilder<List<Products>>(
          future: products,
          builder: (context, productModel) {
            var items = productModel.data;
            if (productModel.hasData) {
              final _pageController = PageController();
              if (items!.isEmpty) {
                return SizedBox(
                  height: heightOfScreen * 0.3,
                  width: widthOfScreen,
                  child: Container(
                    decoration: BoxDecoration(
                      color: FvColors.maintheme,
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nothing to see here',
                          style: GoogleFonts.inconsolata(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Card(
                elevation: 5,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: heightOfScreen * 0.15,
                    width: widthOfScreen,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemCount: items.length,
                      // onPageChanged: (int i) {
                      //   _currentPageNotifier.value = i;
                      // },
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        var data = items[i];
                        return Column(
                          children: [
                            SizedBox(
                              height: heightOfScreen * 0.08,
                              width: widthOfScreen * 0.25,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(data.images[0].src),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.all(20),
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.009,
                            ),
                            SizedBox(
                              width: widthOfScreen * 0.3,
                              height: heightOfScreen * 0.03,
                              child: Text(
                                data.name,
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: heightOfScreen * 0.012,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthOfScreen * 0.3,
                              child: Text(
                                NumberFormat.currency(
                                  name: '₦ ',
                                  decimalDigits: 0,
                                ).format(
                                  int.parse(
                                    data.price,
                                  ),
                                ),
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                ),
              );
            }
            return Card(
              elevation: 5,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: heightOfScreen * 0.15,
                  width: widthOfScreen,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: heightOfScreen * 0.08,
                             width: widthOfScreen * 0.25,
                             child: FittedBox(
                              fit: BoxFit.fill,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black
                                ),
                              ),
                             ),
                          ),
                          SizedBox(
                            height: heightOfScreen * 0.009,
                          ),
                          SizedBox(
                            width: widthOfScreen * 0.3,
                            height: heightOfScreen * 0.03,
                          ),
                          SizedBox(
                            width: widthOfScreen * 0.3
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
