import 'package:flutter/material.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';

class StarredMessage extends StatelessWidget {
  const StarredMessage({super.key});

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
          'Starred Messages',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
          ),
          SizedBox(
            height: 10,
            width: double.maxFinite,
          ),
          Text(
            'No Starred Messages',
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
          Text(
            'Tap and hold to star it so you can',
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            'easily find it later',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
