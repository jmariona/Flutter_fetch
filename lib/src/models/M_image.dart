class M_image {
  
  int id;
  String url;
  String title;

  M_image(this.id, this.url, this.title);

  M_image.fromJson(Map<String, dynamic> parsedJson) :
    id = parsedJson['id'],
    url = parsedJson['url'],
    title= parsedJson['title'];
}