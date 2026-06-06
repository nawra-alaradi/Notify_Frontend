import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});
}

class EmptyCacheException implements Exception {
  final String message;
  const EmptyCacheException({required this.message});
}

class LocalDataBaseException implements Exception {
  final String message;
  const LocalDataBaseException({required this.message});
}

class OfflineException implements Exception {
  final String message;
  const OfflineException({required this.message});
}
