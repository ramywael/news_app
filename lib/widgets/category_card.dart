import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/category_view.dart';

import '../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CategoryView();
            },)
          );
        },
        child: Container(
          height: 95,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:  DecorationImage(
                image: AssetImage(category.imageAssetUrl), fit: BoxFit.fill),
          ),
          child:  Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
