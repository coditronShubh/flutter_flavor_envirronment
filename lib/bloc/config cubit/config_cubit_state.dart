abstract class ConfigState {}

class ConfigInitial extends ConfigState {}

class ConfigLoaded extends ConfigState {
  final int incrementAmount;
  final String secretKey;
  final int counter;

  ConfigLoaded({
    required this.incrementAmount,
    required this.secretKey,
    required this.counter,
  });
}

class ConfigError extends ConfigState {
  final String error;

  ConfigError({required this.error});
}
