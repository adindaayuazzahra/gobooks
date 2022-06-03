import 'package:flutter/material.dart';
import 'package:gobooks/styles.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 10,
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: accentColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Colors.black,
            ),
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(75),
            bottomRight: Radius.circular(75),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(140),
          child: Container(
            margin: EdgeInsets.only(bottom: 17),
            height: 100,
            width: 320,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                'assets/image/banner.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
