import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/note_item_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomScrollView(
            physics: const  BouncingScrollPhysics(),
            slivers: [
              NoteItemListViewBuilder(category: category,),
            ],
          ),
        ),
      )
    );
  }
}
