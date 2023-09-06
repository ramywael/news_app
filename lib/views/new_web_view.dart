import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/custom_text_app_bar.dart';
class NewsWebView extends StatefulWidget {
  final String url;

 const NewsWebView({required this.url});

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late final WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()..loadRequest(
      Uri.parse(widget.url),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding:  EdgeInsets.only(right: 50),
          child:  CutomTextAppBar(),
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
