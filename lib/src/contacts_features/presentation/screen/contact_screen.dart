import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/I18n/en.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/I18n/translation.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/contacts_features/domain/model/contacts.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main');
          },
        ),
        centerTitle: true,
        title: MyText(
          text: AppMessage.calls.tr,
          style: typoGraphy.textTheme.headlineMedium!
              .copyWith(color: theme.primary),
        ),
      ),
      body: Column(
        children: [
          createNew(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(Ionicons.person),
            ),
            title: MyText(
              text: AppMessage.newGroup.tr,
              style: typoGraphy.textTheme.bodyLarge!.copyWith(
                color: theme.primary,
              ),
            ),
            trailing: const Icon(null),
          ),
          createNew(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(Icons.person_add),
            ),
            title: MyText(
              text: AppMessage.newContact.tr,
              style: typoGraphy.textTheme.bodyLarge!.copyWith(
                color: theme.primary,
              ),
            ),
            trailing: Icon(
              Ionicons.qr_code,
              color: theme.inversePrimary.withOpacity(0.6),
            ),
          ),
          createNew(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(Icons.group_add),
            ),
            title: MyText(
              text: AppMessage.newCommunity.tr,
              style: typoGraphy.textTheme.bodyLarge!.copyWith(
                color: theme.primary,
              ),
            ),
            trailing: const Icon(null),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: MyText(
              text: AppTranslation == EnglishLanguage
                  ? 'Contacts on WhatsApp'
                  : 'مخاطبین واتساپ',
              style: typoGraphy.textTheme.titleMedium!
                  .copyWith(color: theme.primary),
            ),
          ),
          SizedBox(height: 16.sp),
          Expanded(
            child: ListView.builder(
              itemCount: contactData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(contactData[index]['image']!),
                    ),
                    title: MyText(text: contactData[index]['name']!),
                    subtitle: MyText(text: contactData[index]['subtitle']!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createNew({
    required Widget leading,
    required Widget title,
    required Widget trailing,
  }) {
    return ListTile(
      leading: leading,
      title: title,
      trailing: trailing,
    );
  }
}
