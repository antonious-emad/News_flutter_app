import 'package:flutter/material.dart';
import 'package:fourth/models/news_response.dart';
import 'package:fourth/shared/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const String routeName="WebScreen";
  late String url;

  @override
  Widget build(BuildContext context) {
    var article=ModalRoute.of(context)!.settings.arguments as Articles;
    url=article.url??"";
    // final _controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.disabled)
    //   ..loadRequest(Uri.parse(article.url!));

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(article.title ?? "",
              style: GoogleFonts.exo(
                  color: onappbar,
                  fontWeight: FontWeight.w400,
                  fontSize: 22)),
        ),
        toolbarHeight: 67,
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
      ),
      body: SizedBox(
          width: double.infinity,
          // the most important part of this example
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}