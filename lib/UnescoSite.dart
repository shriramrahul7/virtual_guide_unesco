class UnescoSite {
  String category;
  String region;
  String site;
  List<double> coordinates;
  String states;
  String location;
  String shortDescription;
  String httpUrl;
  String dateInscribed;

  UnescoSite(
      {this.category,
      this.region,
      this.site,
      this.coordinates,
      this.states,
      this.location,
      this.shortDescription,
      this.httpUrl,
      this.dateInscribed});

  UnescoSite.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    region = json['region'];
    site = json['site'];
    coordinates = json['coordinates'].cast<double>();
    states = json['states'];

    location = json['location'];
    shortDescription = json['short_description'];
    httpUrl = json['http_url'];
    dateInscribed = json['date_inscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['region'] = this.region;
    data['site'] = this.site;
    data['coordinates'] = this.coordinates;
    data['states'] = this.states;

    data['location'] = this.location;
    data['short_description'] = this.shortDescription;
    data['http_url'] = this.httpUrl;
    data['date_inscribed'] = this.dateInscribed;
    return data;
  }
}
