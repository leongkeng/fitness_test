class ChallengeListModel {
  List<DailyTask>? dailyTasks;

  ChallengeListModel({
    this.dailyTasks,
  });

  factory ChallengeListModel.fromJson(Map<String, dynamic> json) => ChallengeListModel(
    dailyTasks: json["daily_tasks"] == null ? [] : List<DailyTask>.from(json["daily_tasks"]!.map((x) => DailyTask.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "daily_tasks": dailyTasks == null ? [] : List<dynamic>.from(dailyTasks!.map((x) => x.toJson())),
  };
}

class DailyTask {
  int? id;
  Item? item;
  int? itemCount;
  String? description;
  int? progress;
  bool? hasClaimed;

  DailyTask({
    this.id,
    this.item,
    this.itemCount,
    this.description,
    this.progress,
    this.hasClaimed,
  });

  factory DailyTask.fromJson(Map<String, dynamic> json) => DailyTask(
    id: json["id"],
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
    itemCount: json["item_count"],
    description: json["description"],
    progress: json["progress"],
    hasClaimed: json["has_claimed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item": item?.toJson(),
    "item_count": itemCount,
    "description": description,
    "progress": progress,
    "has_claimed": hasClaimed,
  };
}

class Item {
  int? id;
  String? name;
  String? description;
  String? icon;

  Item({
    this.id,
    this.name,
    this.description,
    this.icon,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "icon": icon,
  };
}
