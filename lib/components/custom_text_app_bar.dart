import 'package:flutter/material.dart';

class CutomTextAppBar extends StatelessWidget {
  const CutomTextAppBar({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const  Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}