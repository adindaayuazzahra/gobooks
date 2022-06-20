import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gobooks/pages/admin/booking_list_page.dart';
import 'package:gobooks/pages/admin/list_of_books.dart';
import 'package:gobooks/pages/admin/main_page_admin.dart';
import 'package:gobooks/pages/admin/input_book_page.dart';
import 'package:gobooks/pages/user/bookmark_page.dart';
import 'package:gobooks/pages/user/main_page.dart';
import 'package:gobooks/common/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gobooks/pages/user/Latest_Book_Page.dart';
import 'package:gobooks/pages/user/Library_Book_Page.dart';
import 'package:gobooks/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: bgColor,
  ));

  runApp(const GoBooks());
}

class GoBooks extends StatelessWidget {
  const GoBooks({Key? key}) : super(key: key);

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
      // home: const WelcomePage(), => yang utama
      // home: const InputBook(),
      // home: const HomePage(),
      // home: const MainPageAdmin(),
      home: const MainPage(),

      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const MainPage());
          case BookmarkPage.ROUTE_NAME:
            return CupertinoPageRoute(builder: (_) => const BookmarkPage());
          case LatestBookPage.ROUTE_NAME:
            return CupertinoPageRoute(builder: (_) => const LatestBookPage());
          case InputBook.ROUTE_NAME:
            return CupertinoPageRoute(builder: (_) => const InputBook());
          case MainPageAdmin.ROUTE_NAME:
            return CupertinoPageRoute(builder: (_) => const MainPageAdmin());
          case BookingPage.ROUTE_NAME:
            return CupertinoPageRoute(builder: (_) => const BookingPage());
          case LibraryBookPage.ROUTE_NAME:
            return CupertinoPageRoute(
                builder: (_) => const LibraryBookPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
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
