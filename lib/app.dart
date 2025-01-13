import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/bindings/general_bindings.dart';
import 'package:store/routes/app_routes.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder: (context, child) {
      //   ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      //     return CustomErrorWidget(errorDetails: errorDetails);
      //   };
      //   return child ?? const SizedBox.shrink();
      // },
      title: STexts.appName,
      themeMode: ThemeMode.light,
      navigatorObservers: [RouteObserver()],
      defaultTransition: Transition.noTransition,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: SAppRoutes.pages,
      initialRoute: SRoutes.login,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const NotFoundPage(),
      ),
      // onUnknownRoute: (settings) => MaterialPageRoute(
      //   builder: (context) => Scaffold(
      //     backgroundColor: TColors.error,
      //     body: Center(
      //       child: Text('404! ${settings.name} not found'),
      //     ),
      //   ),
      // ),
      initialBinding: GeneralBindings(),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('404 - Page Not Found')),
    );
  }
}
