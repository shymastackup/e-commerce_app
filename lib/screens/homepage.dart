import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'products.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          scaffoldBackgroundColor: Colors.white,
          barBackgroundColor: Colors.white),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 2; 

  
  void _onTabTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => CartPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: null,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(CupertinoIcons.bars, color: CupertinoColors.black),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(CupertinoIcons.bell, color: CupertinoColors.black),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.search,
                              color: CupertinoColors.systemGrey),
                          SizedBox(width: 10),
                          Expanded(
                              child: CupertinoTextField(
                            placeholder: 'Search...',
                            placeholderStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: CupertinoColors.systemGrey,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(235, 235, 240, 1),
                              border: Border(
                                right: BorderSide(
                                  color: CupertinoColors.systemGrey4,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(CupertinoIcons.slider_horizontal_3,
                              color: CupertinoColors.systemGrey),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                   
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/sale.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryItem('assets/images/shoes.png', 'Shoes'),
                        _buildCategoryItem(
                            'assets/images/beauty.png', 'Beauty'),
                        _buildCategoryItem('assets/images/womens_fashion.png',
                            'Women fashion'),
                        _buildCategoryItem(
                            'assets/images/jwellery.png', 'Jewelry'),
                        _buildCategoryItem(
                            'assets/images/mens_fashion.png', 'Men\'s Fashion'),
                      ],
                    ),
                    SizedBox(height: 20),

                    Text(
                      'Special For You',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),

                    CupertinoScrollbar(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          List<Map<String, String>> products = [
                            {
                              'image': 'assets/images/headphone.png',
                              'name': 'Headphones',
                              'price': '\$100'
                            },
                            {
                              'image': 'assets/images/womens_sweter.png',
                              'name': 'Women Sweater',
                              'price': '\$150'
                            },
                            {
                              'image': 'assets/images/wtch.jpeg',
                              'name': 'Smart Watch',
                              'price': '\$120'
                            },
                            {
                              'image': 'assets/images/ring.jpeg',
                              'name': 'Diamond Rings',
                              'price': '\$180'
                            },
                          ];
                          return _buildProductCard(
                            context,
                            image: products[index]['image']!,
                            name: products[index]['name']!,
                            price: products[index]['price']!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CupertinoTabBar(
            currentIndex: _currentTabIndex,
            onTap: _onTabTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.plus_app, size: 28),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart, size: 28),
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 255, 94, 0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.home,
                      color: CupertinoColors.white, 
                      size: 28,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart, size: 28),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person, size: 28),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: CupertinoColors.systemOrange,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 5),
        Text(title,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ],
    );
  }

  Widget _buildProductCard(BuildContext context,
      {required String image, required String name, required String price}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => ProductDetailPage(
              image: image,
              name: name,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(price, style: TextStyle(color: CupertinoColors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
