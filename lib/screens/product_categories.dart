// ignore_for_file: must_be_immutable
/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/screens/product_list.dart';

class Category {
  String name;
  String image;
  Category(this.name, this.image);
}

class ProductCategories extends StatefulWidget {
  const ProductCategories({super.key});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  List<Category> items = [
    Category('Фрукты', 'assets/images/category.png'),
    Category('Фрукты', 'assets/images/category.png'),
    Category('Фрукты', 'assets/images/category.png'),
    Category('Фрукты', 'assets/images/category.png'),
    Category('Фрукты', 'assets/images/category.png'),
    // Category('Фрукты', 'assets/images/category.png'),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Эко Маркет',
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: (items.length / 2).ceil(),
              // Ensure the correct number of rows
              itemBuilder: (context, rowIndex) {
                final startIndex = rowIndex * 2;
                final endIndex = startIndex + 2;
                final rowItems = items.sublist(
                  startIndex,
                  endIndex.clamp(0, items.length),
                );

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProductList()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (final item in rowItems)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SizedBox(
                            width: 166.w,
                            child: Card(
                              color: Colors.white,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.2),
                                      BlendMode.srcOver,
                                    ),
                                    child: Image.asset(
                                      item.image,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: Text(
                                      item.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      // Add an invisible placeholder card if the number of items is odd
                      if (rowItems.length % 2 == 1)
                        SizedBox(
                          width: 166.w,
                          child: const Card(
                            color: Colors.transparent,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.badge),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock),
                label: 'История',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.question_mark_rounded),
                label: 'Инфо',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).shadowColor,
            unselectedFontSize: 14,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
