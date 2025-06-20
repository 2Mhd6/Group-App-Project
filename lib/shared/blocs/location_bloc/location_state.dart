part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}


final class FailedToGetPermission extends LocationState {
  final String message; 
  final bool isActive;

  FailedToGetPermission({required this.message, required this.isActive});
}

final class SuccessGetReadableUserLocation extends LocationState{}

final class FailedGetReadableUserLocation extends LocationState {
    final String message; 

    FailedGetReadableUserLocation({required this.message});
}

final class SuccessDetectLocation extends LocationState{}

final class ErrorDetectLocation extends LocationState {}
