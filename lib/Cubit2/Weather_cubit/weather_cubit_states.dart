class weatherInitialState extends weatherStates {}

class weatherLoadingState extends weatherStates {}

class weatherSuccessState extends weatherStates {}

class weatherFailedState extends weatherStates {
  final String errMessage;

  weatherFailedState({required this.errMessage});

}

class weatherStates {}
