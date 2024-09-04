import 'package:flutter/material.dart';

class BadgeWithIconButtonPage extends StatefulWidget {
  const BadgeWithIconButtonPage({super.key, required this.title});

  final String title;

  @override
  State<BadgeWithIconButtonPage> createState() =>
      _BadgeWithIconButtonPageState();
}

class _BadgeWithIconButtonPageState extends State<BadgeWithIconButtonPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: _counter > 0
                  ? Badge.count(
                      count: _counter,
                      padding: const EdgeInsets.all(4),
                      textStyle: const TextStyle(fontSize: 13),
                      child: const Icon(Icons.notifications),
                    )
                  : const Icon(Icons.notifications),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {},
              icon: const Badge(
                label: Text('Offline'),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                child: Icon(Icons.wifi_off),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _counter++;
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
