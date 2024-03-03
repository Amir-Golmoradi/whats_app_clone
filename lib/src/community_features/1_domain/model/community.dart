import 'package:get/get_utils/get_utils.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';

class CommunityModel {
  CommunityModel({
    required this.name,
    required this.subName,
    required this.image,
  });

  final String name;
  final String subName;
  final String image;
}

final List<CommunityModel> communities = <CommunityModel>[
  CommunityModel(
    name: AppMessage.community.tr,
    subName: AppMessage.community.tr,
    image: 'https://picsum.photos/300/300',
  ),
  CommunityModel(
    name: AppMessage.community.tr,
    subName: AppMessage.community.tr,
    image: 'https://picsum.photos/300/300',
  ),
  CommunityModel(
    name: AppMessage.community.tr,
    subName: AppMessage.community.tr,
    image: 'https://picsum.photos/300/300',
  ),
  CommunityModel(
    name: AppMessage.community.tr,
    subName: AppMessage.community.tr,
    image: 'https://picsum.photos/300/300',
  ),
];
