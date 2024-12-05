import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/order_history_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/address_screen.dart';
import 'screens/add_address_screen.dart';

class AppRoutes {
  static const String menuScreen = '/menu_screen';
  static const String cartScreen = '/cart';
  static const String orderHistoryScreen = '/order-history';
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String addressScreen = '/address';
  static const String addAddressScreen = '/add-address';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case orderHistoryScreen:
        return MaterialPageRoute(builder: (_) => OrderHistoryScreen());
      case menuScreen:
        return MaterialPageRoute(builder: (_) => MenuScreen());
      case addressScreen:
        return MaterialPageRoute(builder: (_) => AddressScreen());
      case addAddressScreen:
        return MaterialPageRoute(builder: (_) => AddAddressScreen());
      default:
        return MaterialPageRoute(builder: (_) => WelcomePage());
    }
  }
}
