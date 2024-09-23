import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/models/last_message_model.dart';
import 'package:whatsapp/common/models/user_model.dart';
import 'package:whatsapp/common/routes/routes.dart';
import 'package:whatsapp/common/utils/colors.dart';
import 'package:whatsapp/features/chat/controller/chat_controller.dart';

class ChatHomePage extends ConsumerStatefulWidget {
  const ChatHomePage({super.key});

  @override
  ConsumerState<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends ConsumerState<ChatHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.langBgColor,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            radius: 17,
            backgroundColor: const Color.fromARGB(118, 216, 216, 216),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                      backgroundColor: Color.fromARGB(118, 216, 216, 216),
                      radius: 17,
                      child: Icon(Icons.camera_enhance_rounded)),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.contact);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(135, 124, 212, 127),
                    radius: 17,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Chats",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const SearchBar(
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
              height: 15,
            ),
            Row(
              children: [
                buildSelectableContainer(0, "All"),
                buildSelectableContainer(1, "Unread"),
                buildSelectableContainer(2, "Favorites"),
                buildSelectableContainer(3, "Groups"),
              ],
            ),
            StreamBuilder<List<LastMessageModel>>(
              stream: ref.watch(chatControllerProvider).getAllLastMessageList(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Coloors.greenDark,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final lastMessageData = snapshot.data![index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.chat,
                          arguments: UserModel(
                            username: lastMessageData.username,
                            uid: lastMessageData.contactId,
                            profileImageUrl: lastMessageData.profileImageUrl,
                            active: true,
                            lastSeen: 0,
                            phoneNumber: '0',
                            groupId: [],
                          ),
                        );
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lastMessageData.username),
                          Text(
                            DateFormat.Hm().format(lastMessageData.timeSent),
                            style: TextStyle(
                                fontSize: 13, color: context.theme.greyColor),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          lastMessageData.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.theme.greyColor,
                          ),
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            lastMessageData.profileImageUrl),
                        radius: 24,
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildSelectableContainer(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 35,
        width: text.length * 12.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromARGB(135, 124, 212, 127)
              : const Color.fromARGB(177, 239, 236, 236),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 74, 74, 74),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
