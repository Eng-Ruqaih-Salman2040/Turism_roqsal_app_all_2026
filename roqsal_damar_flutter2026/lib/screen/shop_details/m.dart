import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Constants.dart';
import '../../apiservice/url.dart';
import '../../widget/customButton.dart';
import '../../widget/dailog_widget.dart';
import '../../widget/my_colors.dart';
import '../../widget/my_data.dart';
import '../../widget/my_text.dart';
import '../login/login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class m extends StatefulWidget {

  // double.parse(GetStorage().read('Latitude'))
  // double.parse(GetStorage().read('Longitude'));

  @override
  SliderImageHeaderRouteState createState() => new SliderImageHeaderRouteState();
}


class SliderImageHeaderRouteState extends State<m> {



  LatLng initialLocation =  LatLng(double.parse(GetStorage().read('Latitude')),double.parse(GetStorage().read('Longitude')));
  // // Markers to show points on the map
  Map<MarkerId, Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: CommonAppBar.getPrimarySettingAppbar(context, "Product"),
      body:     GoogleMap(

        minMaxZoomPreference:MinMaxZoomPreference(1,300),
        // circles:circles ,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: initialLocation,
          zoom: 17,
        ),
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,

        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        // markers: Set<Marker>.of(markers.values),
        // onMapCreated: (GoogleMapController controller) {
        //   // _controller.complete(controller);
        // },

        markers: {
           Marker(
            markerId: MarkerId('Sydney'),
            position: LatLng(double.parse(GetStorage().read('Latitude')), double.parse(GetStorage().read('Longitude'))),
          )
        },
      ),
    );
  }

}

