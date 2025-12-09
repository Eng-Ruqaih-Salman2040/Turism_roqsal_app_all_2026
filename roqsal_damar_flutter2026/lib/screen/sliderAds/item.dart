/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../screen/section/section_model.dart';
import '../../Constants.dart';
import '../../apiservice/url.dart';
import '../../widget/my_text.dart';
import '../shop/shop.dart';
import '../shop/shop_controller.dart';

class  Item extends StatelessWidget {
    var data;

  Item(  this.data );

  void select(BuildContext ctx){


  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(Url_ads+data.imge, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    // color:kColorsWhite,
                    decoration: BoxDecoration(
                      color:kColorsWhite,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          data.note,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              data.dateCreate,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data.timeCreate,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      );
        
  }
}

  

*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';
import '../../apiservice/url.dart';
import '../../widget/my_text.dart';

class Item extends StatelessWidget {
  final dynamic data;

  Item(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              Url_ads + data.imge,
              fit: BoxFit.cover,
              width: 1000.0,
              height: 150.0, // Smaller height
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  height: 150.0,
                  child: Icon(Icons.error, color: Colors.grey),
                );
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.black.withOpacity(0.8), // Solid background
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Single line for note
                    Text(
                      data.note ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.0, // Very small font
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    // Single line for date and time combined
                    Text(
                      '${_formatDate(data.dateCreate)} • ${_formatTime(data.timeCreate)}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 9.0, // Tiny font
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    // Return just the essential part
    return date.length > 10 ? date.substring(0, 10) : date;
  }

  String _formatTime(String? time) {
    if (time == null || time.isEmpty) return '';
    // Remove " pm" or " am" and any extra spaces
    return time.replaceAll(' pm', '').replaceAll(' am', '').trim();
  }
}