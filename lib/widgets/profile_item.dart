import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget{
  final double size;
  final IconData icon;
  final String title;

  const ProfileItem({
    Key? key,
    required this.size,
    required this.icon,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            //border: Border.all(width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child:Column(
            children: [
              Icon(
                icon,
                size: size,
              ),
              Text(title)
            ],
          )
      ),
    );
  }
}