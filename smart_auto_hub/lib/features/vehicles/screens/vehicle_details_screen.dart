import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/vehicle_model.dart';
import '../../bookings/screens/consultation_booking_screen.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final VehicleModel vehicle;

  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currencyFormat = NumberFormat.currency(symbol: 'LKR ', decimalDigits: 0);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with Image Carousel
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  PageView.builder(
                    itemCount: vehicle.images.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        vehicle.images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(colorScheme),
                      );
                    },
                  ),
                  // Image Indicator Overlay
                  if (vehicle.images.length > 1)
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          vehicle.images.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Vehicle Info
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vehicle.brand,
                                style: theme.textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
                              ),
                              Text(
                                '${vehicle.model} (${vehicle.year})',
                                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            vehicle.status ?? 'Available',
                            style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      currencyFormat.format(vehicle.price),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 40),
                    
                    // Quick Specs Grid
                    _buildSectionTitle(context, 'Vehicle Specifications'),
                    const SizedBox(height: 16),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        _buildSpecItem(context, Icons.settings, 'Transmission', vehicle.transmission ?? 'N/A'),
                        _buildSpecItem(context, Icons.local_gas_station, 'Fuel Type', vehicle.fuelType ?? 'N/A'),
                        _buildSpecItem(context, Icons.speed, 'Mileage', '${NumberFormat('#,###').format(vehicle.mileage)} km'),
                        _buildSpecItem(context, Icons.location_on, 'Location', vehicle.location ?? 'N/A'),
                      ],
                    ),
                    
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Description'),
                    const SizedBox(height: 8),
                    Text(
                      'This ${vehicle.year} ${vehicle.brand} ${vehicle.model} is a high-performance ${vehicle.type ?? "vehicle"} in excellent condition. Equipped with a ${vehicle.transmission} transmission and powered by ${vehicle.fuelType}, it has covered ${vehicle.mileage} km. This car offers a perfect blend of comfort and power.',
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                    ),
                    const SizedBox(height: 100), // Space for bottom button
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConsultationBookingScreen(vehicle: vehicle),
                ),
              );
            },
            child: const Text('Book Consultation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSpecItem(BuildContext context, IconData icon, String label, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.primary, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                )),
                Text(value, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: Icon(Icons.directions_car, size: 100, color: colorScheme.onSurfaceVariant),
    );
  }
}
