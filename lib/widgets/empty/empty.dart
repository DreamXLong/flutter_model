import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum EmptyImageType {
  // 页面无数据
  activity_empty,
}

class EmptyPlaceholder extends StatelessWidget {
  EmptyPlaceholder(
      {required this.title,
      this.height,
      this.backgroundColor,
      this.space = 20,
      this.buttonWidget,
      this.textStyle,
      this.imgWidth,
      this.imgType = EmptyImageType.activity_empty,
      this.imageAssert});

  String title;
  double space;
  double? imgWidth;
  EmptyImageType imgType;
  Widget? buttonWidget;
  TextStyle? textStyle;
  Color? backgroundColor;
  double? height;
  String? imageAssert;

  Widget _getEmptyImage() {
    //不同空页面搭配的UI
    var imgAsset = "";

    return Container(
      constraints: BoxConstraints(maxWidth: 0.4.sw),
      child: Image.asset(
        imageAssert != null ? imageAssert! : imgAsset,
        fit: BoxFit.fitWidth,
        width: imgWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: double.infinity,
      color: backgroundColor ?? Colors.white,
      padding: EdgeInsets.only(left: 32.w, right: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getEmptyImage(),
          Container(
            margin: EdgeInsets.only(top: space, bottom: space),
            child: Text(
              title,
              style: textStyle ??
                  TextStyle(fontSize: 16.w, color: Colors.black.withAlpha(65)),
            ),
          ),
          buttonWidget ?? Container()
        ],
      ),
    );
  }
}
