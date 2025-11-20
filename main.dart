import 'package:flutter/material.dart';
import 'package:healthapp/screen/home_screen.dart' as home;
import 'package:healthapp/screen/login_screen.dart';
import 'package:healthapp/screen/register_screen.dart';
import 'package:healthapp/screen/splash_screen.dart';
import 'package:healthapp/navigation/curved_navbar.dart';
import 'package:healthapp/screen/navbar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF003366),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      
      home: const SplashScreen(),

      // Daftar rute navigasi aplikasi
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainPage(),
        '/navbar': (context) => const MainPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // List halaman
  final List<Widget> _pages = [
    const home.HomeScreen(),
    SearchScreen(),
    AddScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
