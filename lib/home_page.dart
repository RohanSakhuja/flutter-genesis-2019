import 'package:flutter/material.dart';

import './profile_page.dart';

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
