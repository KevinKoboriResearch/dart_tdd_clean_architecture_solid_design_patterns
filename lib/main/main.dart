import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/components/components.dart';
import 'factories/factories.dart';

void main() {
  final app = AndroidApp(); // platform == ios ? IosApp : AndroidApp
  runApp(app);
}

// class IosApp extends StatelessWidget {}

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4Dev',
      theme: makeAppTheme(),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: makeLoginPage,// ponteiro, nao pode ser executada = makeLoginPage();
        )
      ],
    );
  }
}
