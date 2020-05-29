import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () => showAboutDialog(
                context: context,
                useRootNavigator: true,
                applicationName: 'IU Lyrics',
                applicationVersion: '20.05.01',
                applicationLegalese: 'Copyright 2020 Eric Nguyen',
                applicationIcon: Image.asset('assets/launcher.png', scale: 2.0,),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('This is a fan-made lyrics app for IU. I do not own any of the lyrics or images shown in this app.\n\nThis app is open-sourced under the MIT License and can be found at github.com/airicbear/iu-lyrics.')
                  )
                ]
              ),
              child: ListTile(
                title: Text('About')
              ),
            ),
          )
        ],
      )
    );
  }
}
