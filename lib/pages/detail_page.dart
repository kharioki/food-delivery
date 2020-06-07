import 'package:flutter/material.dart';
import 'package:food_delivery/core/consts.dart';
import 'package:food_delivery/core/flutter_icons.dart';
import 'package:food_delivery/models/food_model.dart';

class DetailPage extends StatefulWidget {
  final FoodModel data;
  const DetailPage(FoodModel foodList, {this.data});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(children: <Widget>[
        _customAppBar(),
              ],),
            );
          }
        
          Widget _customAppBar() {
            return Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12),),
                  ),
                  child: Icon(FlutterIcons.left,),
                ),
              ],
            )
          }
}
