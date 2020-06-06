import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/core/consts.dart';
import 'package:food_delivery/core/flutter_icons.dart';
import 'package:food_delivery/models/food_model.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodModel> foodList = FoodModel.list;
  PageController pageController = PageController(viewportFraction: .7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            _customAppBar(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: PageView.builder(
                      controller: pageController,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: 40,
                                bottom: 10,
                                right: 40,
                              ),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.greenColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: <Widget>[
                                      RatingBar(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 16,
                                        unratedColor: Colors.black12,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.black,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      Text('(120 Reviews)'),
                                    ],
                                  ),
                                  Text(
                                    '${foodList[index].name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Transform.rotate(
                                angle: math.pi / 3,
                                child: Image(
                                  width: 180,
                                  image: AssetImage(
                                      'assets/images/${foodList[index].imgPath}'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  _buildPopularList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: foodList.length,
      padding: EdgeInsets.only(
        left: 40,
        bottom: 16,
        top: 20,
      ),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 100,
              image: AssetImage('assets/images/${foodList[index].imgPath}'),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${foodList[index].name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Text(
                      '\$${foodList[index].price.toInt()}',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      '(${foodList[index].weight.toInt()}gm Weight)',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: 'Hello,\n',
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Mr Stark',
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.greenLightColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  Icon(
                    FlutterIcons.search,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(
                FlutterIcons.shop,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
