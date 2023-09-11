import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myresto_customer/customer_portel/order_create_view/screen_main_order_create.dart';
import 'package:myresto_customer/internationalization/internationalization.dart';
import 'package:myresto_customer/utils/custom_scroll_behaviour.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async{
  WidgetsFlutterBinding
      .ensureInitialized(); //for sharedpreferences access everywhere



  setPathUrlStrategy(); //for remove # from url


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        title: 'NextDines',
                scrollBehavior: MyCustomScrollBehavior(),
                 translations: Internationalization(),
              locale: const Locale('en', 'US'),
              fallbackLocale: const Locale('en', 'US'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home:  MyHome(),
        home:Scaffold(body:  ScreenMainOrderCreate(),),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
