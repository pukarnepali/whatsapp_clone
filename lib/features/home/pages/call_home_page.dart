import 'package:flutter/material.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/utils/colors.dart';
import 'package:whatsapp/features/chat/widgets/custom_list_tile.dart';

class CallHomePage extends StatelessWidget {
  const CallHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.langBgColor,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            radius: 9,
            backgroundColor: const Color.fromARGB(118, 216, 216, 216),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz),
            ),
          ),
        ),
        actions: [
          const Row(
            children: [],
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
            const Text(
              'Favorites',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    color: context.theme.langBgColor,
                    borderRadius: BorderRadius.circular(24)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Add favorite',
                        style:
                            TextStyle(color: Coloors.greenDark, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Recent',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .09,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: context.theme.photoIconColor,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 45,
                          color: context.theme.photoIconBgColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '+9811111111 (25)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        '~Name',
                        style: TextStyle(fontSize: 15),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.video_call_outlined,
                            color: context.theme.photoIconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Outgoing',
                            style: TextStyle(
                              fontSize: 15,
                              color: context.theme.photoIconColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Yesterday',
                        style: TextStyle(
                          fontSize: 18,
                          color: context.theme.photoIconColor,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.contact_support,
                        color: context.theme.photoIconColor,
                        size: 29,
                      ),
                    ],
                  ),
                ],
              ),
            )
            // ListTile(
            //   tileColor: Colors.blue,
            //   leading: CircleAvatar(
            //     radius: 35,
            //   ),
            //   title: Text('+9811111111',
            //       style: const TextStyle(
            //           fontSize: 20, fontWeight: FontWeight.bold)),
            //   subtitle: Text('Outgoing'),
            //   trailing: SizedBox(
            //     height: 10,
            //     width: 90,
            //     child: Row(
            //       children: [Text('Yesterday'), Icon(Icons.more)],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
