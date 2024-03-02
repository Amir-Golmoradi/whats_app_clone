import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/community_features/1_domain/model/community.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ListTile(
              onTap: () => Navigator.pushReplacementNamed(context, '/contact'),
              title: MyText(
                text: 'New community',
                style: typoGraphy.textTheme.bodyLarge!
                    .copyWith(color: theme.primary),
              ),
              leading: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.blueGrey[500]
                          : Colors.blueGrey[300],
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: const Icon(
                      Icons.people_alt,
                      size: 40,
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    right: -1,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.teal,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.sp,
                    vertical: 6.sp,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(14.sp),
                        child: Image.network(communities[index].image),
                      ),
                      title: MyText(
                        text: communities[index].name,
                        style: typoGraphy.textTheme.bodyLarge!
                            .copyWith(color: theme.primary),
                      ),
                      subtitle: MyText(
                        text: communities[index].subName,
                        style: typoGraphy.textTheme.titleSmall!
                            .copyWith(color: theme.primary),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
              
         
              
              
              
               */
