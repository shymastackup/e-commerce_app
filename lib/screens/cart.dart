import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(255, 227, 227, 236),
        border: null,
        padding: EdgeInsetsDirectional.only(
          top: 16,
        ),
        leading: CupertinoButton(
          padding: const EdgeInsets.symmetric(vertical: 0),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        middle: Text(
          'My Cart',
          style: TextStyle(
              color: CupertinoColors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      child: Container(
        color: const Color.fromARGB(255, 227, 227, 236),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CartItem(
              name: 'Ring',
              category: 'Woman Fashion',
              price: '\$70.00',
              imagePath: 'assets/images/ring.jpeg',
            ),
            CartItem(
              name: 'Smart Watch',
              category: 'Electronics',
              price: '\$55.00',
              imagePath: 'assets/images/wtch.jpeg',
            ),
            CartItem(
              name: 'Wireless Headphone',
              category: 'Electronics',
              price: '\$120.00',
              imagePath: 'assets/images/headphone.png',
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CupertinoTextField(
                    placeholder: 'Enter Discount Code',
                    placeholderStyle: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 190, 183, 183),
                      fontWeight: FontWeight.w400,
                    ),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffix: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 94, 0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.systemGrey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Text('\$245.00',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.systemGrey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text('\$245.00',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  CupertinoButton(
                    color: const Color.fromARGB(255, 255, 94, 0),
                    onPressed: () {},
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final String category;
  final String price;
  final String imagePath;

  CartItem({
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: imagePath.startsWith('assets/')
                      ? AssetImage(imagePath) as ImageProvider
                      : NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                  ),
                  Text(
                    category,
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: CupertinoColors.systemGrey,
                              fontSize: 13,
                            ),
                  ),
                  Text(
                    price,
                    style:
                        TextStyle(color: CupertinoColors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Icon(CupertinoIcons.minus,
                      color: CupertinoColors.systemGrey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('1',
                      style: CupertinoTheme.of(context).textTheme.textStyle),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child:
                      Icon(CupertinoIcons.plus, color: CupertinoColors.black),
                ),
              ],
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child:
                  Icon(CupertinoIcons.delete, color: CupertinoColors.systemRed),
            ),
          ],
        ),
      ),
    );
  }
}
