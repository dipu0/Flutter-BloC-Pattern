part of 'internet_status_bloc.dart';

abstract class InternetStatusEvent {}

class InternetStatusLostEvent extends InternetStatusEvent{}

class InternetStatusGainedEvent extends InternetStatusEvent{}