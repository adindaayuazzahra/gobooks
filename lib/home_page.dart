import 'package:flutter/material.dart';
import 'package:gobooks/styles.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'GoBooks',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )),
        backgroundColor: secdarkColor,
      ),
      body: Column(
        children: [
          const SubHeading(title: 'Exclusive customization'),
          SizedBox(
            height: 150,
            child: Row(
              children: [
                Flexible(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.cyanAccent,
                            margin: const EdgeInsets.all(8.0),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Center(
                              child: Text('Goose')
                          ),
                        )
                      ],
                    )
                ),
                Flexible(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.deepOrangeAccent,
                            margin: const EdgeInsets.all(8.0),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Center(
                              child: Text('Goose')
                          ),
                        )
                      ],
                    )
                ),
                Flexible(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.indigo,
                            margin: const EdgeInsets.all(8.0),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Center(
                              child: Text('Goose')
                          ),
                        )
                      ],
                    )
                ),
                Flexible(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.lightGreen,
                            margin: const EdgeInsets.all(8.0),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Center(
                              child: Text('Goose')
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          const SubHeading(title: 'Recommended books'),
          const Recommendation(color: Colors.blueGrey),
          // SizedBox(
          //   height: 80,
          //   child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //           children: const <Widget>[
          //             Recommendation(color: Colors.lightBlueAccent),
          //             Recommendation(color: Colors.lightBlueAccent),
          //             Recommendation(color: Colors.lightBlueAccent),
          //           ]
          //       )
          //   ),
          // ),
        ],
      )
    );
  }
}

class Recommendation extends StatelessWidget {
  final Color color;

  const Recommendation({
    Key? key,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    color: color,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Art design album',
                            style: myTextTheme.bodyMedium
                        ),
                        Text(
                            'JONDesigner',
                            style: myTextTheme.bodySmall
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Text('5.0')
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubHeading extends StatelessWidget {
  final String title;
  // final Function onTap;

  const SubHeading({
    Key? key,
    required this.title,
    // required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              title,
              style: myTextTheme.bodyLarge
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              'more',
              style: TextStyle(
                color: Colors.blue
              )
          ),
        ),

        // InkWell(
        //   onTap: () => onTap(),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Row(
        //       children: const [
        //         Text('See More'),
        //         Icon(Icons.arrow_forward_ios)],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}