import 'package:flutter/material.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/router/parser.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(MyApp());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Jewellery Book',
//       theme: ThemeData(
//         fontFamily: GoogleFonts.lato().fontFamily,
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeScreenLayout(),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouterDelegate delegate;
  late AppRouterParser parser;

  @override
  void initState() {
    super.initState();
    delegate = AppRouterDelegate();
    parser = AppRouterParser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
