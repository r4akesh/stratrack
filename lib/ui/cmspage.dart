
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';
import 'package:stattrack/utils/string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CmsPage extends StatefulWidget {
  const CmsPage({Key? key}) : super(key: key);

  @override
  State<CmsPage> createState() => _CmsPageState();
}

class _CmsPageState extends State<CmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appText(termOfServices,txtColor: Colors.white,),
        centerTitle: true,
        flexibleSpace: Stack(
          children: [
            Container(child: Image.asset(topHeaderImg,fit: BoxFit.cover,  width: MediaQuery.of(context).size.width,))
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Get.back();
          },
        ),
        //leading: Image.asset(backIcon,scale: 3,color: Colors.white,),
        toolbarHeight: 70,
      ),
      body: WebView(
        zoomEnabled: false,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://stattrack.ezxdemo.com/cmspages/terms-and-services",
      ),
    );
  }
}
