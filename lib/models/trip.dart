// lib/models/trip.dart
class Trip {
  final String id;
  final String destination;
  final String country;
  final DateTime startDate;
  final DateTime endDate;
  final int durationDays;
  final String type; // e.g., Business, Vacation
  final String imageUrl; // For the trip card background

  Trip({
    required this.id,
    required this.destination,
    required this.country,
    required this.startDate,
    required this.endDate,
    required this.durationDays,
    required this.type,
    required this.imageUrl,
  });
}
