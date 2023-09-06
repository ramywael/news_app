import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/note_item_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: [
          NoteItemListViewBuilder(),
        ],
      )
    );
  }
}
