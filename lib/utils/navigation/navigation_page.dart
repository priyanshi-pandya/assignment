import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../constants/navigation_map.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constants.appNavPageTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: Navigation().navigate.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Navigation().navigate.values.elementAt(index)));
                    },
                    child: Text("${Navigation().navigate.keys.elementAt(index)}"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
