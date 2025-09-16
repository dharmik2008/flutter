import 'package:flutter/material.dart';

class InstagramTabBar extends StatefulWidget {
  @override
  _InstagramTabBarState createState() => _InstagramTabBarState();
}

class _InstagramTabBarState extends State<InstagramTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Reels/Video Page')),
    Center(child: Text('Notifications Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(

        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), // Disable swipe
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(icon: Icon(Icons.home_outlined)),
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.video_library_outlined)),
            Tab(icon: Icon(Icons.favorite_border)),
            Tab(icon: Icon(Icons.person_outline)),
          ],
        ),
      ),
    );
  }
}
