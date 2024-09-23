import 'package:flutter/material.dart';

import 'package:whatsapp/common/extension/custom_theme_extension.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.langBgColor,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                color: context.theme.photoIconColor,
                size: 30,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: context.theme.photoIconColor,
                    fontSize: 17),
              )
            ],
          ),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('Change Wallpaper'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: context.theme.photoIconColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            tileColor: Colors.white,
            title: const Text('Save to Camera Roll'),
            trailing: Switch(
                value: light,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    light = value;
                  });
                }),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('Automatically save photos and videos you receive'),
          const Text('to your Phone Camera Roll'),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('Chat Backup'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: context.theme.photoIconColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              color: Colors.white,
              child: const Column(
                children: [
                  ListTile(
                    title: Text(
                      'Archive All Chats',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Divider(
                    height: 15,
                    indent: 20,
                  ),
                  ListTile(
                    title: Text('Archive All Chats',
                        style: TextStyle(color: Colors.red)),
                  ),
                  Divider(
                    height: 15,
                    indent: 20,
                  ),
                  ListTile(
                    title: Text(
                      'Archive All Chats',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
