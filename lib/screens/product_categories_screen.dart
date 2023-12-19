// ignore_for_file: must_be_immutable
/*External dependencies */
import 'dart:convert';
import 'package:ecomarket/screens/products_list/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
/*Local dependencies */

class Category {
  int? id;
  String? image;
  String? name;
  Category({
    this.id,
    this.image,
    this.name,
  });
}

class ProductCategories extends StatefulWidget {
  const ProductCategories({super.key});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  int _currentindex = 0;

  Future<List<Category>> getCategories() async {
    String url = 'https://neobook.online/ecobak/product-category-list/';
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(utf8.decode(response.bodyBytes));

    List<Category> categories = [];
    if (response.statusCode == 200) {
      for (var singleCategory in responseData) {
        Category category = Category(
          id: singleCategory['id'],
          name: singleCategory['name'],
          image: singleCategory['image'],
        );

        categories.add(category);
      }
    } else {
      throw Exception('Failed to load data');
    }
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Эко Маркет',
      //       style: Theme.of(context).textTheme.headlineLarge),
      // ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _currentindex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).shadowColor,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() => _currentindex = index);
        },
      ),
    );
  }

  Widget _getBody() {
    switch (_currentindex) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            title: Text('Эко Маркет',
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          body: FutureBuilder(
            future: getCategories(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No categories found'),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  padding: EdgeInsets.all(16.w),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // Your grid item widget
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/productList',
                          arguments: {
                            'categoryName': '${snapshot.data![index].name}'
                          },
                        );
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.srcOver,
                                ),
                                child: Image.network(
                                  '${snapshot.data![index].image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Text(
                              '${snapshot.data![index].name}',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        );
      case 1:
      // return const ProductCard(); // Use the appropriate widget for the second screen
      case 3:
        return const InfoScreen();
      default:
        return Container(); // Add this line to handle all possible cases
    }
  }
}
