import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../widgets/appbar/appbar_generator.dart';

class AppWebViewPage extends StatefulWidget {
  AppWebViewPage(this.uri, {this.title});
  String uri;
  String? title;

  @override
  _AppWebViewPageState createState() => _AppWebViewPageState();
}

class _AppWebViewPageState extends State<AppWebViewPage> {
  late String? h5Title = widget.title;
  double h5LoadProgress = 0;

  InAppWebViewController? _webViewController;

  _onTitleChanged(InAppWebViewController controller, String? title) {
    if (h5Title != null && h5Title!.length > 0) {
      return;
    }
    this.setState(() {
      this.h5Title = title;
    });
  }

  _onProgressChanged(InAppWebViewController controller, int progress) {
    setState(() {
      h5LoadProgress = progress / 100;
    });
  }

  _onWebViewCreated(InAppWebViewController controller) {
    _webViewController = controller;
  }

  _onBackIconDidClick() async {
    var ok = await _webViewController?.canGoBack() ?? false;
    if (ok) {
      _webViewController?.goBack();
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarGenerator.getDefault(
            title: h5Title ?? '', leadingCallback: _onBackIconDidClick),
        body: Column(
          children: <Widget>[
            LinearProgressIndicator(
              minHeight: 2,
              color:
                  h5LoadProgress == 1 ? Colors.transparent : Color(0xff222222),
              value: h5LoadProgress,
              backgroundColor: Colors.transparent,
            ),
            Expanded(
              // 官方代码
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(widget.uri)),
                // 加载进度变化事件
                onProgressChanged: _onProgressChanged,
                onTitleChanged: _onTitleChanged,
                onWebViewCreated: _onWebViewCreated,
              ),
            )
          ],
        ));
  }
}
