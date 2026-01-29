import 'package:flutter/material.dart';

// Destination Model
class Destination {
  final String name;
  final String category;
  final String image;
  final String description;
  final String location;
  final double rating;
  final String price;

  Destination({
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.location,
    required this.rating,
    required this.price,
  });
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Destination> allDestinations = [
    Destination(
      name: 'Lakeside Restaurant',
      category: 'Restaurants',
      image: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/a8/32/57/caption.jpg?w=1200&h=-1&s=1',
      location: 'Shoufeng, Hualien',
      rating: 4.5,
      price: '\$150',
      description: 'The Lakeside Restaurant at NDHU offers a peaceful dining experience with a stunning view of the central lake. It is a favorite spot for students and faculty to enjoy local Hualien cuisine.',
    ),
    Destination(
      name: 'NDHU Library',
      category: 'Buildings',
      image: 'assets/images/ndhu_library.png',
      location: 'Shoufeng, Hualien',
      rating: 4.9,
      price: 'Free',
      description: 'The National Dong Hwa University Library is an architectural masterpiece. It serves as the primary research hub for students and offers breathtaking views of the campus mountains.',
    ),
  ];

  List<Destination> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    filteredDestinations = allDestinations;
  }

  void _onSearchChanged(String value) {
    setState(() {
      filteredDestinations = allDestinations
          .where((d) => d.name.toLowerCase().contains(value.toLowerCase()) || 
                       d.category.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Widget buildDestinationCard(Destination data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(destination: data)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 4.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(data.category, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
              subtitle: Text(data.name),
              trailing: const Icon(Icons.favorite_outline),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
              child: Image.network(
                data.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(height: 180, color: Colors.grey[300], child: const Icon(Icons.image_not_supported)),
              ),
            ),
          ],
        ),
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
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                hintText: "Search NDHU places...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            ...filteredDestinations.map((d) => buildDestinationCard(d))
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Destination destination;
  const DetailsPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5D5FEF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(destination.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Back Button
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // 3. The Content Sheet
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dynamic Title and Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            destination.name,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(destination.price, style: const TextStyle(fontSize: 22, color: primaryColor, fontWeight: FontWeight.bold)),
                            const Text("/person", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.blueAccent, size: 18),
                        Text(' ${destination.location}', style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Reviews and Rating Row
                    Row(
                      children: [
                        _buildAvatarStack(),
                        const SizedBox(width: 8),
                        const Text("People Reviewed", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        const Spacer(),
                        const Icon(Icons.star, color: Colors.orange, size: 20),
                        Text(" ${destination.rating} ", style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text("/5", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Overview Section
                    const Text('Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Container(height: 3, width: 35, color: primaryColor, margin: const EdgeInsets.only(top: 4)),
                    const SizedBox(height: 15),

                    // Dynamic Description
                    Text(
                      destination.description,
                      style: const TextStyle(color: Colors.black54, height: 1.5),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          
          // Button
          Positioned(
            bottom: 20, left: 20, right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              child: const Text('See Maps', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

// Reviewer
  Widget _buildAvatarStack() {
    return SizedBox(
      width: 70, height: 30,
      child: Stack(
        children: List.generate(3, (index) {
          return Positioned(
            left: index * 15.0,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 13,
                backgroundImage: NetworkImage('https://www.shutterstock.com/image-photo/smiling-african-american-millennial-businessman-600nw-1437938108.jpg'),
              ),
            ),
          );
        }),
      ),
    );
  }
}