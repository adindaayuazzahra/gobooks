import 'package:gobooks/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        // centerTitle: false,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 320,
                    height: 200,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dicoding Indonesia',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white)),
                          const Text('Status : Mahasiswa',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )),
                          const Text(
                            '0812344566655',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  await AuthServices.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomePage()),
                  );
                },
                child: Container(
                  height: 55,
                  width: 320,
                  decoration: BoxDecoration(
                    color: secLightColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.black,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Log Out',
                        style: Theme.of(context).textTheme.button?.copyWith(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
