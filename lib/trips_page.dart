// lib/pages/upcoming_trips_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trip.dart'; // Make sure to create this file
import 'itinerary_details_page.dart'; // Will create this next

class TripsPage extends StatefulWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  // Dummy data for now
  final List<Trip> _upcomingTrips = [
    Trip(
      id: '1',
      destination: 'NDHU Library',
      country: 'Shoufeng',
      startDate: DateTime(2020, 1, 17),
      endDate: DateTime(2020, 1, 24),
      durationDays: 7,
      type: 'Business',
      imageUrl: 'assets/images/ndhu_library.png',
    ),
    Trip(
      id: '2',
      destination: 'NDHU Solar Farm',
      country: 'Shoufeng',
      startDate: DateTime(2020, 2, 14),
      endDate: DateTime(2020, 2, 17),
      durationDays: 4,
      type: 'Vacation',
      imageUrl: 'assets/images/solar_farm.png', // Example image
    ),
    Trip(
      id: '3',
      destination: 'Dormitory V',
      country: 'Shoufeng',
      startDate: DateTime(2020, 3, 10),
      endDate: DateTime(2020, 3, 15),
      durationDays: 5,
      type: 'Business',
      imageUrl: 'assets/images/dorm_V.png', // Example image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Itinerary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Upcoming Trips 2020',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: _upcomingTrips.length,
                  itemBuilder: (context, index) {
                    final trip = _upcomingTrips[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ItineraryDetailsPage(trip: trip),
                          ),
                        );
                      },
                      child: TripCard(trip: trip),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 100, // Adjust position as needed
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Handle edit action for the main list
              },
              backgroundColor: Colors.orange.shade100,
              mini: true,
              child: Icon(Icons.edit_outlined, color: Colors.orange.shade700),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a page to add a new trip
          // For now, let's just print
          print('Add new trip');
        },
        backgroundColor: Colors.teal.shade300,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final dateFormatter = DateFormat('MMM d');

  return Card(
    margin: const EdgeInsets.only(bottom: 16.0),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.destination,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  trip.country,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '${dateFormatter.format(trip.startDate)} - ${dateFormatter.format(trip.endDate)} | ${trip.durationDays} days',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  trip.type,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Right side image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              trip.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, size: 40),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}