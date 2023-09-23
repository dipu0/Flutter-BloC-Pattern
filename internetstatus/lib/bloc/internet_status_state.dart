part of 'internet_status_bloc.dart';

abstract class InternetStatusState {}

final class InternetStatusInitialState extends InternetStatusState {}
final class InternetStatusLosstState extends InternetStatusState {}
final class InternetStatusGainedState extends InternetStatusState {}