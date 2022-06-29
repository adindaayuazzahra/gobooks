import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gobooks/main.dart';
import 'package:gobooks/notification/notification.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String notificationMessages = "";
  int currentIndex = 0;
  final pages = [
    const Homepage(),
    const SearchPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();

    LocalNotificationService.initilize();

    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          notificationMessages =
              "${event.notification!.title} ${event.notification!.body} I am coming from terminated state";
        });
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      setState(() {
        notificationMessages =
            "${event.notification!.title} ${event.notification!.body} I am coming from foreground";
      });
    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMessages =
            "${event.notification!.title} ${event.notification!.body} I am coming from background";
      });
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(message.data);
        print(message.notification!.title);
        print(message.notification!.body);
      }
    });
    print(notificationMessages);
    //onbackground notification
    FirebaseMessaging.onMessageOpenedApp.listen((event) {});
    //foreground notification
    FirebaseMessaging.onMessage.listen((event) {
      print(event);
      if (event.notification != null) {
        print(event.notification!.title);
        print(event.notification!.body);
        /* showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("Notification"),
                  content: Text(
                      '${event.notification!.title}/n ${event.notification!.body!}'),
                  actions: [
                    TextButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]);
            });*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
        height: 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: accentColor,
          unselectedItemColor: secLightColor,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded), label: "beranda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_rounded), label: "Riwayat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "akun"),
          ],
        ),
      ),
    );
  }
}
