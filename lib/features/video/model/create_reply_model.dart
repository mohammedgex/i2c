class CreateReplyRequestModel {
  final String reply;

  CreateReplyRequestModel({
    required this.reply,
  });

  Map<String, dynamic> toJson() {
    return {
      'reply': reply,
      
    };
  }
}
