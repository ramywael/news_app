import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../services/get_news_api.dart';
import 'news_item_list_view.dart';

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