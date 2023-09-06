import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/category_list_view.dart';
import '../models/article_model.dart';
import '../services/get_news_api.dart';
import '../widgets/news_item_list_view.dart';

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

class NoteItemListViewBuilder extends StatefulWidget {
  const NoteItemListViewBuilder({
    super.key,
  });

  @override
  State<NoteItemListViewBuilder> createState() => _NoteItemListViewBuilderState();
}

class _NoteItemListViewBuilderState extends State<NoteItemListViewBuilder> {
  var future;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    future= Service(Dio()).getNews();
  }

  // Future<void> getGeneralNews() async {
  //   future= await Service(Dio()).getNews();
  // }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<ArticalModel>>(
      future: future,
        builder: (BuildContext context,snapshot) {
      if(snapshot.hasData)
        {
         return NewsItemListView(articles: snapshot.data!,);
        }else if(snapshot.hasError)
          {
            return const SliverToBoxAdapter(
              child: Center(child: Text("Error"),)
            );
          }else{
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      }
    },
    );
  }
}
