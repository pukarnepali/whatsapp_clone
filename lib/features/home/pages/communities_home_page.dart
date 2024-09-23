import 'package:flutter/material.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';

class CommunitiesHomePage extends StatelessWidget {
  const CommunitiesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.langBgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Communities",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      color: context.theme.langBgColor,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor:
                                        context.theme.photoIconBgColor,
                                    child: Icon(
                                      Icons.close,
                                      color: context.theme.photoIconColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 250,
                                  width: 250,
                                  child: Image.asset(
                                    'assets/images/communities.png',
                                  ),
                                ),
                                Text(
                                  'Create a new community',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Bring together a neighborhood, school or more. Create topic-based groups for members, and easily send them admin announcements.',
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'See example communities',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: context.theme.authAppbarTextColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: context.theme.authAppbarTextColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Get started',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: ListTile(
                tileColor: context.theme.langBgColor,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.people_outlined),
                ),
                title: const Text(
                  'New Community',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ListTile(
              tileColor: context.theme.langBgColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.people_outlined),
              ),
              title: const Text(
                'Family',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              tileColor: context.theme.langBgColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.speaker_notes),
              ),
              title: const Text(
                'Announcements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Message and calls are end-to...'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('05/05/2024'),
                  Icon(
                    Icons.push_pin,
                    color: context.theme.photoIconColor,
                  )
                ],
              ),
            ),
            ListTile(
              tileColor: context.theme.langBgColor,
              leading: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: context.theme.photoIconColor,
                size: 19,
              ),
            )
          ],
        ),
      ),
    );
  }
}
