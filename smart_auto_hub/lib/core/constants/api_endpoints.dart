class ApiEndpoints {
  // Use localhost:3000 for Chrome/Web testing. 
  // If switching back to an Android Emulator, change this to http://10.0.2.2:3000/api
  static const String baseUrl = 'http://localhost:3000/api';

  // Vehicle endpoints
  static const String vehicles = '/vehicles';
  static String vehicleDetails(String id) => '/vehicles/$id';
}
