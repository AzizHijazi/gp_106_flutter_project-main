class ApiSettings {
  static const String _baseUrl = "http://10.0.2.2:8000/api/";
  static const String _mainUrl = "http://10.0.2.2:8000/";
  static const String register = '${_baseUrl}auth/register';
  static const String login = '${_baseUrl}auth/login';
  static const String logout = '${_baseUrl}auth/logout';
  static const String hubs = '${_baseUrl}hubs';
  static const String allModels = '${_baseUrl}all';
  static const String workSpaceCategory = '${_baseUrl}workSpaceCategory';
  static const String allForHub = '${_baseUrl}allForHub/{id}';
  static const String myOrders = '${_baseUrl}auth/order/myOrders?type={type}';
  static const String myRents = '${_baseUrl}auth/rent/myRent?type={type}';
  static const String imageUrl = '${_mainUrl}';

}