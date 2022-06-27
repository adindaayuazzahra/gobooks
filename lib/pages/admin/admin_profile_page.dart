import 'package:gobooks/main.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
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
                  color: accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dicoding Indonesia',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white)),
                    const Text('Status : Admin Perpustakaan',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                    const Text(
                      '0812344566655',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AdminMainPage()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
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
                    Icons.manage_accounts,
                    color: Colors.black,
                    size: 25,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Set Buku',
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
          InkWell(
            onTap: () async {
              await AuthServices.signOut();
              Navigator.push(context,
                MaterialPageRoute(builder:
                    (context) => const WelcomePage()
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              height: size.height * 1 / 16,
              width: size.width * 0.8,
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
        ],
      ),
    );
  }
}
