class Recipe {
  int id;
  String title;
  String category;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  int openLicense;
  String image;
  String instructions;

  Recipe(
      {this.id,
      this.title,
      this.category,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl,
      this.openLicense,
      this.image,
      this.instructions});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    openLicense = json['openLicense'];
    image = json['image'];
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['sourceUrl'] = this.sourceUrl;
    data['openLicense'] = this.openLicense;
    data['image'] = this.image;
    data['instructions'] = this.instructions;
    return data;
  }
}
