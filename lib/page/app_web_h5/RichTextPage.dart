import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/appbar/appbar_generator.dart';

class RichTextPage extends StatefulWidget {
  RichTextPage({Key? key, required this.richText, this.title})
      : super(key: key);
  final String richText;
  String? title;
  @override
  _RichTextPageState createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGenerator.getDefault(title: widget.title ?? ""),
      body: Html(data: widget.richText, style: {
        'p': Style(color: Color(0xD9222222), fontSize: FontSize(14.w))
      }),
    );
  }
}
