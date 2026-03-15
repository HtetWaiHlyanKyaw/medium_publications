import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medium_publications/cat.dart';

class NullAwareScreen extends StatefulWidget {
  const NullAwareScreen({super.key});

  @override
  State<NullAwareScreen> createState() => _NullAwareScreenState();
}

class _NullAwareScreenState extends State<NullAwareScreen> {
  String? name;
  Cat? randomCat;
  Cat newCat = Cat(name: "Meow");

  @override
  void initState() {
    super.initState();
    name = getName();
    randomCat = getRandomCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. ??
            Text('Name: ${name ?? "Unknown"}'),
            const SizedBox(height: 16),

            // 2. ?.
            Text('Name length: ${name?.length.toString() ?? "Unknown"}'),
            const SizedBox(height: 16),

            // 3. ?. ?. ??
            Text('Random cat name: ${randomCat?.name ?? "Unknown"}'),
            const SizedBox(height: 16),

            Text(
              'Randome cat name length: ${randomCat?.name?.length.toString() ?? "Unknown"}',
            ),
            const SizedBox(height: 16),

            // 5. !
            Text('New cat name: ${newCat.name!.toUpperCase()}'),
            const SizedBox(height: 16),

            // 4. ??=
            Text('New cat age: ${newCat.age?.toString() ?? "Unknown"}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  assignAge(newCat);
                });
              },
              child: const Text('Assign Age'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  removeAge(newCat);
                });
              },
              child: const Text('Remove Age'),
            ),
          ],
        ),
      ),
    );
  }

  Cat? getRandomCat() {
    final random = Random();
    final number = random.nextInt(4);
    if (number == 0) {
      return null;
    }
    return _cats[number - 1];
  }

  String? getName() {
    final random = Random();
    final number = random.nextInt(2);
    if (number == 0) {
      return null;
    }
    return "Htet Wai Hlyan Kyaw";
  }

  final _cats = [
    Cat(name: null, color: "White"),
    Cat(name: "Momo"),
    Cat(name: "Mumu", color: "Gray"),
  ];

  List<Cat> getCats() {
    return _cats;
  }

  void assignAge(Cat cat) {
    final random = Random();
    final age = random.nextInt(10) + 1;
    cat.age ??= age;
  }

  void removeAge(Cat cat) {
    cat.age = null;
  }
}
