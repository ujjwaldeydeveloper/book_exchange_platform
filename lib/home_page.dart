import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './api_services/get_book_api.dart';
import 'models/book_model.dart';
import 'widgets/custom_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Book> _availableData = [
    Book(
        id: 1,
        userId: 123,
        title: "To Kill a Mockingbird",
        description:
            "Harper Lee's classic novel about racial injustice in the American South.",
        author: "Harper Lee",
        genre: "Literary Fiction",
        bookCondition: "Like New",
        availabilityStatus: true,
        bookType: "Sale"),
    Book(
        id: 2,
        userId: 456,
        title: "1984",
        description:
            "George Orwell's dystopian masterpiece depicting a totalitarian regime.",
        author: "George Orwell",
        genre: "Science Fiction",
        bookCondition: "Good",
        availabilityStatus: true,
        bookType: "Exchange"),
    Book(
        id: 3,
        userId: 789,
        title: "The Great Gatsby",
        description:
            "F. Scott Fitzgerald's iconic novel set in the Roaring Twenties.",
        author: "F. Scott Fitzgerald",
        genre: "Literary Fiction",
        bookCondition: "Acceptable",
        availabilityStatus: false,
        bookType: "Loan"),
    Book(
        id: 4,
        userId: 123,
        title: "Harry Potter and the Philosopher's Stone",
        description: "The first book in J.K. Rowling's beloved fantasy series.",
        author: "J.K. Rowling",
        genre: "Fantasy",
        bookCondition: "Very Good",
        availabilityStatus: true,
        bookType: "Sale"),
    Book(
        id: 5,
        userId: 456,
        title: "The Catcher in the Rye",
        description: "J.D. Salinger's classic coming-of-age novel.",
        author: "J.D. Salinger",
        genre: "Literary Fiction",
        bookCondition: "Fair",
        availabilityStatus: true,
        bookType: "Exchange")
  ];
  void loadData() async {
    dynamic apiResponse = await ApiService().getBookDetails();
    setState(() {
      // _availableData = apiResponse.data!;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 5),
        ),
        itemCount: _availableData.length,
        // 5,
        itemBuilder: (context, index, realIndex) => const CustomCard()
        // Text('Book ${_availableData[index].author}')
        // Text('1'),
      ),
    );
  }
}
