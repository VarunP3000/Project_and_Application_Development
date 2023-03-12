import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/database.dart';

class TrailCard extends StatelessWidget {
  final DatabaseService databaseService;

  TrailCard(this.databaseService);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      databaseService.TrailName,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      databaseService.TrailDescription,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      "Experience: " + databaseService.experience.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Flexible(
                        child: Text(
                      "Safety: " + databaseService.safety.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 89, 10, 218),
                        fontWeight: FontWeight.bold,
                      ),
                    )))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
