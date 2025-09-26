import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/pages_route_name.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:islami_app/theme/theme_app.dart';
import 'core/routes/routes.dart';

Future<void> main() async{
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.themes,
      debugShowCheckedModeBanner: false,
      /* home: SplashScreen(),*/

      initialRoute: PagesRouteName.splashView,
      routes: Routes.routes ,

    );
  }
}
