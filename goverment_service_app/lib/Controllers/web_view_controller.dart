import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewController extends ChangeNotifier {


  bool canback = false;

  bool canforword = false;


 String searchdata = "flutter";

 String googleUrl = "https://www.google.com/search?q=&sca_esv=565383898&rlz=1C1VDKB_enIN1049IN1049&sxsrf=AM9HkKmdrNelK_8Podob2nrpuEuUYjuCiw%3A1694711138183&ei=Yj0DZdTnCtLx-QaMoqvAAQ&ved=0ahUKEwjUoI37yqqBAxXSeN4KHQzRChgQ4dUDCBA&uact=5&oq=flutter&gs_lp=Egxnd3Mtd2l6LXNlcnAiB2ZsdXR0ZXIyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEdIvQhQAFgAcAB4ApABAJgBAKABAKoBALgBA8gBAOIDBBgAIEGIBgGQBgg&sclient=gws-wiz-serp";

  String browserUrl = "";

  String currentUrl = "";

  Map allBrowserUrl = {};

  InAppWebViewController? webViewController;

  initController({required InAppWebViewController webViewController}){

    this.webViewController = webViewController;

  }

  WebController(){

    allBrowserUrl = {
      "google": "https://www.google.com/search?q=$searchdata&sca_esv=565383898&rlz=1C1VDKB_enIN1049IN1049&sxsrf=AM9HkKmdrNelK_8Podob2nrpuEuUYjuCiw%3A1694711138183&ei=Yj0DZdTnCtLx-QaMoqvAAQ&ved=0ahUKEwjUoI37yqqBAxXSeN4KHQzRChgQ4dUDCBA&uact=5&oq=flutter&gs_lp=Egxnd3Mtd2l6LXNlcnAiB2ZsdXR0ZXIyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEcyBBAAGEdIvQhQAFgAcAB4ApABAJgBAKABAKoBALgBA8gBAOIDBBgAIEGIBgGQBgg&sclient=gws-wiz-serp",
      "duckduckgo":"https://duckduckgo.com/?$searchdata&t=h_&ia=web",

    };

    browserUrl =allBrowserUrl['google'];
    currentUrl = browserUrl;
    notifyListeners();
  }
  
  search({required String value}){
    
    googleUrl = value;
    
    webViewController!.loadUrl(urlRequest: URLRequest(url: Uri.parse(googleUrl)));
    notifyListeners();
  }


  checkStuts()async{

    canback = await webViewController?.canGoBack() ?? false;
    canforword = await webViewController?.canGoForward() ?? false;

    notifyListeners();
  }

  get cangoback{
    checkStuts();
    return canback;
  }
  get cangoforword{
    checkStuts();
    return canforword;
  }

  back(){
    webViewController!.goBack();
    notifyListeners();
  }

  forword(){
    webViewController!.goForward();
    notifyListeners();
  }



}