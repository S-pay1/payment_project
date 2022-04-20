import 'package:flutter/cupertino.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class Historyloading extends HistoryState {}

class Historysuccess extends HistoryState {
  // final HistoryModel model;

  // Historysuccess(this.model);
}

class Historyerror extends HistoryState {
  // final String error;
  // Historyerror(this.error);
}

class HistorypaswwordChange extends HistoryState {}

class Getmac extends HistoryState {}
