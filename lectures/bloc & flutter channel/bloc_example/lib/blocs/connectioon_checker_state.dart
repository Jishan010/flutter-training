part of 'connectioon_checker_bloc.dart';

abstract class ConnectioonCheckerState {}

class ConnectioonCheckerInitialState extends ConnectioonCheckerState {}

class ConnectionSuccessState extends ConnectioonCheckerState {}

class ConnectionFailureState extends ConnectioonCheckerState {}
