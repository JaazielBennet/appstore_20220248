import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _currentIndex == 4
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              )
            : const Icon(
                Icons.search,
                color: Colors.black,
              ),
        title: _currentIndex == 0
            ? const Text(
                'Today: February 3',
                style: TextStyle(color: Colors.black),
              )
            : const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _currentIndex == 0
          ? TodayTab()
          : _currentIndex == 4
              ? SearchTab()
              : Center(
                  child: Text(''),
                ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Apps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Arcade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }

  String _getTabName(int index) {
    switch (index) {
      case 1:
        return 'Games';
      case 2:
        return 'Apps';
      case 3:
        return 'Arcade';
      case 4:
        return 'Search';
      default:
        return '';
    }
  }
}

class TodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppCell(
          appName: 'Black Clover M',
          appIcon: Icons.gamepad,
        ),
        AppCell(
          appName: 'SHEIN-Shopping Online',
          appIcon: Icons.card_travel,
        ),
        AppContainer(
          title: 'Top Apps This Week',
          apps: [
            AppCell(
              appName: 'HBO Max: Stream TV & Movies',
              appIcon: Icons.tv,
            ),
            AppCell(
              appName: 'TikTok - Videos, Music & LIVE',
              appIcon: Icons.video_call,
            ),
            AppCell(
              appName: 'Crunchyroll',
              appIcon: Icons.tv,
            ),
            AppCell(
              appName: 'Picsart Photo Video Edito AI',
              appIcon: Icons.camera,
            ),
          ],
        ),
        AppContainer(
          title: 'Hot This Week',
          apps: [
            AppCell(
              appName: 'Cinépolis',
              appIcon: Icons.local_movies,
            ),
          ],
        ),
      ],
    );
  }
}

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DiscoverContainer(
          title: 'Discover',
          items: [
            DiscoverItem(
              text: 'Chrome Cast',
              icon: Icons.search,
            ),
            DiscoverItem(
              text: 'Fire TV',
              icon: Icons.search,
            ),
            DiscoverItem(
              text: 'PDF Converter',
              icon: Icons.search,
            ),
            DiscoverItem(
              text: 'My Little Pony',
              icon: Icons.search,
            ),
            DiscoverItem(
              text: 'Matematicas',
              icon: Icons.search,
            ),
            DiscoverItem(
              text: 'Juegos de Terror',
              icon: Icons.search,
            ),
          ],
        ),
        SizedBox(height: 30.0),
        SuggestedContainer(),
      ],
    );
  }
}

class DiscoverContainer extends StatelessWidget {
  final String title;
  final List<DiscoverItem> items;

  DiscoverContainer({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          ...items,
        ],
      ),
    );
  }
}

class DiscoverItem extends StatelessWidget {
  final String text;
  final IconData icon;

  DiscoverItem({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggested',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          for (int i = 1; i <= 15; i++)
            AppCell(
              appName: 'App',
              appIcon: Icons.apps,
            ),
        ],
      ),
    );
  }
}

class AppContainer extends StatelessWidget {
  final String title;
  final List<Widget> apps;

  AppContainer({required this.title, required this.apps});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          ...apps,
        ],
      ),
    );
  }
}

class AppCell extends StatelessWidget {
  final String appName;
  final IconData appIcon;

  AppCell({required this.appName, required this.appIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(appIcon),
      title: Text(appName),
      subtitle: Text('Aplicación de ejmplo'),
      trailing: Icon(Icons.cloud_download),
      onTap: () {},
    );
  }
}
