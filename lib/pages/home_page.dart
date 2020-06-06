import 'package:flutter/material.dart';
import 'package:food_delivery/core/consts.dart';
import 'package:food_delivery/core/flutter_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            _customAppBar(),
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
                  Icon(FlutterIcons.search),
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
              child: Icon(FlutterIcons.shop),
            ),
          ),
        ],
      ),
    );
  }
}
