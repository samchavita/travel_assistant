import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  Card buildCard() {
    var heading = 'Restaurants';
    var subheading = 'Lakeside Restaurant';
    var cardImage =  NetworkImage(
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/a8/32/57/caption.jpg?w=1200&h=-1&s=1');
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(heading, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
            subtitle: Text(subheading),
            trailing: const Icon(Icons.favorite_outline),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image(
              image: cardImage,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(supportingText),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextButton(
                        child: Row (
                          children: [
                            const Icon(Icons.star),
                            const Icon(Icons.star),
                            const Icon(Icons.star),
                            const Icon(Icons.star),
                            const Icon(Icons.star_half),
                        ],
                      ),
                        onPressed: () {},
                      ),
                    ],
                  ),

              Column(
                children: [
                  TextButton(
                    child: Row(
                      children: [
                        const Icon(Icons.location_on),
                        const Text('Shoufeng, Hualien')
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
                              ],
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Bella,",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Travelling Today?",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage('https://www.shutterstock.com/image-photo/smiling-african-american-millennial-businessman-600nw-1437938108.jpg')
                      ),
                ],
              ),

              const SizedBox(height: 25),

              // search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.teal),
                    hintText: "Search destination...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // search result
              Center(
                child: Text(
                  _searchQuery.isEmpty
                      ? "Explore destinations and places..."
                      : "Searching for: $_searchQuery",
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),

              // cards
              buildCard(),
              buildCard(),
            ],
          ),
        ),
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Plan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
