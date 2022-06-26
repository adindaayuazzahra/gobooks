import 'package:gobooks/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
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
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width,
                height: size.height * 1/6,
                margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
                            ?.copyWith(color: Colors.white)
                    ),
                    const Text('Status : Mahasiswa',
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
              await AuthServices.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WelcomePage()
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(16.0),
              height: size.height * 1/16,
              width: size.width,
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

      // body: SafeArea(
      //   child: GestureDetector(
      //     onTap: () => FocusScope.of(context).unfocus(),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Row(
      //           mainAxisSize: MainAxisSize.max,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: size.width * 0.9,
      //               height: 200,
      //               decoration: BoxDecoration(
      //                 color: accentColor,
      //                 borderRadius: BorderRadius.circular(20),
      //               ),
      //               child: Padding(
      //                 padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      //                 child: Column(
      //                   mainAxisSize: MainAxisSize.max,
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   children: [
      //                     Text('Dicoding Indonesia',
      //                         style: Theme.of(context)
      //                             .textTheme
      //                             .headline6
      //                             ?.copyWith(color: Colors.white)),
      //                     const Text('Status : Mahasiswa',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w500,
      //                           color: Colors.white,
      //                         )),
      //                     const Text(
      //                       '0812344566655',
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     const SizedBox(height: 20),
      //                     ElevatedButton.icon(
      //                       style: ElevatedButton.styleFrom(
      //                           primary: secLightColor,
      //                           padding: const EdgeInsets.symmetric(
      //                               vertical: 13, horizontal: 70),
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(20))),
      //                       onPressed: () async {
      //                         await AuthServices.signOut();
      //                         Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                               builder: (context) => const WelcomePage()),
      //                         );
      //                       },
      //                       icon: const Icon(
      //                         Icons.logout_rounded,
      //                         color: Colors.black,
      //                         size: 25,
      //                       ),
      //                       label: Text(
      //                         'Log Out',
      //                         style:
      //                             Theme.of(context).textTheme.button?.copyWith(
      //                                   fontSize: 20,
      //                                   color: Colors.black,
      //                                 ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
