import 'package:flutter/material.dart';

class Albums extends StatefulWidget {
  Albums({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {

  final albums = ['Modern Times', 'Chat-Shire', 'Palette'];

  Widget _buildRow(String albumTitle) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      },
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: ListTile(
            title: Text(albumTitle),
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return _buildRow(albums[index]);
        },
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
