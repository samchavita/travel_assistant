// lib/pages/upcoming_trips_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trip.dart';
import 'itinerary_details_page.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  final List<Trip> _upcomingTrips = [
    Trip(
      id: '1',
      destination: 'NDHU Library',
      country: 'Shoufeng',
      startDate: DateTime(2026, 1, 17),
      endDate: DateTime(2026, 1, 24),
      durationDays: 7,
      type: 'Business',
      imageUrl: 'assets/images/ndhu_library.png',
    ),
    Trip(
      id: '2',
      destination: 'NDHU Solar Farm',
      country: 'Shoufeng',
      startDate: DateTime(2026, 2, 14),
      endDate: DateTime(2026, 2, 17),
      durationDays: 4,
      type: 'Vacation',
      imageUrl: 'assets/images/solar_farm.png', 
    ),
    Trip(
      id: '3',
      destination: 'Dormitiory V',
      country: 'Shoufeng',
      startDate: DateTime(2026, 2, 28),
      endDate: DateTime(2026, 2, 29),
      durationDays: 2,
      type: 'Vacation',
      imageUrl: 'assets/images/dorm_V.png', 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5D5FEF);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Upcoming Trips',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune_rounded, color: Colors.black54), // Filter icon
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: _upcomingTrips.length,
        itemBuilder: (context, index) {
          final trip = _upcomingTrips[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItineraryDetailsPage(trip: trip)),
                );
              },
              child: TripCard(trip: trip),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => print('Add trip'),
        backgroundColor: primaryColor,
        elevation: 4,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text("New Trip", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final Trip trip;
  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final dayFormat = DateFormat('dd');
    final monthFormat = DateFormat('MMM');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image Section w/ Date Overlay
          Stack(
            children: [
              Hero(
                tag: 'trip_image_${trip.id}', // Remember this, i believe it be fix if we have unique data
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  child: Image.network(
                    trip.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180,
                      color: Colors.grey[200],
                      child: const Icon(Icons.landscape, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              // Floating Date 
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        dayFormat.format(trip.startDate),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        monthFormat.format(trip.startDate),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
              ),
              // Type
              Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    trip.type.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
          
          // Details Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.destination,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          "${trip.country} • ${trip.durationDays} Days",
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}