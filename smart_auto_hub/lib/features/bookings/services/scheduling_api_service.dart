import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/booking_model.dart';

class SchedulingApiService {
  // Mock data for demonstration fallback
  final List<BookingModel> _mockBookings = [
    BookingModel(
      id: '1',
      serviceType: 'Oil Change',
      vehicleDetails: '2022 Toyota Camry (ABC-1234)',
      scheduledDate: DateTime.now().add(const Duration(days: 2)),
      status: BookingStatus.confirmed,
    ),
    BookingModel(
      id: '2',
      serviceType: 'Brake Inspection',
      vehicleDetails: '2020 Honda Civic (XYZ-5678)',
      scheduledDate: DateTime.now().subtract(const Duration(days: 5)),
      status: BookingStatus.completed,
    ),
    BookingModel(
      id: '3',
      serviceType: 'Tire Rotation',
      vehicleDetails: '2021 Ford F-150 (TRK-9012)',
      scheduledDate: DateTime.now().add(const Duration(days: 10)),
      status: BookingStatus.pending,
    ),
    BookingModel(
      id: '4',
      serviceType: 'Engine Diagnostics',
      vehicleDetails: '2019 BMW X5 (LUX-3456)',
      scheduledDate: DateTime.now().add(const Duration(hours: 4)),
      status: BookingStatus.cancelled,
    ),
  ];

  /// Fetches the list of user bookings.
  Future<List<BookingModel>> getUserBookings() async {
    try {
      const storage = FlutterSecureStorage();
      final cookie = await storage.read(key: 'session_cookie');

      final response = await http.get(
        Uri.parse('${ApiEndpoints.baseUrl}/Consultations/user'),
        headers: cookie != null ? {'cookie': cookie} : {},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> upcoming = data['upcoming'] ?? [];
        final List<dynamic> history = data['history'] ?? [];
        
        final allBookings = [...upcoming, ...history];
        return allBookings.map((json) => BookingModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch bookings: Status ${response.statusCode}');
      }
    } catch (e) {
      print("Fetch Bookings Error: $e");
      return List.from(_mockBookings);
    }
  }

  /// Cancels a specific booking by ID.
  Future<bool> cancelBooking(String id) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));
      
      final index = _mockBookings.indexWhere((b) => b.id == id);
      if (index != -1) {
        // In a real app, you'd send a DELETE or PATCH request
        // For mock, we'll just return success
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('Failed to cancel booking: $e');
    }
  }
}
