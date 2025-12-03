import 'package:flutter/material.dart';
// --- Required Dependencies ---
import 'package:flutter_map/flutter_map.dart'; 
import 'package:latlong2/latlong.dart';
// --- Mock Imports for Context (Assume these exist in your project) ---
// import 'package:uuid/uuid.dart'; 
// import 'package:intl/intl.dart'; 
// import 'models/trip.dart'; 
// import 'models/itinerary_item.dart'; 

// --- Constants ---
const Color kPrimaryBlue = Color(0xFF007AFF); 
const Color kGreenDot = Color(0xFF1CB954); 
const Color kBlueDot = Color(0xFF00BFFF); 

// Mock Models for demonstration purposes
class Trip {
  final String destination;
  final DateTime startDate;
  const Trip({required this.destination, required this.startDate});
}
enum ItineraryItemType { stop }
class ItineraryItem {
  final String title;
  final DateTime time;
  final String? location;
  final String? notes;
  const ItineraryItem({required this.title, required this.time, this.location, this.notes});
}
// Mock UUID implementation
class Uuid {
  const Uuid();
  String v4() => 'mock-uuid-${DateTime.now().millisecondsSinceEpoch}';
}
// Mock DateFormat implementation (using standard Dart)
class DateFormat {
  final String formatString;
  const DateFormat(this.formatString);
  String format(DateTime date) => 
      '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'PM' : 'AM'}';
}


void main() {
  runApp(MaterialApp(
    title: 'Add Itinerary Stop',
    // Mocking the required 'trip' object for the page
    home: AddItineraryStopPage(trip: Trip(destination: 'Taipei', startDate: DateTime.now())), 
    debugShowCheckedModeBanner: false,
  ));
}


class AddItineraryStopPage extends StatefulWidget {
  final Trip? trip; // Making it optional for this standalone demo, but expecting it in your real app

  const AddItineraryStopPage({super.key, this.trip});

  @override
  State<AddItineraryStopPage> createState() => _AddItineraryStopPageState();
}

