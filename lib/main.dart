import 'package:flutter/material.dart';
import 'package:store/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //ensureing widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // remove # sign from urls
  setPathUrlStrategy();
  //app starts here
  runApp(const App());
}
