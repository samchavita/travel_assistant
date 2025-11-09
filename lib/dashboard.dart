import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  Card buildCard() {
    const heading = 'Restaurants';
    const subheading = 'Lakeside Restaurant';
    const cardImage = NetworkImage(
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/a8/32/57/caption.jpg?w=1200&h=-1&s=1',
    );
    const supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text(
              heading,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            subtitle: Text(subheading),
            trailing: Icon(Icons.favorite_outline),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(supportingText),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Row(
                    children: [
                      Icon(Icons.star, size: 18),
                      Icon(Icons.star, size: 18),
                      Icon(Icons.star, size: 18),
                      Icon(Icons.star, size: 18),
                      Icon(Icons.star_half, size: 18),
                    ],
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 4),
                      Text('Shoufeng, Hualien'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
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

            // Search result text
            Center(
              child: Text(
                _searchQuery.isEmpty
                    ? "Explore destinations and places..."
                    : "Searching for: $_searchQuery",
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            // Cards
            buildCard(),
            buildCard(),
          ],
        ),
      ),
    );
  }
}