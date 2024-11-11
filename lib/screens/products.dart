import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class ProductDetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  ProductDetailPage({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: null,
        leading: CupertinoButton(
          padding: const EdgeInsets.symmetric(vertical: 0),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 20,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Icon(CupertinoIcons.share, color: CupertinoColors.black),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Icon(CupertinoIcons.heart, color: CupertinoColors.black),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$price',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
                Text(
                  'Seller: Tariqul Islam',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero, 
                  onPressed: () {}, 
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 94, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          color: CupertinoColors.white,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  ' (320 Reviews)',
                  style: TextStyle(color: CupertinoColors.systemGrey),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Color',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildColorOption(CupertinoColors.systemRed),
                _buildColorOption(CupertinoColors.black),
                _buildColorOption(CupertinoColors.systemBlue),
                _buildColorOption(CupertinoColors.systemGrey),
                _buildColorOption(CupertinoColors.systemBrown),
              ],
            ),
            SizedBox(height: 16),
            CupertinoSlidingSegmentedControl<int>(
              groupValue:
                  0, 
              onValueChanged: (int? value) {
              
              },
              children: <int, Widget>{
                0: Text(
                  'Description',
                  style: TextStyle(
                    color: 0 == 0
                        ? CupertinoColors.white
                        : CupertinoColors
                            .black, 
                  ),
                ),
                1: Text(
                  'Specifications',
                  style: TextStyle(
                    color: 1 == 0
                        ? CupertinoColors.white
                        : CupertinoColors
                            .black, 
                  ),
                ),
                2: Text(
                  'Reviews',
                  style: TextStyle(
                    color: 2 == 0
                        ? CupertinoColors.white
                        : CupertinoColors
                            .black, 
                  ),
                ),
              },
              backgroundColor: Colors.transparent, 
              thumbColor: Color.fromARGB(255, 255, 94, 0), 
            ), 
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Placerat in semper vitae a. Blandit amet purus eget sed vitae morbi tellus. Integer ornare. Purus risus urna sed fermentum.',
              style: TextStyle(color: CupertinoColors.systemGrey),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.minus,
                          size: 20,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.plus,
                          size: 20,
                          color: CupertinoColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  color: const Color.fromARGB(255, 255, 94, 0),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (_) => CartPage()),
                    );
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
