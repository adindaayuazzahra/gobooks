import 'package:flutter/material.dart';
import 'package:gobooks/common/styles.dart';

class DetailBookPage extends StatelessWidget {
  const DetailBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(
            'Detail Buku',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: accentColor,
              size: 25,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: const Icon(
                  Icons.bookmark_outline_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              )
            )
          ],
          backgroundColor: Colors.blue.withOpacity(0),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/image/cover_book.jpg',
                                fit: BoxFit.cover,
                                width: size.height * 0.15,
                              ),
                              const SizedBox(height: 5),
                              const Text('BN11MAX5JFJ67890'),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                      'Status : ',
                                      style: TextStyle(color: accentColor)
                                  ),
                                  Text(
                                      'Tersedia',
                                      style: TextStyle(color: Colors.green)
                                  ),
                                  // Text(
                                  //     'Tidak tersedia',
                                  //     style: TextStyle(color: Colors.red)
                                  // )
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    width: size.height * 0.15,
                                    margin: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(2, 3),
                                        ),
                                      ],
                                    ),
                                    child: const Text(
                                      'Pinjam',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(color: Colors.black87, thickness: 2,),
                      Expanded(
                        flex: 7,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Pendidikan Matematika Dasar',
                                style: Theme.of(context).textTheme.headline6
                                    ?.copyWith(color: Colors.black, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                  'Author',
                                  style: Theme.of(context).textTheme.headline6
                                      ?.copyWith(color: accentColor)
                              ),
                              const Text('Matt Ridley'),
                              Text(
                                  'Penerbit',
                                  style: Theme.of(context).textTheme.headline6
                                      ?.copyWith(color: accentColor)
                              ),
                              const Text('Matt Ridley'),
                              Text(
                                  'Letak Buku',
                                  style: Theme.of(context).textTheme.headline6
                                      ?.copyWith(color: accentColor)
                              ),
                              const Text('Rak A103/2/4'),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
              ),
              Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Sinopsis',
                        style: Theme.of(context).textTheme.headline6
                            ?.copyWith(color: accentColor),
                      ),
                      const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut tristique et egestas quis. Dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu. Massa tincidunt nunc pulvinar sapien et ligula. Eu mi bibendum neque egestas. Convallis posuere morbi leo urna molestie at elementum. Blandit turpis cursus in hac habitasse platea dictumst quisque. Ante metus dictum at tempor commodo ullamcorper a. Et ultrices neque ornare aenean euismod. Cursus metus aliquam eleifend mi in nulla posuere sollicitudin. Maecenas ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra tellus in hac habitasse platea dictumst vestibulum rhoncus est. Ut sem nulla pharetra diam. Accumsan lacus vel facilisis volutpat est velit egestas dui. Tempor orci eu lobortis elementum nibh.'),
                    ],
                  ),
                )
              ),
            ],
          ),
        )
    );
  }
}
