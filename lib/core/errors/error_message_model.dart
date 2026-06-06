import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final bool isReceived;
  final String message;

  const ErrorMessageModel(
      {required this.isReceived,
        required this.message});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          isReceived: json["success"],
          message: json["message"]);

  @override
  // TODO: implement props
  List<Object?> get props => [isReceived, message];
}
