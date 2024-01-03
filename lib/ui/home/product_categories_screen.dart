// ignore_for_file: must_be_immutable
/*External dependencies */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:ecomarket/repository/models/category.dart';
import 'package:ecomarket/repository/service/product_service.dart';
import 'package:ecomarket/ui/cart/cart_screen.dart';
import 'package:ecomarket/ui/home/bloc/category_bloc.dart';
import 'package:ecomarket/ui/info/info_screen.dart';
import 'package:ecomarket/ui/order_history/order_history_screen.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({super.key});

  @override
  State<ProductCategoriesScreen> createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        return RepositoryProvider(
          create: (context) => ApiService(),
          child: BlocProvider(
            create: (context) =>
                CategoryBloc(RepositoryProvider.of<ApiService>(context))
                  ..add(LoadCategoriesEvent()),
            child: Scaffold(
              appBar: AppBar(
                title: Text('Эко Маркет',
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              body: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoadingState) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      padding: EdgeInsets.all(16.w),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const Shimmer();
                      },
                    );
                  }
                  if (state is CategoryLoadedState) {
                    List<Category> categoryList = state.categories;
                    return Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                            ),
                            padding: EdgeInsets.all(16.w),
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.read<CategoryBloc>().add(
                                      SelectCategoryEvent(
                                          '${categoryList[index].name}'));
                                  // old version
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   productListRoute,
                                  //   arguments: {
                                  //     'categoryName':
                                  //         '${categoryList[index].name}'
                                  //   },
                                  // );
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
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                '${categoryList[index].image}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: Text(
                                        '${categoryList[index].name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is CategoryErrorState) {
                    return const Center(
                      child: Text('Error occured'),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        );
      case 1:
        return const CartScreen();
      case 2:
        return const OrderHistoryScreen();
      case 3:
        return const InfoScreen();
      default:
        return Container();
    }
  }
}

class Shimmer extends StatelessWidget {
  const Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(10)),
        )),
      ],
    );
  }
}
