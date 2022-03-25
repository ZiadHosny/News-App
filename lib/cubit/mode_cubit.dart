import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/mode_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit() : super(ModeInitial());

  static ModeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  changeTheme({bool? fromShared}) async {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ModeStateChanged());
    } else {
      isDark = !isDark;
      final pref = await SharedPreferences.getInstance();
      await pref.setBool('MODE', isDark);
      emit(ModeStateChanged());
    }
  }
}
