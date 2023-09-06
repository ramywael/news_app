import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/category_list_view.dart';
import '../components/custom_text_app_bar.dart';
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
          title: const CutomTextAppBar(),
        ),
        body: const  CustomScrollView(
          physics:   BouncingScrollPhysics(),
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
            NoteItemListViewBuilder(category: 'general'),
          ],
        ));
  }
}

