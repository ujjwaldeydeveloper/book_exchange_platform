import 'package:book_exchange_platform/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.height, this.viewport, required this.book});

  final Book book;
  final double? viewport;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: book.bookImageUrl ?? '',
                          memCacheHeight: 10,
                          fit: BoxFit.cover,
                          // width: 400,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.network('assets/images/TKAMB_1000_3D.png'),
                        ),
                      ),
                      Transform.scale(
                        scale: 0.25,
                        child: IgnorePointer(
                          ignoring: true,
                          child: RatingBarIndicator(
                            rating: 5,
                            itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star, color: Colors.purpleAccent
                            );
                          },),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTextWidget(
                            bookItemKey: "Title : ", bookItemValue: book.title),
                        const Gap(4),
                        RichTextWidget(
                            bookItemKey: "Author : ",
                            bookItemValue: book.author),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTextWidget(
                            bookItemKey: "BookCondition : ",
                            bookItemValue: book.bookCondition),
                        RichTextWidget(
                            bookItemKey: "Genre : ", bookItemValue: book.genre),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTextWidget(
                            bookItemKey: "AvailabilityStatus : ",
                            bookItemValue: book.availabilityStatus.toString()),
                        const Gap(4),
                        RichTextWidget(
                            bookItemKey: "BookType : ",
                            bookItemValue: book.bookType),
                      ],
                    ),
                    RichTextWidget(
                        bookItemKey: "Description : ",
                        bookItemValue: book.description),
                  ],
                )
              ],
            ),
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
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: bookItemValue ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
