part of ethller_api_interface;

class AppErrorHandling {
  static AppError mapError(Exception e){
    if (e is TimeoutException) {
      throw AppError.connectionTimeout();
    }

    if (e is SocketException) {
      throw AppError.noConnection();
    }

    if(e is FormatException){
      throw AppError.badResponse();
    }

    throw AppError.genericError(message: e.toString());

  }
}