import 'package:flutter/material.dart';

import 'news_container.dart';

class NewsItemListView extends StatelessWidget {
  const NewsItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      //this solution is better than the above one
      //Because this one is more efficient for performance
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
            (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: NewsTile(),
          );
        },
      ),
    );
  }
}
