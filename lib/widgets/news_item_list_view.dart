import 'package:flutter/material.dart';

import 'news_container.dart';

class NewsItemListView extends StatelessWidget {
  const NewsItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding:  EdgeInsets.only(bottom: 16),
          child:  NewsTile(),
        );
      },
    );
  }
}
