enum ItineraryItemType { flight, hotel, meeting, dinner, drinks, other, activity }

class ItineraryItem {
  final String id;
  final ItineraryItemType type;
  final String title;
  final DateTime time;
  final String? location; // e.g., address, venue name
  final String? notes; // e.g., "View Boarding Pass", "View Reservation"
  final String? actionUrl; // URL for boarding pass, reservation link, etc.


  ItineraryItem({
    required this.id,
    required this.type,
    required this.title,
    required this.time,
    this.location,
    this.notes,
    this.actionUrl,
  });
}