// ignore_for_file: must_be_immutable

import 'package:final_project/screens/product_screen.dart';
import 'package:final_project/utils/global.colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map item;
  ProductCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: GlobalColors.primaryLightColor.withOpacity(0.2),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(item['image'])));
                  },
                  child: Image.network(
                    item['image'],
                    fit: BoxFit.cover,
                    height: 230,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: GlobalColors.textColor.withOpacity(0.7)),
                ),
                SizedBox(height: 5),
                Text(
                  item['price'].toString() + "\$",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
