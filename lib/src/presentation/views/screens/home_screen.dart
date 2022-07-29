import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/helper_imports.dart';
import '../widgets/custom_login_button.dart';
import 'show_api_data_screen.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({this.deepLinkPath = 'Home Screen', Key? key})
      : super(key: key);
  final String? deepLinkPath;

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final LatLng _initialCameraPosition = const LatLng(28.4595, 77.0266);
  final Location _location = Location();
  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _location.onLocationChanged.listen((latLong) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(latLong.latitude!, latLong.longitude!),
              zoom: Dimensions.px15),
        ),
      );
      final marker = Marker(
        markerId: const MarkerId('place_name'),
        position: LatLng(latLong.latitude!, latLong.longitude!),
        // icon: BitmapDescriptor.,
        infoWindow: const InfoWindow(
          title: 'Noida',
          snippet: 'Electronic city ',
        ),
      );

      setState(() {
        markers[const MarkerId('place_name')] = marker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deepLinkPath!),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: _initialCameraPosition, zoom: Dimensions.px12),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(markers.values),
          ),
          //_buildNextScreenBtn(),
        ],
      ),
      bottomNavigationBar: _buildNextScreenBtn(),
    );
  }

  _buildNextScreenBtn() {
    return Padding(
      padding: PaddingConstants.screen,
      child: CustomButtonLogin(
        label: 'Next Screen',
        borderColor: ColorConstants.blue,
        bgColor: ColorConstants.blue,
        lblStyle: AppTextStyles.semiBoldText(fontSize: Dimensions.px16),
        onTap: _onTapSecondScreenBtn,
      ),
    );
  }

  void _onTapSecondScreenBtn() {
    AppRoute.nextPage(context, const ShowApiDataScreen());
  }
}
