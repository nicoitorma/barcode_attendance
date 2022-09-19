import 'package:barcode_attendance/Views/days_of_month.dart';
import 'package:barcode_attendance/Views/months_page.dart';
import 'package:flutter/material.dart';

import '../../Models/DataModels/SchoolYear.dart';
import '../../Resources/colors.dart';

enum Data { months, snapshot }

class CardGridView extends StatefulWidget {
  final List? months;
  final AsyncSnapshot<List<SchoolYear>>? snapshot;

  const CardGridView({super.key, this.months, this.snapshot});

  @override
  State<StatefulWidget> createState() => _CardGridViewState();
}

class _CardGridViewState extends State<CardGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: widget.snapshot?.data?.length ?? widget.months?.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              (widget.months ==
                      null) // this check if it is the months or the snapshot that's initialized
                  ? Navigator.push(
                      // if months is null then the app knows the click is in the home_page
                      context,
                      MaterialPageRoute(
                        builder: (context) => MonthPage(
                            title: widget.snapshot?.data![index].schoolYear ??
                                'null'),
                      ))
                  : Navigator.push(
                      //if months is not null then the click comes the months_page
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DaysPage()));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [GREEN, BLUE]),
                  borderRadius: BorderRadius.circular(18)),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.months?[index] ??
                      widget.snapshot?.data![index].schoolYear,
                  style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          );
        });
  }
}
