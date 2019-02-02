import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  List temp = new List.generate(
      10,
      (index) => ListTile(
            title: Text('$index'),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(primary: true, children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.shutterbug.com/images/17/2pm92117.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 30.0,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                minRadius: 30.0,
                maxRadius: 70.0,
                backgroundImage: NetworkImage(
                  "https://www.shutterbug.com/images/styles/600_wide/public/Beginner-Photography-Mistakes-Peter-McKinnon_0.jpg",
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color.fromRGBO(11, 7, 59, 0.8),
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Followers',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '123k',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Following',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '6.5k',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Shots',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '824',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      GridView.count(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  child: Center(
                    child: Hero(
                      tag: '$index',
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(20.0),
                          child: Image.network(
                            "https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Hero(
                  tag: "$index",
                  child: Image.network(
                    "https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    ]));
  }
}
