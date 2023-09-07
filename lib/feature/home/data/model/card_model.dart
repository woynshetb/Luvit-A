class CardData {
  int? age;
  String? description;
  List<String> images = [];
  int? likeCount;
  String? name;
  String? location;
  List<String> tags = [];

  CardData({
    required this.age,
    required this.description,
    required this.images,
    required this.likeCount,
    required this.location,
    required this.name,
    required this.tags,
  });

  CardData.fromJson(Map<String, dynamic> json) {
    images = parseObjectListToStringList(
      json['images'],
    );
    location = json['location'];
    age = json['age'];
    description = json['description'];
    likeCount = json['likeCount'];
    name = json['name'];
    tags = parseObjectListToStringList(
      json['tags'],
    );
  }

  List<String> parseObjectListToStringList(List<Object?> listOfObjectList) {
    List<String> listOfStringList = [];

    for (int i = 0; i < listOfObjectList.length; i++) {
      listOfStringList.add(
        listOfObjectList[i].toString(),
      );
    }
    return listOfStringList;
  }
}
