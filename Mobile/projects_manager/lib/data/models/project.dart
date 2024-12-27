//
//
//

class Project {
  int? projectId;
  String? title;
  String? about;

  Project({
    this.projectId ,
    this.title,
    this.about
});

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json["project_id"];
    title = json['title'];
    about = json["about"];
  }
}
