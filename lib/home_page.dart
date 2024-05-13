import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './api_services/get_book_api.dart';
import 'models/book_model.dart';
import 'widgets/contact_details.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_horizontal_card.dart';

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

  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: _availableData.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 220,
                      viewportFraction: 1/4,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 5),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    itemCount: (_availableData.length).round(),
                    itemBuilder: (context, index, realIndex) {
                      return Expanded(
                                  child: CustomHorizontalCard(
                                      book: _availableData[index]));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (_availableData).asMap().entries.map((entry) {
                      return entry.key >= (_availableData.length / 2).round()
                          ? Container()
                          : _buildDotIndicator(entry, context);
                    }).toList(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Bestsellers',style: TextStyle(fontSize: 24,fontStyle: FontStyle.normal,fontWeight: FontWeight.w900),),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: ListView.builder(
                      itemCount: (_availableData.length / 2).round(),
                    itemBuilder: (context, index) {
                      final first = index * 2;
                      int? second = 0;
                      _availableData.length.isOdd
                          ? second =
                              index < ((_availableData.length / 2).round() - 1)
                                  ? first + 1
                                  : 0
                          : second =
                              index < ((_availableData.length / 2).round() - 0)
                                  ? first + 1
                                  : null;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [first, second].map((e) {
                          return (e != null)
                              ? Expanded(
                                  child: CustomCard(
                                      book: _availableData[e]))
                              : Expanded(child: Container());
                        }).toList(),
                      );
                    },
                    ),
                  ),
                  const SizedBox(height: 4),
                   const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Contact',style: TextStyle(fontSize: 24,fontStyle: FontStyle.normal,fontWeight: FontWeight.w900),),
                  ),
                  ContactDetails(),
                ],
              ));
  }

  Widget _buildDotIndicator(MapEntry<int, Book> entry, BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.animateToPage(entry.key),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _current == entry.key ? 15 : 5.0,
        height: 5.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: (Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black)
              .withOpacity(_current == entry.key ? 0.9 : 0.4),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
