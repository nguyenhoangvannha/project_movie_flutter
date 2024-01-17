import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const Guide(
      {Key? key,
      this.icon = Icons.search,
      this.title = 'Search guide',
      this.subtitle = 'Type to search'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 60,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
