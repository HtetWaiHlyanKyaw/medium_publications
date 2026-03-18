import 'package:flutter/material.dart';
import 'package:medium_publications/api_service.dart';
import 'package:medium_publications/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _isAuthenticated = ApiService.instance.isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          if (_isLoading)
            CircularProgressIndicator()
          else if (!_isAuthenticated)
            FilledButton(onPressed: authenticate, child: Text('Login'))
          else
            FilledButton(onPressed: logout, child: Text('Logout')),

          SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: FilledButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          ),
          child: Text('Profile Page'),
        ),
      ),
    );
  }

  void authenticate() async {
    setState(() {
      _isLoading = true;
    });

    _isAuthenticated = await ApiService.instance.authenticate();

    setState(() {
      _isLoading = false;
    });
  }

  void logout() async {
    setState(() {
      _isLoading = true;
    });

    _isAuthenticated = !await ApiService.instance.logout();
    setState(() {
      _isLoading = false;
    });
  }
}
