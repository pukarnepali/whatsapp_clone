import 'package:flutter/material.dart';

class UpdateListTile extends StatelessWidget {
  const UpdateListTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  final dynamic imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: IconButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
          Color.fromARGB(135, 124, 212, 127),
        )),
        onPressed: () {},
        icon: const Text(
          ' Follow ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
