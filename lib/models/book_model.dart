import "package:json_annotation/json_annotation.dart";

part 'book_model.g.dart';

@JsonSerializable()
class GetBookModel {
  @JsonKey(name: "books")
  List<Book>? books;

  GetBookModel({
    this.books,
  });

  factory GetBookModel.fromJson(Map<String, dynamic> json) => _$GetBookModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetBookModelToJson(this);
}

@JsonSerializable()
class Book {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "genre")
  String? genre;
  @JsonKey(name: "bookCondition")
  String? bookCondition;
  @JsonKey(name: "availabilityStatus")
  bool? availabilityStatus;
  @JsonKey(name: "bookType")
  String? bookType;

  Book({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.author,
    this.genre,
    this.bookCondition,
    this.availabilityStatus,
    this.bookType,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}