import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'trips_page.dart';
import 'chatbot.dart';
import 'maps.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  final List<int> _navigationHistory = [0];

  late final List<Widget> _pages = [
    const Dashboard(),
    const TripsPage(),
    const AddItineraryStopPage(),
    const ChatbotApp(),
    // const SettingsPage(),
  ];

  final Set<int> _pagesWithHeader = {0, 1, 2}; 

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex == index) return;
      
      _selectedIndex = index;

      if (_navigationHistory.length > 1 && _navigationHistory[_navigationHistory.length - 2] == index) {
        _navigationHistory.removeLast();
      } else {
        _navigationHistory.add(index);
      }
    });
  }
  
  void _onBackTapped() {
    if (_navigationHistory.length > 1) {
      _navigationHistory.removeLast();
      
      setState(() {
        _selectedIndex = _navigationHistory.last;
      });
    }
  }

  PreferredSizeWidget? _buildAppBar() {
  if (!_pagesWithHeader.contains(_selectedIndex)) return null;

  final bool showBackButton = _navigationHistory.length > 1;

  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: _onBackTapped,
          )
        : null,
    
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align title left
              mainAxisSize: MainAxisSize.min,
              children: const [
                // Text(
                //   "Hi Bella,",
                //   style: TextStyle(fontSize: 16, color: Colors.black54),
                // ),
                Text(
                  "NDHU Travel App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

        // Notif Icon and Profile
        Row(
          children: [
             IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.teal),
                onPressed: () {},
             ),
             const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/image-photo/smiling-african-american-millennial-businessman-600nw-1437938108.jpg',
                ),
              ),
          ],
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),

      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          key: ValueKey<int>(_selectedIndex),
          child: _pages[_selectedIndex],
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Plan"),
          BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "GuideBook"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}