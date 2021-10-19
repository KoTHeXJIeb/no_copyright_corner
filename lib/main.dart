library config.globals;

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'screens.dart';

AudioPlayer audioPlayer = AudioPlayer();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = "No Copyright Corner";

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Copyright Corner',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      // lightTheme: ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch: Colors.purple,
      // ),
      home: const MyHomePage(title: title),
    );
  }
}

class BeautifulCard extends StatelessWidget {
  final String title;
  final String subtitle;

  // ignore: use_key_in_widget_constructors
  const BeautifulCard({required String title, required String subtitle})
      // ignore: prefer_initializing_formals
      : title = title,
        // ignore: prefer_initializing_formals
        subtitle = subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.article, size: 50),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('Add to favorites',
                      style: TextStyle(color: Colors.grey)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Added to favorites!'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            // ignore: todo
                            // TODO
                          },
                        ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: const Text('Read more',
                      style: TextStyle(color: Colors.grey)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MusicCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pathToMusicFile;

  // ignore: use_key_in_widget_constructors
  const MusicCard(
      {Key? key,
      required String title,
      required String subtitle,
      required String pathToMusicFile})
      // ignore: prefer_initializing_formals
      : title = title,
        // ignore: prefer_initializing_formals
        subtitle = subtitle,
        // ignore: prefer_initializing_formals
        pathToMusicFile = pathToMusicFile;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15), top: Radius.zero),
        ),
        elevation: 10,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: const Icon(Icons.music_note, size: 50),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          TextButton(
              onPressed: () {
                audioPlayer.play(pathToMusicFile);
              },
              child: const Icon(Icons.play_arrow, size: 50)),
        ]));
  }
}

class ImageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pathToImage;

  // ignore: use_key_in_widget_constructors
  const ImageCard(
      {Key? key,
      required String title,
      required String subtitle,
      required String pathToImage})
      // ignore: prefer_initializing_formals
      : title = title,
        // ignore: prefer_initializing_formals
        subtitle = subtitle,
        // ignore: prefer_initializing_formals
        pathToImage = pathToImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15), top: Radius.zero),
      ),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(image: AssetImage(pathToImage)),
          ListTile(
            leading: const Icon(Icons.article, size: 50),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('Add to favorites',
                      style: TextStyle(color: Colors.grey)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Added to favorites!'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            // ignore: todo
                            // TODO
                          },
                        ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: const Text('Read more',
                      style: TextStyle(color: Colors.grey)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);
  static const drawerTitle = 'No Copyright Corner';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const DrawerHeader(
            child: Center(
              child: Text(
                drawerTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favorites'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.apps),
            title: const Text('Freeware'),
            onTap: () => {_navigateToFreeware(context)},
          ),
          ListTile(
            leading: const Icon(Icons.album),
            title: const Text('Free Music'),
            onTap: () => {_navigateToMusic(context)},
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Free Pics'),
            onTap: () => {_navigateToFreePics(context)},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {_navigateToSettings(context)},
          ),
        ],
      ),
    );
  }
}

void _navigateToFreeware(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const FreewareScreen()));
}

void _navigateToMusic(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const MusicScreen()));
}

void _navigateToSettings(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
}

void _navigateToFreePics(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const FreePicsScreen()));
}

void _navigateToAddNewItem(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const AddNewItem()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      _navigateToFreeware(context);
    } else if (index == 2) {
      _navigateToMusic(context);
    } else if (index == 3) {
      _navigateToFreePics(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              BeautifulCard(
                  title: 'Hello World!',
                  subtitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
              ImageCard(
                title: 'Hello World!',
                subtitle: 'Hello World!',
                pathToImage: '../lib/assets/image.jpg',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _navigateToAddNewItem(context);
            },
            tooltip: 'Add new item',
            child: const Icon(Icons.add)),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'Freeware'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.album), label: 'Free music'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt), label: 'Free Pics'),
            ],
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped));
  }

  addNewItem() {}
}

void setState(Null Function() param0) {}
