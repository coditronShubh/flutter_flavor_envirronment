import 'package:cicd_flavor/bloc/config%20cubit/config_cubit_state.dart';
import 'package:cicd_flavor/config_reader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigCubit extends Cubit<ConfigState> {
  int _counter = 0;

  ConfigCubit() : super(ConfigInitial());

  Future<void> loadConfig() async {
    try {
      await ConfigReader.initialize();

      emit(ConfigLoaded(
        incrementAmount: ConfigReader.getIncrementAmount(),
        secretKey: ConfigReader.getSecretKey(),
        counter: _counter,
      ));
    } catch (e) {
      emit(ConfigError(error: e.toString()));
    }
  }

  void incrementCounter() {
    _counter += ConfigReader.getIncrementAmount();

    emit(ConfigLoaded(
      incrementAmount: ConfigReader.getIncrementAmount(),
      secretKey: ConfigReader.getSecretKey(),
      counter: _counter,
    ));
  }
}
