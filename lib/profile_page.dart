import 'package:flutter/material.dart';
import 'package:medium_publications/api_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isAuthenticated = ApiService.instance.isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(
        child: Text(_isAuthenticated ? 'Authenticated' : 'Not Authenticated'),
      ),
    );
  }
}
