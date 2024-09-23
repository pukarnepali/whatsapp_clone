import 'package:flutter/material.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
              const Text(
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
          'Account',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Privacy',
                    style: TextStyle(fontSize: 19),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                ),
                Divider(
                  height: 15,
                  indent: 20,
                ),
                ListTile(
                  title: Text(
                    'Security',
                    style: TextStyle(fontSize: 19),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                ),
                Divider(
                  height: 15,
                  indent: 20,
                ),
                ListTile(
                  title: Text(
                    'Two-step Verification',
                    style: TextStyle(fontSize: 19),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                ),
                Divider(
                  height: 15,
                  indent: 20,
                ),
                ListTile(
                  title: Text(
                    'Change Number',
                    style: TextStyle(fontSize: 19),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Request Account Info',
                    style: TextStyle(fontSize: 19),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                ),
                Divider(
                  height: 15,
                  indent: 20,
                ),
                ListTile(
                  title: Text(
                    'Delete My Account',
                    style: TextStyle(fontSize: 19),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: context.theme.photoIconColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
