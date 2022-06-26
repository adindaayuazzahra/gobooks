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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
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
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: secLightColor,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              await AuthServices.signOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const WelcomePage()),
                              );
                            },
                            icon: const Icon(
                              Icons.logout_rounded,
                              color: Colors.black,
                              size: 25,
                            ),
                            label: Text(
                              'Log Out',
                              style:
                                  Theme.of(context).textTheme.button?.copyWith(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          //   child: FFButtonWidget(
                          //     onPressed: () {
                          //       print('Button pressed ...');
                          //     },
                          //     text: 'LOG OUT',
                          //     icon: Icon(
                          //       Icons.logout,
                          //       size: 15,
                          //     ),
                          //     options: FFButtonOptions(
                          //       width: double.infinity,
                          //       height: 50,
                          //       color: Color(0xFFF0E5C8),
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .headline6
                          //           ?.copyWith(color: accentColor),
                          //       borderSide: BorderSide(
                          //         color: Colors.transparent,
                          //         width: 1,
                          //       ),
                          //       borderRadius: 50,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         Container(
      //           width: size.width * 1,
      //           padding: const EdgeInsets.symmetric(vertical: 25.0),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(10),
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey.withOpacity(0.3),
      //                 spreadRadius: 1,
      //                 blurRadius: 3,
      //                 offset: const Offset(2, 3),
      //               ),
      //             ],
      //           ),
      //           child: Column(
      //             children: [
      //               Text('DICODING Indonesia',
      //                   style: Theme.of(context)
      //                       .textTheme
      //                       .headline6
      //                       ?.copyWith(color: accentColor)
      //               ),
      //               const Text('Status : Mahasiswa',
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w500,
      //                   )),
      //               const Text('0812344566655'),
      //               const SizedBox(height: 20),
      //               ElevatedButton.icon(
      //                 style: ElevatedButton.styleFrom(
      //                     primary: secdarkColor,
      //                     padding: const EdgeInsets.symmetric(
      //                         vertical: 6, horizontal: 20
      //                     ),
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20)
      //                     )
      //                 ),
      //                 onPressed: () async {
      //                   await AuthServices.signOut();
      //                   Navigator.push(context,
      //                     MaterialPageRoute(
      //                       builder: (context) => const WelcomePage()
      //                     ),
      //                   );
      //                 },
      //                 icon: const Icon(
      //                   Icons.logout_rounded,
      //                   color: Colors.white,
      //                   size: 25,
      //                 ),
      //                 label: Text(
      //                   'Log Out',
      //                   style: Theme.of(context).textTheme.button?.copyWith(
      //                         fontSize: 20,
      //                         color: Colors.white,
      //                       ),
      //                 ),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   Navigator.push(context,
      //                       MaterialPageRoute(builder:
      //                           (context) => const MainPageAdmin()
      //                       )
      //                   );
      //                 },
      //                 child: Container(
      //                   color: secdarkColor,
      //                   child: const Text('Page untuk Admin'),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
