part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

final class FetchUserLocation extends LocationEvent{}

final class GetReadableUserLocation extends LocationEvent{}
