import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Genesis App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class InfoTile {
  String name;
  String imageUrl;
  bool isFavorite;

  InfoTile({this.name, this.imageUrl, this.isFavorite = false});
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List<InfoTile> tiles = new List();

  HomePageState() {
    tiles.add(InfoTile(
        name: 'Rohan',
        imageUrl:
            'https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/06/ultra-wide-mistakes-lead-image.jpg',
        isFavorite: true));
    tiles.add(InfoTile(
        name: 'sdasdasd',
        imageUrl:
            'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
        isFavorite: false));
    tiles.add(InfoTile(
        name: 'asdasdas',
        imageUrl:
            'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
        isFavorite: false));
    tiles.add(InfoTile(
        name: 'fdgdfg',
        imageUrl:
            'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
        isFavorite: true));
    tiles.add(InfoTile(
        name: 'dfgdfg',
        imageUrl:
            'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
        isFavorite: false));
    tiles.add(InfoTile(
        name: 'cbcvbcv',
        imageUrl:
            'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
        isFavorite: true));
    tiles.add(InfoTile(
        name: 'rrrrrrrrrrrrrrrrrrrrrr',
        imageUrl:
            'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
        isFavorite: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 7, 59, 0.8),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 7, 59, 0.8),
        title: Text("Daccia"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Explore',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.white,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Container(
            color: Colors.white,
            child: new ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: tiles.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new ProfilePage()));
                            },
                            child: Image.network(
                              tiles[index].imageUrl,
                              fit: BoxFit.cover,
                              height: 200.0,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                tiles[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  tiles[index].isFavorite =
                                      !tiles[index].isFavorite;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
