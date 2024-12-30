import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  //ensureing widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // remove # sign from urls
  setPathUrlStrategy();

  ///init getX localStorage
  await GetStorage.init();
  //app starts here
  runApp(const App());
}
