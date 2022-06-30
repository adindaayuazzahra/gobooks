export 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
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
export 'package:gobooks/pages/admin/set_book_page.dart';
export 'package:gobooks/pages/welcome_page.dart';
export 'package:gobooks/pages/user/main_page.dart';
export 'package:gobooks/pages/register_page.dart';
export 'package:gobooks/pages/login_page.dart';
export 'package:gobooks/pages/user/detail_book_page.dart';
export 'package:gobooks/pages/admin/dashboard_page.dart';

// => Widget
export 'package:gobooks/widgets/book_by_year_list.dart';
export 'package:gobooks/widgets/book_list.dart';
export 'package:gobooks/widgets/bookmark_list.dart';
export 'package:gobooks/widgets/history_list.dart';
export 'package:gobooks/widgets/latest_book_list.dart';
export 'package:gobooks/widgets/library_book_list.dart';
export 'package:gobooks/widgets/admin_book_list.dart';
export 'package:gobooks/widgets/devider_or.dart';
//=>notification
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification/notification_provider.dart';

// => Assets
export 'package:flutter_svg/svg.dart';
export 'package:lottie/lottie.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.notification!.title}");
}

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  if (getSwitchState() == false) {
    print('notification silent');
    NotificationSettings settings = await messaging.requestPermission(
      alert: false,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission but no notification');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted provisional permission');
    } else {
      print('user declined or has not accepted permission');
    }
  } else {
    print('notification not silent');
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted provisional permission');
    } else {
      print('user declined or has not accepted permission');
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await requestPermission();
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
      home: const WelcomePage(),
      // home: const MainPage(),
      // home: const AdminProfilePage(),

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
          case AdminProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const AdminProfilePage());
          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const ProfilePage());
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
