part of 'connectioon_checker_bloc.dart';

abstract class ConnectionCheckerEvent {}

class ConnectionObserveEvent extends ConnectionCheckerEvent {}

class ConnectionSuccessEvent extends ConnectionCheckerEvent {}

class ConnectionErrorEvent extends ConnectionCheckerEvent {}