class _AddItineraryStopPageState extends State<AddItineraryStopPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final MapController _mapController = MapController(); 
  
  // Dynamic State for Location/Time
  Map<String, dynamic> _selectedPlace = {
    'name': 'National Dong Hwa University',
    'location_detail': 'No. 1, Sec. 2, Da Hsueh Rd., Shoufeng Township, Hualien County',
    // --- Initial Coordinates set to NDHU ---
    'latitude': 23.8967, 
    'longitude': 121.5398,
    'time': DateTime.now().add(const Duration(hours: 4)),
  };

  @override
  void initState() {
    super.initState();
    _searchController.text = _selectedPlace['name'];
    _timeController.text = const DateFormat('h:mm a').format(_selectedPlace['time']);
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    _descriptionController.dispose();
    _timeController.dispose();
    _mapController.dispose();
    super.dispose();
  }
  
  // Handles the time picker dialog (Simplified for standalone code)
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedPlace['time']),
    );
    if (picked != null) {
      final now = DateTime.now();
      final newTime = DateTime(
        widget.trip?.startDate.year ?? now.year, 
        widget.trip?.startDate.month ?? now.month, 
        widget.trip?.startDate.day ?? now.day, 
        picked.hour, picked.minute,
      );
      
      setState(() {
        _selectedPlace['time'] = newTime;
        _timeController.text = const DateFormat('h:mm a').format(newTime);
      });
    }
  }

  // New: Dynamic search function using setState and map controller
  void _performSearch(String query) {
    if (query.trim().isEmpty) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Searching for: $query...')),
    );

    // --- SIMULATED LOCATION SEARCH (Coordinates now centered around Hualien) ---
    double newLat = 23.9934; // Hualien City Center
    double newLon = 121.6033;
    String newLocationDetail = 'Hualien City, Taiwan';

    if (query.toLowerCase().contains('taroko')) {
       newLat = 24.1670; newLon = 121.6247; newLocationDetail = 'Taroko National Park, Taiwan';
    } else if (query.toLowerCase().contains('station')) {
       newLat = 23.9934; newLon = 121.6033; newLocationDetail = 'Hualien Station, Taiwan';
    } else if (query.toLowerCase().contains('ndhu') || query.toLowerCase().contains('dong hwa')) {
       newLat = 23.8967; newLon = 121.5398; newLocationDetail = 'National Dong Hwa University, Shoufeng';
    }

    // Update state
    setState(() {
      _selectedPlace = {
        'name': query,
        'location_detail': newLocationDetail,
        'latitude': newLat,
        'longitude': newLon,
        'time': DateTime.now().add(const Duration(hours: 2)),
      };
      _timeController.text = const DateFormat('h:mm a').format(_selectedPlace['time']);
      
      // Move the map camera to the new location
      _mapController.move(
        LatLng(newLat, newLon), 
        17.0, // Zoom level is now 17.0
      );
    });
    // --- END SIMULATION ---
  }


  void _addStopToItinerary() {
    if (_selectedPlace['name'].isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a location first.')),
      );
      return;
    }
    
    // Create ItineraryItem instance to return
    final newItineraryItem = ItineraryItem(
      title: 'Stop: ${_selectedPlace['name']}',
      time: _selectedPlace['time'],
      location: _selectedPlace['location_detail'],
      notes: _descriptionController.text.trim().isNotEmpty 
          ? 'Notes: ${_descriptionController.text}' : null,
    );

    // In your real app, return the item:
    // Navigator.of(context).pop(newItineraryItem);

    // For demo, just show success:
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added "${newItineraryItem.title}" to itinerary!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      body: Stack(
        children: [
          // 1. Dynamic Map View
          MapDisplayWidget(
            latitude: _selectedPlace['latitude'],
            longitude: _selectedPlace['longitude'],
            mapController: _mapController,
          ),

      

          // 3. Sliding Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.45, 
            minChildSize: 0.45,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Handle and Drag Indicator
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                    ),
                    
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        children: [
                          const SizedBox(height: 10),

                          // A. Dynamic Search Bar (Triggers map move)
                          TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              labelText: 'Search Location',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () => _searchController.clear(),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            ),
                            onSubmitted: _performSearch,
                          ),
                          
                          const SizedBox(height: 20),

                          // B. Dynamic Place Name & Time
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Destination', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                    Text(
                                      _selectedPlace['name']!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _selectedPlace['location_detail']!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              // Time Input Field 
                              SizedBox(
                                width: 100,
                                child: InkWell(
                                  onTap: () => _selectTime(context),
                                  child: AbsorbPointer(
                                    child: TextField(
                                      controller: _timeController,
                                      readOnly: true,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        labelText: 'Time',
                                        labelStyle: TextStyle(color: Colors.teal.shade700),
                                        suffixIcon: Icon(Icons.access_time, size: 20, color: Colors.teal.shade700),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(color: Colors.teal.shade700),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                      ),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          const Divider(height: 30),

                          // C. Description Input (User notes)
                          const Text(
                            'Description/Notes for this Stop',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _descriptionController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: 'Add a personal note about this stop...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              contentPadding: const EdgeInsets.all(12),
                            ),
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    
                    // D. Bottom Action Button
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _addStopToItinerary,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                          ),
                          child: const Text(
                            'Add to Itinerary',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// --- Dynamic Map Widget using FlutterMap ---
class MapDisplayWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final MapController mapController;
  
  const MapDisplayWidget({
    super.key, 
    required this.latitude, 
    required this.longitude,
    required this.mapController,
  });

  @override
  Widget build(BuildContext context) {
    // Initial map center is based on the dynamic state variables
    final center = LatLng(latitude, longitude);

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: center,
        initialZoom: 17.0, // <-- ZOOM LEVEL INCREASED HERE
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all, 
        ),
      ),
      children: [
        // 1. Tile Layer (OpenStreetMap default tiles)
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app', 
        ),
        
        // 2. Marker Layer for the Selected Stop (Only one central marker)
        MarkerLayer(
          markers: [
            Marker(
              width: 50.0,
              height: 50.0,
              point: center,
              child: const Icon(
                Icons.location_on,
                color: kPrimaryBlue, // Selected location marker
                size: 40.0,
              ),
            ),
          ],
        ),
        
        // 3. PolylineLayer is intentionally omitted to remove the route line.
      ],
    );
  }
}