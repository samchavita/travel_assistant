// lib/pages/itinerary_details_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trip.dart';
import '../models/itinerary_item.dart';
import 'add_itinerary_item_page.dart'; // Will create this next

class ItineraryDetailsPage extends StatefulWidget {
  final Trip trip;

  const ItineraryDetailsPage({Key? key, required this.trip}) : super(key: key);

  @override
  State<ItineraryDetailsPage> createState() => _ItineraryDetailsPageState();
}

class _ItineraryDetailsPageState extends State<ItineraryDetailsPage> {
  // Dummy data for itinerary items
  final List<ItineraryItem> _itineraryItems = [
    ItineraryItem(
      id: 'item1',
      type: ItineraryItemType.flight,
      title: 'Flight BOS to EDI',
      time: DateTime(2020, 1, 17, 5, 30),
      notes: 'View Boarding Pass',
      actionUrl: 'https://example.com/boardingpass',
    ),
    ItineraryItem(
      id: 'item2',
      type: ItineraryItemType.hotel,
      title: 'Hotel Check-in Airbnb',
      time: DateTime(2020, 1, 17, 15, 0),
      location: '1 Princes Street, EH2 2QE Scotland',
      notes: 'View Reservation on Airbnb',
      actionUrl: 'https://example.com/airbnb_reservation',
    ),
    ItineraryItem(
      id: 'item3',
      type: ItineraryItemType.meeting,
      title: 'Meeting UK Creative Team',
      time: DateTime(2020, 1, 17, 16, 30),
      location: '11 Great King Street, EH3 6QW Scotland',
    ),
    ItineraryItem(
      id: 'item4',
      type: ItineraryItemType.dinner,
      title: 'Dinner UK Creative Team',
      time: DateTime(2020, 1, 17, 18, 30),
      location: 'TBD',
    ),
    ItineraryItem(
      id: 'item5',
      type: ItineraryItemType.drinks,
      title: 'Drinks College Friends',
      time: DateTime(2020, 1, 17, 21, 0),
      location: 'TBD',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final dayFormatter = DateFormat('EEEE MMM d'); // Friday JAN 17
    final timeFormatter = DateFormat('h:mm a'); // 5:30am

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Intinerary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Text(
                  'Schedule',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                child: Text(
                  '${widget.trip.destination} ${dayFormatter.format(widget.trip.startDate)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  itemCount: _itineraryItems.length,
                  itemBuilder: (context, index) {
                    final item = _itineraryItems[index];
                    return ItineraryTimelineItem(
                      item: item,
                      timeFormatter: timeFormatter,
                      isLast: index == _itineraryItems.length - 1,
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
                // Handle edit action for the schedule
              },
              backgroundColor: Colors.orange.shade100,
              mini: true,
              child: Icon(Icons.edit_outlined, color: Colors.orange.shade700),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () async {
        final newItem = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddItineraryItemPage(trip: widget.trip),
          ),
        );

      if (newItem != null && newItem is ItineraryItem) {
        setState(() {
          _itineraryItems.add(newItem);

          // Optional: Sort items by time
          _itineraryItems.sort((a, b) => a.time.compareTo(b.time));
        });
      }
  },
  backgroundColor: Colors.teal.shade300,
  child: const Icon(Icons.add, color: Colors.white, size: 30),
),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ItineraryTimelineItem extends StatelessWidget {
  final ItineraryItem item;
  final DateFormat timeFormatter;
  final bool isLast;

  const ItineraryTimelineItem({
    Key? key,
    required this.item,
    required this.timeFormatter,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.teal.shade100,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0), // Space between items
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.title} ${timeFormatter.format(item.time)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (item.location != null)
                    Text(
                      item.location!,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                  if (item.notes != null)
                    GestureDetector(
                      onTap: () {
                        // Handle action (e.g., open URL)
                        if (item.actionUrl != null) {
                          print('Opening URL: ${item.actionUrl}');
                          // You would use url_launcher package here
                          // launchUrl(Uri.parse(item.actionUrl!));
                        }
                      },
                      child: Text(
                        item.notes!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.teal.shade500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}