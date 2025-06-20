import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:group_app_project/services/location_serivce.dart/location_service.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  late Position currentUserLocation;
  String countryName = '';
  String streetName = '';
  String postalCode = '';
  bool isLocationDetected = false;

  // -- Selecting a location in the map
  GoogleMapController?  googleMapController;
  LatLng? selectedLocation; 

  LocationBloc() : super(LocationInitial()) {
    // on<LocationEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<FetchUserLocation>(fetchUserLocation);

    on<GetReadableUserLocation>(getReadableLocation);
    
  }

  FutureOr<void> fetchUserLocation(FetchUserLocation event, Emitter<LocationState> emit) async{
    try{
      currentUserLocation = await LocationService.determinePosition();
      emit(SuccessDetectLocation());
    }catch(e){
      emit(FailedToGetPermission(message: e.toString()));
    }
  }

  FutureOr<void> getReadableLocation(GetReadableUserLocation event, Emitter<LocationState> emit) async{
    
    if (countryName.trim().isEmpty && streetName.trim().isNotEmpty && postalCode.trim().isNotEmpty){
      return;
    }

    try{
      final List<Placemark> placemark = await placemarkFromCoordinates(currentUserLocation.latitude, currentUserLocation.longitude);
      countryName = placemark[0].country ?? "Unknown";
      streetName = placemark[0].street ?? "Unknown";
      postalCode = placemark[0].postalCode ?? 'Unknown';

      isLocationDetected = true;
      emit(SuccessGetReadableUserLocation());
    }catch(e){
      emit(FailedGetReadableUserLocation(message: e.toString()));
    }
  }
}

