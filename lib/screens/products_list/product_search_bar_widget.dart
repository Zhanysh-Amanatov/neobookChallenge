import 'package:flutter/material.dart';

class ProductSearchBarWidget extends StatelessWidget {
  const ProductSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      hintText: 'Быстрый поиск',
      hintStyle:
          MaterialStateProperty.all(Theme.of(context).textTheme.displaySmall),
      leading: const Icon(Icons.search, color: Color(0xFFD2D1D5)),
      backgroundColor: MaterialStateProperty.all(const Color(0xFFF8F8F8)),
      constraints: const BoxConstraints(maxWidth: 400, minHeight: 44),
      shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
      )),
    );
  }
}
