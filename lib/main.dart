import 'package:demo/service/api_service.dart';
import 'package:demo/service/storage_service.dart';
import 'package:demo/ui/nav.dart';
import 'package:demo/ui/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: const StorageService()),
        Provider.value(value: const ApiService()),
      ],
      child: MaterialApp(
        title: 'Demo App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorKey: navigatorKey,
        routes: routes,
      ),
    );
  }
}
