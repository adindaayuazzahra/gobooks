import 'package:gobooks/main.dart';
import 'package:gobooks/notification/notification_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isNotif = false;
  @override
  void initState() {
    super.initState();
    initUser();
    getSwitchValues();
  }

  getSwitchValues() async {
    isNotif = (await getSwitchState())!;
    setState(() {});
  }

  initUser() async {
    user = _auth.currentUser!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.9,
                  height: size.height * 1 / 6,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  decoration: BoxDecoration(
                    color: secdarkColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${user.email}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white)),
                      const Text('Status : Mahasiswa',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                await AuthServices.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(16.0),
                height: size.height * 1 / 16,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: secLightColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.logout_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Log Out',
                      style: Theme.of(context).textTheme.button?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                'Notification',
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              Switch(
                value: isNotif,
                onChanged: (bool value) {
                  setState(() {
                    isNotif = value;
                    print('switch state changed to ${value}');
                    saveSwitchState(value);
                  });
                },
                activeTrackColor: Colors.greenAccent,
                activeColor: Colors.green,
              ),
            ]),
          ]),
    );
  }
}
