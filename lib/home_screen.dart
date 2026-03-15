import 'package:flutter/material.dart';
import 'package:medium_publications/data/repo/repo.dart';
import 'package:medium_publications/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Repo repo = Repo();
  User? user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online / Offline Data Demo')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user?.name ?? 'Unknown'),
                  const SizedBox(height: 10),
                  Text(user?.email ?? 'Unknown'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: isLoading ? null : _getUser,
                    child: const Text('Refresh'),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _getUser() async {
    setState(() {
      isLoading = true;
    });

    try {
      final fetchedUser = await repo.getUser();
      setState(() {
        user = fetchedUser;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
