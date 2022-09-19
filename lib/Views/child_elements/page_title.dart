import 'package:flutter/material.dart';

class PageTitle extends StatefulWidget {
  final String? title;

  const PageTitle({super.key, this.title});

  @override
  State<StatefulWidget> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.only(left: 50.0, top: 80.0),
      child: Text(
        (widget.title ?? 'null'),
        style: const TextStyle(fontSize: 40.0, color: Colors.white),
      ),
    );
  }
}
