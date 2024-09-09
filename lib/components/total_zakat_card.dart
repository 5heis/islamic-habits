import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final String totalZakat;
  const TopCard({super.key, required this.totalZakat});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Container containing the icon
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Icon(
                Icons.money,
                color: Colors.green,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Text(
                totalZakat,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
