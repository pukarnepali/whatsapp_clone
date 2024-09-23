import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/models/user_model.dart';
import 'package:whatsapp/features/auth/controller/auth_controller.dart';
import 'package:whatsapp/features/chat/widgets/update_list_tile.dart';
import 'package:whatsapp/features/status/pages/status_camera.dart';
import 'package:whatsapp/features/status/pages/status_edit.dart';

class UpdateHomePage extends ConsumerWidget {
  const UpdateHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userFuture = ref.watch(authControllerProvider).getCurrentUserInfo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.langBgColor,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
              radius: 17,
              backgroundColor: const Color.fromARGB(118, 216, 216, 216),
              child:
                  InkWell(onTap: () {}, child: const Icon(Icons.more_horiz))),
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
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Updates",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .1,
                    color: context.theme.langBgColor,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              CachedNetworkImageProvider(user.profileImageUrl),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Status',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Add to my status'),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.theme.photoIconBgColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icons/camera.png',
                                  color: context.theme.photoIconColor,
                                ),
                                iconSize: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            CircleAvatar(
                              backgroundColor: context.theme.photoIconBgColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: context.theme.photoIconColor,
                                ),
                                iconSize: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    )

                    // ListTile(
                    //   leading: const CircleAvatar(
                    //     radius: 35,
                    //   ),
                    //   title: const Text(
                    //     'My Status',
                    //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    //   ),
                    //   subtitle: const Text('Add to my status'),
                    //   trailing: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       CircleAvatar(
                    //         backgroundColor: context.theme.photoIconBgColor,
                    //         child: IconButton(
                    //           onPressed: () {},
                    //           icon: Image.asset(
                    //             'assets/icons/camera.png',
                    //             color: context.theme.photoIconColor,
                    //           ),
                    //           iconSize: 30,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 15,
                    //       ),
                    //       CircleAvatar(
                    //         backgroundColor: context.theme.photoIconBgColor,
                    //         child: IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(
                    //             Icons.edit,
                    //             color: context.theme.photoIconColor,
                    //           ),
                    //           iconSize: 25,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 20,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Channels",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Stay updated on topics that matter to you. Find channels to follow below.',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Find channels to follow',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_up_outlined),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          UpdateListTile(
                            imageUrl: "assets/images/unicef.png",
                            title: 'Unicef Health',
                            subtitle: '5M followers',
                          ),
                          UpdateListTile(
                            imageUrl: "assets/images/realmadrid.png",
                            title: 'Real Madrid C.F.',
                            subtitle: '62.9M followers',
                          ),
                          UpdateListTile(
                            imageUrl: "assets/images/whatsapp.png",
                            title: 'WhatsApp',
                            subtitle: '189M followers',
                          ),
                          UpdateListTile(
                            imageUrl: "assets/images/liverpool.png",
                            title: 'Liverpool Football Club',
                            subtitle: '20.2M followers',
                          ),
                          UpdateListTile(
                            imageUrl: "assets/images/juventus.png",
                            title: 'Juventus',
                            subtitle: '4.8M followers',
                          ),
                        ],
                      ),
                      IconButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        onPressed: () {},
                        icon: const Text(
                          'Explore more',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
