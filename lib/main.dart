import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gobooks/bookmark_page.dart';
import 'package:gobooks/main_page.dart';
import 'package:gobooks/styles.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: bgColor,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GoBooks());
}

class GoBooks extends StatelessWidget {
  const GoBooks({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: bgColor,
              secondary: accentColor,
            ),
        textTheme: myTextTheme,
      ),
      //home: const WelcomePage(),
      home: const Mainpage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => Mainpage());
          case BookmarkPage.ROUTE_NAME:
            return CupertinoPageRoute(builder: (_) => BookmarkPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}
