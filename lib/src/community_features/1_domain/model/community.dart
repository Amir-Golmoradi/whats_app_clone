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
    name: 'Community 1',
    subName: 'Community 1 sub name',
    image: 'https://picsum.photos/300/300',
  ),
  CommunityModel(
    name: 'Community 2',
    subName: 'Community 2 sub name',
    image: 'https://picsum.photos/300/300',
  ),
  CommunityModel(
    name: 'Community 3',
    subName: 'Community 3 sub name',
    image: 'https://picsum.photos/300/300',
  ),
  CommunityModel(
    name: 'Community 4',
    subName: 'Community 4 sub name',
    image: 'https://picsum.photos/300/300',
  ),
];
