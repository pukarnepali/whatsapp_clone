import 'package:flutter/material.dart';

import 'package:whatsapp/common/extension/custom_theme_extension.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool light = true;
  bool light2 = true;
  bool light3 = true;
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
          child: const Row(
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                color: Colors.blue,
                size: 30,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                    fontSize: 17),
              )
            ],
          ),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Column(
            children: [
              Text('WARNING:Push Notifications are disabled'),
              Text('to enable visit:'),
              Text('Phone Setting > Notifications > WhatsApp'),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 15,
                indent: 15,
                endIndent: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('MESSAGE NOTIFICATIONS'),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Show Notifications'),
                  trailing: Switch(
                      value: light,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          light = value;
                        });
                      }),
                ),
                const Divider(
                  height: 5,
                  indent: 15,
                ),
                ListTile(
                  title: Text(
                    'Sound',
                  ),
                  trailing: SizedBox(
                    width: 63,
                    child: Row(
                      children: [
                        Text(
                          'Note',
                          style: TextStyle(fontSize: 17),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: context.theme.photoIconColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('GORUP NOTIFICATIONS'),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Show Notifications'),
                  trailing: Switch(
                      value: light2,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          light2 = value;
                        });
                      }),
                ),
                const Divider(
                  height: 5,
                  indent: 15,
                ),
                ListTile(
                  title: Text(
                    'Sound',
                  ),
                  trailing: SizedBox(
                    width: 63,
                    child: Row(
                      children: [
                        Text(
                          'Note',
                          style: TextStyle(fontSize: 17),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: context.theme.photoIconColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              'In-App Notifications',
            ),
            subtitle: Text('Banners, Sounds, Vibrate'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: context.theme.photoIconColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            tileColor: Colors.white,
            title: const Text('Show Preview'),
            trailing: Switch(
                value: light3,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    light3 = value;
                  });
                }),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 3.0, top: 5, bottom: 5),
            child: Text('Preview message text inside new message notification'),
          ),
          const ListTile(
            tileColor: Colors.white,
            title: Text(
              'Reset Notifications Settings',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
