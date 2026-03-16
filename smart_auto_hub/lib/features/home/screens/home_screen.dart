import 'package:flutter/material.dart';
import '../../bookings/screens/consultation_booking_screen.dart';
import '../../vehicles/services/vehicle_api_service.dart';
import '../../vehicles/models/vehicle_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = ["All", "SUV", "Sedan", "Hybrid", "Luxury"];
  String _selectedCategory = "All";
  
  // Dynamic data for featured vehicles
  List<VehicleModel> _featuredVehicles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFeaturedVehicles();
  }

  Future<void> _loadFeaturedVehicles() async {
    try {
      final vehicles = await VehicleApiService().fetchVehicles();
      setState(() {
        _featuredVehicles = vehicles;
        _isLoading = false;
      });
    } catch (e) {
      print("Failed to load home vehicles: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, textTheme),
              _buildSearchBar(context, colorScheme, textTheme),
              _buildCategories(context, colorScheme, textTheme),
              _buildConsultationBanner(context, colorScheme, textTheme),
              _buildFeaturedVehicles(context, colorScheme, textTheme),
              const SizedBox(height: 24), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "Find your dream car",
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Handle notification tap
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search vehicles, brands, or models...",
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.5),
          ),
          prefixIcon: Icon(Icons.search, color: colorScheme.onSurface.withOpacity(0.5)),
          filled: true,
          // Use a muted background color based on surface
          fillColor: colorScheme.onSurface.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 48, // Allows for comfortable touch targets
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            final isSelected = _selectedCategory == category;

            // Optional subtle border to prevent unselected matching background entirely
            final borderColor = isSelected 
                ? Colors.transparent 
                : colorScheme.onSurface.withOpacity(0.12);

            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Material(
                color: isSelected ? colorScheme.primary : colorScheme.surface,
                borderRadius: BorderRadius.circular(10.0),
                elevation: isSelected ? 2 : 0,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: borderColor),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                    child: Text(
                      category,
                      style: textTheme.bodyMedium?.copyWith(
                        color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedVehicles(BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Vehicles",
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Handle See All tap
                },
                child: Text(
                  "See All",
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 300,
          child: _isLoading 
            ? const Center(child: CircularProgressIndicator())
            : _featuredVehicles.isEmpty 
                ? const Center(child: Text("No vehicles available right now."))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: _featuredVehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = _featuredVehicles[index];
                      return _buildVehicleCard(vehicle, colorScheme, textTheme);
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildConsultationBanner(BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.primary, colorScheme.primary.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Need Expert Advice?",
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Book a free consultation today!",
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConsultationBookingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: colorScheme.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Book Now"),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.handshake_rounded,
              size: 80,
              color: Colors.white.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleCard(VehicleModel vehicle, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: SizedBox(
        width: 250,
        child: Card(
          color: colorScheme.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              // TODO: Push to Vehicle Details Screen
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top 60%: Image
                Expanded(
                  flex: 6,
                  child: Image.network(
                    vehicle.images.isNotEmpty ? vehicle.images.first : '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: colorScheme.onSurface.withOpacity(0.05),
                        child: Icon(
                          Icons.directions_car,
                          size: 40,
                          color: colorScheme.onSurface.withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
                // Bottom 40%: Details
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${vehicle.year} ${vehicle.brand} ${vehicle.model}",
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${vehicle.type ?? 'Used'} • ${vehicle.mileage} miles",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.6),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Text(
                          "\$${vehicle.price.toStringAsFixed(0)}",
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
