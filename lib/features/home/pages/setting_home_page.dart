import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/models/user_model.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';
import 'package:whatsapp/features/settings/pages/account.dart';
import 'package:whatsapp/features/settings/pages/chats.dart';
import 'package:whatsapp/features/settings/pages/data_storage.dart';
import 'package:whatsapp/features/settings/pages/edit_profile.dart';
import 'package:whatsapp/features/settings/pages/notifications.dart';
import 'package:whatsapp/features/settings/pages/starred_message.dart';

class SettingHomePage extends ConsumerWidget {
  const SettingHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userFuture = ref.watch(authControllerProvider).getCurrentUserInfo();
    return Scaffold(
      backgroundColor: context.theme.langBgColor,
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SearchBar(
                    constraints: BoxConstraints(minHeight: 29),
                    hintText: 'Search',
                    hintStyle: WidgetStatePropertyAll(TextStyle(
                      fontSize: 20,
                    )),
                    leading: Icon(
                      Icons.search_outlined,
                      size: 30,
                    ),
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(177, 239, 236, 236),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()));
                    },
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: context.theme.photoIconColor,
                      backgroundImage:
                          CachedNetworkImageProvider(user.profileImageUrl),
                    ),
                    title: Text(
                      user.username,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    subtitle: Text(
                      '${user.username}, click to edit',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
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
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StarredMessage()));
                          },
                          leading: Icon(
                            Icons.star_border_outlined,
                            color: context.theme.photoIconColor,
                          ),
                          title: const Text('Starred Messages'),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: context.theme.photoIconColor,
                          ),
                        ),
                        Divider(
                          height: 15,
                          indent: 60,
                          color: context.theme.langBgColor,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.desktop_windows,
                            color: context.theme.photoIconColor,
                          ),
                          title: Text('WhatsApp Web/Deskptop'),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AccountPage()));
                          },
                          leading: Icon(
                            Icons.account_box,
                            color: context.theme.photoIconColor,
                          ),
                          title: const Text('Account'),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: context.theme.photoIconColor,
                          ),
                        ),
                        Divider(
                          height: 15,
                          indent: 60,
                          color: context.theme.langBgColor,
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Chats()));
                          },
                          leading: Icon(
                            Icons.chat_bubble,
                            color: context.theme.photoIconColor,
                          ),
                          title: const Text('Chats'),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: context.theme.photoIconColor,
                          ),
                        ),
                        Divider(
                          height: 15,
                          indent: 60,
                          color: context.theme.langBgColor,
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Notifications()));
                          },
                          leading: Icon(
                            Icons.notifications,
                            color: context.theme.photoIconColor,
                          ),
                          title: const Text('Notifications'),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: context.theme.photoIconColor,
                          ),
                        ),
                        Divider(
                          height: 15,
                          indent: 60,
                          color: context.theme.langBgColor,
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const DataStorage()));
                          },
                          leading: Icon(
                            Icons.data_object,
                            color: context.theme.photoIconColor,
                          ),
                          title: const Text('Data and Storage Usage'),
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
                          leading: Icon(
                            Icons.help_center,
                            color: context.theme.photoIconColor,
                          ),
                          title: Text('Help'),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: context.theme.photoIconColor,
                          ),
                        ),
                        Divider(
                          height: 15,
                          indent: 60,
                          color: context.theme.langBgColor,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.favorite_border,
                            color: context.theme.photoIconColor,
                          ),
                          title: Text('Tell a Friend'),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: context.theme.photoIconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
