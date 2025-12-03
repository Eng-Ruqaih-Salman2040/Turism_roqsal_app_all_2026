/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screen/section/section_controller.dart';
import '../../apiservice/url.dart';
import '../../widget/colleges_item..dart';
import 'ads_controller.dart';
import 'item.dart';


// ignore: use_key_in_widget_constructors
class adsScreen extends GetWidget<adsController> {
  get alignment => null;

  @override
  Widget build(BuildContext context) {
    return  controller.obx((data)
        => data!.ads!.length > 0 ? Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 2,
                autoPlay: true,
              ),
              items:   data.ads!.map((item) =>
                  Item(item))
                  .toList(),
            )):SizedBox(width: 0,));
      }
        }
*/


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screen/section/section_controller.dart';
import '../../apiservice/url.dart';
import '../../widget/colleges_item..dart';
import 'ads_controller.dart';
import 'item.dart';

class adsScreen extends GetWidget<adsController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((data) => data!.ads!.length > 0
        ? Container(
        height: 180.0, // Fixed height for the carousel
        child: CarouselSlider(
          options: CarouselOptions(
            height: 180.0, // Match container height
            aspectRatio: 16/9, // Standard aspect ratio
            viewportFraction: 0.9, // Don't take full width
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 0, // Simpler initial page
            autoPlay: true,
          ),
          items: data.ads!.map((item) => Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Item(item),
          )).toList(),
        )
    )
        : SizedBox.shrink() // Use shrink instead of width:0
    );
  }
}