import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_gift/views/widget/custom_app_bar.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:project_gift/views/widget/custom_map_drawer.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:xtyle/xtyle.dart';

// marker image

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  CameraPosition? cameraPosition;
  LatLng? startLocation;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Future<Uint8List> getBytesFromAsset(
      {required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  late final Uint8List customMarker;

  Future<void> getMarker() async {
    customMarker = await getBytesFromAsset(
        path: 'assets/images/heart_marker.png', //paste the custom image path
        width: 100.w.toInt() // size of custom image as marker
        );
  }

  void addMarker(String placeName, double lat, double lon) {
    final marker = Marker(
      onTap: () {
        Get.bottomSheet(
          Container(
            width: Get.width,
            height: 250.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                XtyleText(
                  'winter camping',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
                XtyleText(
                  '2022/11/22',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        SizedBox(
                      width: Get.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/place1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 16 / 9,
                      initialPage: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
      markerId: MarkerId(placeName),
      position: LatLng(lat, lon),
      icon: BitmapDescriptor.fromBytes(customMarker),
    );

    setState(() {
      markers[MarkerId(placeName)] = marker;
    });
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  setStartLocation() async {
    final value = await getUserCurrentLocation();
    startLocation = LatLng(value.latitude, value.longitude);
    setState(() {});
  }

  @override
  void initState() {
    getMarker();
    setStartLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomMapDrawer(),
      endDrawer: const CustomDrawer(
        drawerType: '',
      ),
      appBar: buildCustomAppBar('map', type: 'map'),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: startLocation == null
            ? const Center(
                child: CircularProgressIndicator(
                color: Color(0xffcccccc),
                backgroundColor: Colors.white,
              ))
            : Stack(
                children: [
                  GoogleMap(
                    zoomGesturesEnabled: true,
                    initialCameraPosition:
                        CameraPosition(target: startLocation!, zoom: 14),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    markers: markers.values.toSet(),
                    onCameraMove: (CameraPosition position) {
                      setState(() {
                        cameraPosition = position;
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 35.w,
                      height: 35.w,
                      child: Image.asset(
                        'assets/images/heart.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Builder(builder: (context) {
            return FloatingActionButton(
              heroTag: 'list',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              backgroundColor: Colors.white,
              child: SizedBox(
                width: 25.w,
                height: 25.w,
                child: const Icon(
                  Icons.list_rounded,
                  color: Color(
                    0xff333333,
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 5.h),
          FloatingActionButton(
            heroTag: 'marker',
            onPressed: () {
              setState(() {
                addMarker('5', cameraPosition!.target.latitude,
                    cameraPosition!.target.longitude);
              });
            },
            backgroundColor: Colors.white,
            child: SizedBox(
              width: 20.w,
              height: 20.w,
              child: Image.asset(
                'assets/images/heart_marker.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          FloatingActionButton(
            heroTag: 'current',
            onPressed: () async {
              getUserCurrentLocation().then((value) async {
                CameraPosition cameraPosition = CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                  zoom: 14,
                );
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.gps_fixed_outlined,
              color: Color(0xff333333),
            ),
          ),
        ],
      ),
    );
  }
}
