import 'package:flutter/material.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/models/user_model.dart';
import 'package:whatsapp/common/utils/colors.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contactSource,
    required this.onTap,
  });

  final UserModel contactSource;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.only(
        left: 20,
        right: 10,
      ),
      leading: CircleAvatar(
        backgroundColor: context.theme.greyColor!.withOpacity(.3),
        radius: 20,
        backgroundImage: contactSource.profileImageUrl.isEmpty
            ? NetworkImage(contactSource.profileImageUrl)
            : null,
        child: contactSource.profileImageUrl.isEmpty
            ? const Icon(Icons.person, size: 30, color: Colors.white)
            : null,
      ),
      title: Text(
        contactSource.username,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: contactSource.profileImageUrl.isNotEmpty
          ? Text(
              "Hey there! I'm using WhatsApp",
              style: TextStyle(
                color: context.theme.greyColor,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      trailing: contactSource.profileImageUrl.isEmpty
          ? TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(foregroundColor: Coloors.greenDark),
              child: const Text("INVITE"),
            )
          : null,
    );
  }
}
