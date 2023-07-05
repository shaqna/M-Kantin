import 'package:flutter/material.dart';
import 'package:mkantin/app/mkantin_app.dart';
import 'package:mkantin/di/injections.dart';

void main() {
  runApp(MKantinApp());
  initBloc();
  initUseCase();
  initDataSource();
  initRepository();
  initDb();
}
