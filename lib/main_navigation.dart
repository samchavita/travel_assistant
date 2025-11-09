import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'trips_page.dart';
// import 'profile_page.dart';
// import 'settings_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    const Dashboard(),
    const TripsPage(),
    // const ProfilePage(),
    // const SettingsPage(),
  ];

  final Set<int> _pagesWithHeader = {0, 1}; // show header on Dashboard and Plan page

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  PreferredSizeWidget? _buildAppBar() {
  if (!_pagesWithHeader.contains(_selectedIndex)) return null;

  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text
        Expanded(
            child: Column(
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

        // Right: Notification Icon
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
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // Show or hide the header depending on the current page
      appBar: _buildAppBar(),

      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
