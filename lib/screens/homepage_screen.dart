import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  @override
  State<HomepageScreen> createState() => _homepagescreenstate();
}

class _homepagescreenstate extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "Homepage banaunai baki xa"
        ),
      ),
    );
  }
}
