import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/models/user_model.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';

class EditProfile extends ConsumerWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userFuture = ref.watch(authControllerProvider).getCurrentUserInfo();
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
          'Edit Profile',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder<UserModel?>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No user data found.'));
          }

          final user = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 230,
                  width: double.maxFinite,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: context.theme.photoIconColor,
                                  backgroundImage: CachedNetworkImageProvider(
                                      user.profileImageUrl),
                                  radius: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintMaxLines: 2,
                                  hintText:
                                      'Enter your name and add optional profile picture',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  constraints: BoxConstraints(
                                      minHeight: 100,
                                      minWidth: 100,
                                      maxHeight: 100,
                                      maxWidth: 250)),
                            )
                          ],
                        ),
                        Divider(
                          height: 15,
                          indent: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            user.username,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Divider(
                          height: 15,
                          indent: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Text('PHONE NUMBER'),
                ),
                Container(
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '${user.phoneNumber}',
                        constraints: BoxConstraints(
                            maxHeight: 50,
                            minHeight: 50,
                            maxWidth: double.maxFinite),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Text('ABOUT'),
                ),
                Container(
                  color: Colors.white,
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: 'Digital goodies designer-Pixsellz',
                        constraints: BoxConstraints(
                            maxHeight: 50,
                            minHeight: 50,
                            maxWidth: double.maxFinite),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
