import 'package:book_exchange_platform/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: book.bookImageUrl ?? '',
                 memCacheHeight: 10,
                fit: BoxFit.cover,
                width: 400,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.network('assets/images/TKAMB_1000_3D.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichTextWidget(
                      bookItemKey: "Title : ", bookItemValue: book.title),
                  const Gap(10),
                  RichTextWidget(
                      bookItemKey: "Author : ", bookItemValue: book.author),
                  const Gap(10),
                  RichTextWidget(
                      bookItemKey: "BookCondition : ",
                      bookItemValue: book.bookCondition),
                  const Gap(10),
                  RichTextWidget(
                      bookItemKey: "Genre : ", bookItemValue: book.genre),
                  const Gap(10),
                  RichTextWidget(
                      bookItemKey: "AvailabilityStatus : ",
                      bookItemValue: book.availabilityStatus.toString()),
                  const Gap(10),
                  RichTextWidget(
                      bookItemKey: "BookType : ", bookItemValue: book.bookType),
                  const Gap(10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    this.bookItemKey,
    this.bookItemValue,
  });

  final String? bookItemValue;
  final String? bookItemKey;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: bookItemKey ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: bookItemValue ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
