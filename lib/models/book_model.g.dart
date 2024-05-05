// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookModel _$GetBookModelFromJson(Map<String, dynamic> json) => GetBookModel(
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBookModelToJson(GetBookModel instance) =>
    <String, dynamic>{
      'books': instance.books,
    };

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      author: json['author'] as String?,
      genre: json['genre'] as String?,
      bookCondition: json['bookCondition'] as String?,
      availabilityStatus: json['availabilityStatus'] as bool?,
      bookType: json['bookType'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'genre': instance.genre,
      'bookCondition': instance.bookCondition,
      'availabilityStatus': instance.availabilityStatus,
      'bookType': instance.bookType,
    };
