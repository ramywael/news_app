import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/category_list_view.dart';
import '../widgets/note_item_list_view_builder.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            //told the row to take as little space as possible(Child)
            children: [
              Text(
                'News',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'Cloud',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        body: const CustomScrollView(
          physics:  BouncingScrollPhysics(),
          slivers: [
             SliverToBoxAdapter(
              child: CategoryListView(),
            ),
             SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            // const SliverToBoxAdapter(
            //   child: NewsItemListView(),
            // ),
            NoteItemListViewBuilder(),
          ],
        ));
  }
}

