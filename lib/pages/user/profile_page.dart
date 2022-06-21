import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';
import 'package:gobooks/pages/admin/main_page_admin.dart';
import 'package:gobooks/widgets/profile_item.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    //border: Border.all(width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                const AssetImage('assets/image/cover_book.jpg'),
                            radius: size.width * 0.15,
                          ),
                          Column(
                            children: [
                              Text('DICODING Indonesia',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(color: accentColor)),
                              const Text('Status : Mahasiswa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  )),
                              const Text('0812344566655')
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPageAdmin()));
                        },
                        child: Container(
                          color: secdarkColor,
                          child: const Text('Page untuk Admin'),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileItem(
                      size: size.width * 0.35,
                      icon: Icons.settings,
                      title: 'Settings'),
                  ProfileItem(
                      size: size.width * 0.35,
                      icon: Icons.bug_report,
                      title: 'Report'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileItem(
                      size: size.width * 0.35,
                      icon: Icons.language,
                      title: 'Language'),
                  ProfileItem(
                      size: size.width * 0.35,
                      icon: Icons.logout,
                      title: 'Log Out'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
