/*External dependencies */
import 'package:flutter/material.dart';
/*Local dependencies */
import 'package:ecomarket/repository/models/product.dart';
import 'package:ecomarket/repository/service/product_service.dart';
import 'package:ecomarket/ui/product/product_details_screen.dart';
import 'package:ecomarket/ui/products_list/product_card.dart';

class ProductSearchBarWidget extends StatefulWidget {
  const ProductSearchBarWidget({super.key});

  @override
  State<ProductSearchBarWidget> createState() => _ProductSearchBarWidgetState();
}

class _ProductSearchBarWidgetState extends State<ProductSearchBarWidget> {
  final TextEditingController _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () => FocusScope.of(context).unfocus(),
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    _textController.text = "";
                  }),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColorDark,
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: ApiService().getProductsBySearch(_textController, context),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
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
                  childAspectRatio: 16 / 22,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ProductCard(
                      image: '${snapshot.data![index].image}',
                      title: '${snapshot.data![index].title}',
                      price: '${snapshot.data![index].price}',
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ProductDetailsBottomSheet(
                              image: '${snapshot.data![index].image}',
                              title: '${snapshot.data![index].title}',
                              price: '${snapshot.data![index].price}',
                              description:
                                  '${snapshot.data![index].description}',
                            );
                          },
                          isScrollControlled: true);
                    },
                  );
                });
          }
        },
      ),
    );
  }
}
