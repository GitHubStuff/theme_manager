import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitInitial());
}
