import 'package:geolocator/geolocator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people.g.dart';

@JsonSerializable(explicitToJson: true)
class PeopleLocation {
  PeopleLocation(this.position, this.address);

  @JsonKey(fromJson: Position.fromMap)
  Position position;
  String address;

  factory PeopleLocation.fromJson(Map<String, dynamic> json) => _$PeopleLocationFromJson(json);
  Map<String, dynamic> toJson() => _$PeopleLocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class People {
  People(this.location, this.name, this.description);

  PeopleLocation? location;
  String? name;
  String? description;

  factory People.empty() => People(null, null, null);
  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);
  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}

