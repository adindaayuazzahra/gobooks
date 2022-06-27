import 'package:gobooks/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final pages = [
    const Homepage(),
    const SearchPage(),
    const HistoryPage(),
    // const ProfilePage(),
    const AdminProfilePage()
  ];
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
