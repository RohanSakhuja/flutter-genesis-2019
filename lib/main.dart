import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

class UserDetails {
  String id;
  String username;
  String name;
  String email;
  String bestShot;
  String profilePicture;

  UserDetails(
      {this.id,
      this.username,
      this.name,
      this.email,
      this.bestShot,
      this.profilePicture});
}

class HomePageState extends State<HomePage> {
  List<InfoTile> tiles = new List();

  Future<bool> getAllUsers() async {
    String url = 'https://genesis.iecsemanipal.com/getAllUsers';
    var response = await http.get(url);
    print(response.body);
    var res = json.decode(response.body);
    List<UserDetails> users = new List();
    for (var entry in res) {
      print(entry);
      users.add(new UserDetails(
          id: entry['id'],
          username: entry['username'],
          name: entry['name'],
          email: entry['email'],
          bestShot: entry['best_shot'],
          profilePicture: entry['profile_pic']));
    }
    tiles.clear();
    for (UserDetails item in users) {
      tiles.add(InfoTile(name: item.name, imageUrl: item.bestShot));
    }
    return true;
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
            child: FutureBuilder(
              future: getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data) {
                  return ListView.builder(
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new ProfilePage()));
                              },
                              child: Image.network(
                                tiles[index].imageUrl,
                                fit: BoxFit.cover,
                                height: 200.0,
                              ),
                            ),
                          ));
                    },
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  String profileUrl;
  String username;
  String name;
  String email;
  String bestShot;

  ProfilePage({this.profileUrl, this.username, this.name, this.email, this.bestShot});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              image: NetworkImage(widget.bestShot),
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
                backgroundImage: NetworkImage(widget.profileUrl),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color.fromRGBO(11, 7, 59, 0.8),
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Column(
          children: <Widget>[
            Text(widget.name, style: TextStyle(fontSize: 20.0, color: Colors.white),),
            Text(widget.email, style: TextStyle(fontSize: 20.0, color: Colors.white),),
          ],
        )
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
