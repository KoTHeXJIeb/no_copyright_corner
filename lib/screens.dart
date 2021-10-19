library config.globals;

import 'package:flutter/material.dart';
import './main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
          child: Column(
        children: const <Widget>[],
      )),
    );
  }
}

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  State<MusicScreen> createState() => _MusicScreen();
}

class _MusicScreen extends State<MusicScreen> {
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
        appBar: AppBar(title: const Text('Music')),
        body: SingleChildScrollView(
            child: Column(
          children: const <Widget>[
            MusicCard(
                title: 'Lofi Beats',
                subtitle: 'Cool music',
                pathToMusicFile: './assets/music/1.mp3')
          ],
        )),
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
}

class FreePicsScreen extends StatefulWidget {
  const FreePicsScreen({Key? key}) : super(key: key);

  State<FreePicsScreen> createState() => _FreePicsScreen();
}

class _FreePicsScreen extends State<FreePicsScreen> {
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
        appBar: AppBar(title: const Text('Free Pics')),
        body: SingleChildScrollView(
            child: Column(
          children: const <Widget>[
            BeautifulCard(
                title: 'Free sound design app',
                subtitle:
                    'Free sound design app for Android which makes sound editing very simple and fast!')
          ],
        )),
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
}

class FreewareScreen extends StatefulWidget {
  const FreewareScreen({Key? key}) : super(key: key);

  State<FreewareScreen> createState() => _FreewareScreen();
}

class _FreewareScreen extends State<FreewareScreen> {
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
        appBar: AppBar(title: const Text('Freeware')),
        body: SingleChildScrollView(
            child: Column(
          children: const <Widget>[
            BeautifulCard(
                title: 'Free sound design app',
                subtitle:
                    'Free sound design app for Android which makes sound editing very simple and fast!')
          ],
        )),
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
}

void _navigateToFreeware(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const FreewareScreen()));
}

void _navigateToMusic(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const MusicScreen()));
}

void _navigateToFreePics(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const FreePicsScreen()));
}

class AddNewItem extends StatelessWidget {
  const AddNewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add new item')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.article),
                hintText: 'Title...',
                border: OutlineInputBorder(),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.ballot),
                hintText: 'Description...',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Upload'))
            // ignore: todo
            // TODO: Upload files stuff
          ],
        ),
      ),
    );
  }
}
