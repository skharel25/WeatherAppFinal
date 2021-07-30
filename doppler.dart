import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DopplerImage extends StatefulWidget {
  const DopplerImage({Key? key}) : super(key: key);

  @override
  _DopplerImageState createState() => _DopplerImageState();
}

class _DopplerImageState extends State<DopplerImage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Weather Radar Map")),
        body: WebView(
          initialUrl: "https://www.rainviewer.com/weather-radar-map-live.html",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
