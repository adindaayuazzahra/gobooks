import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gobooks/pages/admin/admin_book_list.dart';
import 'package:gobooks/pages/admin/admin_main_page.dart';
import 'package:gobooks/pages/user/bookmark_page.dart';
import 'package:gobooks/pages/user/main_page.dart';
import 'package:gobooks/common/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gobooks/pages/user/latest_book_page.dart';
import 'package:gobooks/pages/user/library_book_page.dart';

export 'package:gobooks/pages/user/detail_book_page.dart';
export 'package:gobooks/common/styles.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:flutter/material.dart';
export 'package:gobooks/pages/admin/admin_book_list.dart';
export 'package:gobooks/widgets/book_by_year_list.dart';
export 'package:gobooks/widgets/book_list.dart';
export 'package:gobooks/widgets/bookmark_list.dart';
export 'package:gobooks/widgets/history_list.dart';
export 'package:gobooks/pages/user/book_by_year_page.dart';
export 'package:gobooks/pages/user/bookmark_page.dart';
export 'package:gobooks/pages/user/latest_book_page.dart';
export 'package:gobooks/pages/user/library_book_page.dart';
export 'package:gobooks/widgets/latest_book_list.dart';
export 'package:gobooks/widgets/library_book_list.dart';
export 'package:gobooks/pages/user/history_page.dart';
export 'package:gobooks/pages/user/home_page.dart';
export 'package:gobooks/pages/user/profile_page.dart';
export 'package:gobooks/pages/user/search_page.dart';
export 'package:gobooks/data/auth_service.dart';
export 'package:gobooks/pages/admin/admin_main_page.dart';
export 'package:gobooks/pages/welcome_page.dart';
export 'package:flutter_svg/svg.dart';
export 'package:gobooks/pages/user/main_page.dart';
export 'package:gobooks/pages/register_page.dart';
export 'package:lottie/lottie.dart';
export 'package:gobooks/pages/login_page.dart';
export 'package:gobooks/widgets/devider_or.dart';
export 'package:gobooks/widgets/admin_book_list.dart';



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
      // home: const WelcomePage(),
      // home: const InputBook(),
      // home: const HomePage(),
      // home: const MainPageAdmin(),
      home: const MainPage(),

      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const MainPage());
          case BookmarkPage.routeName:
            return CupertinoPageRoute(builder: (_) => const BookmarkPage());
          case LatestBookPage.routeName:
            return CupertinoPageRoute(builder: (_) => const LatestBookPage());
          // case InputBook.routeName:
          //   return CupertinoPageRoute(builder: (_) => con InputBook());
          case MainPageAdmin.routeName:
            return CupertinoPageRoute(builder: (_) => const MainPageAdmin());
          case AdminBookListPage.routeName:
            return CupertinoPageRoute(builder: (_) => const AdminBookListPage());
          case LibraryBookPage.routeName:
            return CupertinoPageRoute(builder: (_) => const LibraryBookPage());
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
