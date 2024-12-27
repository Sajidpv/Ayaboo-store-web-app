import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/routes/app_routes.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/exceptions/custom_error_handling_widget.dart';
import 'package:store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomErrorWidget(errorDetails: errorDetails);
        };
        return child!;
      },
      title: STexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: SAppRoutes.pages,
      initialRoute: SRoutes.login,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      ),
      // initialBinding: GeneralBindings(),
    );
  }
}

// class ResponsiveDesignScreen extends StatelessWidget {
//   const ResponsiveDesignScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SSiteLayout();
//   }
// }
