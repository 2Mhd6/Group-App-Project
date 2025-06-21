import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:group_app_project/extensions/screen_size.dart';
import 'package:group_app_project/shared/blocs/location_bloc/location_bloc.dart';
import 'package:group_app_project/theme/app_color.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.userLocation});

  final Position userLocation;

  @override
  Widget build(BuildContext context) {
    
    final latLngUserCurrentLocation = LatLng(userLocation.latitude, userLocation.longitude);
    final locationBloc = context.read<LocationBloc>();
    
    return PopScope(
      canPop: false,
      child: BlocListener<LocationBloc, LocationState>(
        listener: (context, state) {
          if(state is FailedGetReadableUserLocation){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          body: Container(
            
            child: Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: latLngUserCurrentLocation,
                    zoom: 12,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('current_user_location'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: latLngUserCurrentLocation,
                    ),
                  },
                ),
      
                Positioned(
                  bottom: 60,
                  right: 1,
                  left: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryAppColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                        textStyle: TextStyle(fontSize: 24),
                        fixedSize: Size(context.getWidth(), 60),
                      ),
                      onPressed: () async{
                    
                        locationBloc.add(GetReadableUserLocation());
                        await Future.delayed(Duration(milliseconds: 300));
                        if(context.mounted){
                           Navigator.pop(context);
                        }
                        
                      },
                      child: Text('Select an Address'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
