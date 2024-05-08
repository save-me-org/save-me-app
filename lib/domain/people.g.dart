// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleLocation _$PeopleLocationFromJson(Map<String, dynamic> json) =>
    PeopleLocation(
      Position.fromMap(json['position']),
      json['address'] as String,
    );

Map<String, dynamic> _$PeopleLocationToJson(PeopleLocation instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'address': instance.address,
    };

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      json['location'] == null
          ? null
          : PeopleLocation.fromJson(json['location'] as Map<String, dynamic>),
      json['name'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'location': instance.location?.toJson(),
      'name': instance.name,
      'description': instance.description,
    };
