import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';

import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  final List<CategoryModel> catgories = const [
    CategoryModel(
        imageAssetUrl: "assets/business.jpg", categoryName: "Business"),
    CategoryModel(
        imageAssetUrl: "assets/entertaiment.avif",
        categoryName: "Entertainment"),
    CategoryModel(
        imageAssetUrl: "assets/general.jpg", categoryName: "General"),
    CategoryModel(imageAssetUrl: "assets/health.avif", categoryName: "Health"),
    CategoryModel(
        imageAssetUrl: "assets/science.avif", categoryName: "Science"),
    CategoryModel(imageAssetUrl: "assets/sports.jpg", categoryName: "Sports"),
    CategoryModel(
        imageAssetUrl: "assets/technology.jpeg", categoryName: "Technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catgories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(category: catgories[index]);
        },
      ),
    );
  }
}
