// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app_ui_setup/models/article_model.dart';
// import 'package:news_app_ui_setup/services/get_news_api.dart';
//
// import 'news_container.dart';
//
// class NewsItemListView extends StatefulWidget {
//   const NewsItemListView({
//     super.key,
//   });
//
//   @override
//   State<NewsItemListView> createState() => _NewsItemListViewState();
// }
//
// class _NewsItemListViewState extends State<NewsItemListView> {
//   List<ArticalModel> articles = [];
//   bool isLoading = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getGeneralNews(); //It will be called only once
//   }
//
//   void getGeneralNews() async {
//     articles = await Service(Dio()).getNews();
//     isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(child: CircularProgressIndicator()))
//         : SliverList(
//             //this solution is better than the above one
//             //Because this one is more efficient for performance
//             delegate: SliverChildBuilderDelegate(
//               childCount: articles.length,
//               (BuildContext context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 16),
//                   child: NewsTile(
//                     article: articles[index],
//                   ),
//                 );
//               },
//             ),
//           );
//   }
// }


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import '../services/get_news_api.dart';
import 'news_container.dart';

class NewsItemListView extends StatefulWidget {
  const NewsItemListView({Key? key}) : super(key: key);

  @override
  State<NewsItemListView> createState() => _NewsItemListViewState();
}

class _NewsItemListViewState extends State<NewsItemListView> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future =Service(Dio()).getNews(); //It will be called only once
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future as Future<List<ArticalModel>>,
      builder: (BuildContext context,snapshot) {
        if(snapshot.hasData)
          {
            return SliverList(
              //this solution is better than the above one
              //Because this one is more efficient for performance
              delegate: SliverChildBuilderDelegate(
                childCount: snapshot.data!.length,
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NewsTile(
                      article: snapshot.data![index],
                    ),
                  );
                },
              ),
            );
          }else if(snapshot.hasError){
          return SliverToBoxAdapter(
            child: Center(
              child: Text(snapshot.error.toString()),
            ),
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


