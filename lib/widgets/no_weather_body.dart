import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.redAccent,
          Colors.orangeAccent,
          Colors.yellowAccent,
          Colors.greenAccent,
          Colors.blueAccent,
          Colors.indigo,
          Colors.pinkAccent,
          // Colors.blue,
          // Colors.lightBlue,
          // Colors.lightBlueAccent,
          // Colors.white,
          // Colors.lightBlueAccent,
          // Colors.lightBlue,
          // Colors.blue,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 NOW!!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
