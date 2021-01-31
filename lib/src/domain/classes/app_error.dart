part of ethller_api_interface;

//TODO add onError method

class AppError extends Error {
  int code;
  String error;
  String message;
  Function onError;

  AppError({
    this.code,
    this.error,
    this.message,
    this.onError,
  });

  static AppError noConnection() {
    final appError = AppError(
      error: 'No Conectivity',
      message: 'Check your internet connection!',
    );
    return appError;
  }

  static AppError genericError({String message}) {
    final appError = AppError(
      error: 'Something went Wrong',
      message: message,
    );
    return appError;
  }

  static AppError connectionTimeout() {
    final appError = AppError(
      error: 'Connection Timeout',
      message: 'Reach timeout trying to contact server. Check internet connection.',
    );
    return appError;
  }
  
  static AppError maxRateLimitReached() {
    final appError = AppError(
      error: 'Max rate limit reached',
      message: 'Try again in a few minutes.',
    );
    return appError;
  }

  static AppError walletNotFound() {
    final appError = AppError(
      error: 'Wallet not found',
      message: 'we couldn´t find this wallet in Ethermine pool.',
    );
    return appError;
  }

  static AppError badResponse() {
    final appError = AppError(
      error: 'Wrong answer',
      message: 'We had recived a wrong response from server.',
    );
    return appError;
  }
}
