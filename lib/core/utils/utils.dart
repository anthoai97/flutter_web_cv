import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

String path(str) {
  return (kIsWeb) ? 'assets/$str' : str;
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
