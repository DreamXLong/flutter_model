import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/appbar/appbar_generator.dart';
import '../../widgets/empty/empty.dart';

class NotFoundPage extends StatefulWidget {
  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGenerator.getDefault(title: '页面丢失'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 38.w, right: 38.w),
        child: EmptyPlaceholder(
          title: '您要找到页面不见了 ~',
          buttonWidget: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text('返回上一页'),
          ),
        ),
      ),
    );
  }
}
