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
  List<Book> _availableData = [];
  void loadData() async {
    dynamic apiResponse = await ApiService().getBookDetails();
    setState(() {
      _availableData = apiResponse.books!;
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
          itemBuilder: (context, index, realIndex) =>
              CustomCard(book: _availableData[index])
          // Text('Book ${_availableData[0].author}')
          // Text('1'),
          ),
    );
  }
}
