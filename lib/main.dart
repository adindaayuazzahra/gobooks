export 'package:firebase_core/firebase_core.dart';
import 'package:gobooks/main.dart';

export 'package:flutter/services.dart';
export 'package:flutter/material.dart';
export 'package:gobooks/common/styles.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:gobooks/authentication/auth_service.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:google_sign_in/google_sign_in.dart';

// => page
export 'package:gobooks/pages/user/book_by_year_page.dart';
export 'package:gobooks/pages/user/bookmark_page.dart';
export 'package:gobooks/pages/user/latest_book_page.dart';
export 'package:gobooks/pages/user/library_book_page.dart';
export 'package:gobooks/pages/user/history_page.dart';
export 'package:gobooks/pages/user/home_page.dart';
export 'package:gobooks/pages/user/profile_page.dart';
export 'package:gobooks/pages/user/search_page.dart';
export 'package:gobooks/pages/admin/admin_main_page.dart';
export 'package:gobooks/pages/welcome_page.dart';
export 'package:gobooks/pages/user/main_page.dart';
export 'package:gobooks/pages/register_page.dart';
export 'package:gobooks/pages/login_page.dart';
export 'package:gobooks/pages/user/detail_book_page.dart';
export 'package:gobooks/pages/admin/admin_profile_page.dart';

// => Widget
export 'package:gobooks/widgets/book_by_year_list.dart';
export 'package:gobooks/widgets/book_list.dart';
export 'package:gobooks/widgets/bookmark_list.dart';
export 'package:gobooks/widgets/history_list.dart';
export 'package:gobooks/widgets/latest_book_list.dart';
export 'package:gobooks/widgets/library_book_list.dart';
export 'package:gobooks/widgets/admin_book_list.dart';
export 'package:gobooks/widgets/devider_or.dart';

// => Assets
export 'package:flutter_svg/svg.dart';
export 'package:lottie/lottie.dart';

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
      title: 'goBooks',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: bgColor,
              secondary: accentColor,
            ),
        textTheme: myTextTheme,
      ),
      // home: const WelcomePage(),
      home: const MainPage(),

      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const MainPage());
          case BookmarkPage.routeName:
            return MaterialPageRoute(builder: (_) => const BookmarkPage());
          case LatestBookPage.routeName:
            return MaterialPageRoute(builder: (_) => const LatestBookPage());
          case AdminMainPage.routeName:
            return MaterialPageRoute(builder: (_) => const AdminMainPage());
          case LibraryBookPage.routeName:
            return MaterialPageRoute(builder: (_) => const LibraryBookPage());
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
