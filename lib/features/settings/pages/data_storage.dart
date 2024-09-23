import 'package:flutter/material.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';

class DataStorage extends StatefulWidget {
  const DataStorage({super.key});

  @override
  State<DataStorage> createState() => _DataStorageState();
}

class _DataStorageState extends State<DataStorage> {
  bool light = false;
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
          'Data and Storage Usage',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('MEDIA AUTO-DOWNLOAD'),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  minTileHeight: 40,
                  title: Text('Photos'),
                  trailing: SizedBox(
                    width: 119.5,
                    child: Row(
                      children: [
                        Text(
                          'Wi-Fi and Cellular',
                          style: TextStyle(fontSize: 11),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: context.theme.photoIconColor,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  indent: 15,
                ),
                ListTile(
                  minTileHeight: 40,
                  title: Text('Audio'),
                  trailing: SizedBox(
                    width: 51.5,
                    child: Row(
                      children: [
                        Text(
                          'Wi-Fi',
                          style: TextStyle(fontSize: 11),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: context.theme.photoIconColor,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  indent: 15,
                ),
                ListTile(
                  minTileHeight: 40,
                  title: Text('Videos'),
                  trailing: SizedBox(
                    width: 51.5,
                    child: Row(
                      children: [
                        Text(
                          'Wi-Fi',
                          style: TextStyle(fontSize: 11),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: context.theme.photoIconColor,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  indent: 15,
                ),
                ListTile(
                  minTileHeight: 40,
                  title: Text('Documents'),
                  trailing: SizedBox(
                    width: 51.5,
                    child: Row(
                      children: [
                        Text(
                          'Wi-Fi',
                          style: TextStyle(fontSize: 11),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: context.theme.photoIconColor,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  indent: 15,
                ),
                ListTile(
                  minTileHeight: 40,
                  title: Text(
                    'Reset Auto-Download Settings',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 15, bottom: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Voice Messages are always automatically download'),
                Text('for the best communication experience'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('CALL SETTINGS'),
          ),
          ListTile(
            tileColor: Colors.white,
            title: const Text('Low Data Usage'),
            trailing: Switch(
                value: light,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    light = value;
                  });
                }),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 15, bottom: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lower the amount of data used during WhatsAoo'),
                Text('call on cellular'),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: Text('Network Usage'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                ),
                Divider(
                  height: 10,
                  indent: 15,
                ),
                ListTile(
                  title: Text('Storage Usage'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
