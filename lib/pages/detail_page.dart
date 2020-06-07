import 'package:flutter/material.dart';
import 'package:food_delivery/core/consts.dart';
import 'package:food_delivery/core/flutter_icons.dart';
import 'package:food_delivery/models/food_model.dart';

class DetailPage extends StatefulWidget {
  final FoodModel data;
  const DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          _customAppBar(),
          Text('Food details:'),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text('${widget.data.name}'),
                  Row(
                    children: <Widget>[
                      Text('\$${widget.data.price.toInt()}'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buildInfo('Weight', '${widget.data.weight.toInt()}gm'),
                      _buildInfo(
                          'Calories', '${widget.data.calory.toInt()}ccal'),
                      _buildInfo('Protein', '${widget.data.protein.toInt()}gm'),
                    ],
                  ),
                  Text('Items'),
                  Text('${widget.data.item}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Text(title), Text('${val}')],
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Icon(
              FlutterIcons.left,
              size: 16,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Icon(
              FlutterIcons.shop,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
