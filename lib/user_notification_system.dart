/// The conversation identified by an app notification or Web link.
class PushConversationIntent {
  const PushConversationIntent._(this.userId);

  final int userId;

  static PushConversationIntent? fromPayload(Map<String, Object?> payload) =>
      _fromValue(
        payload['conversationUserId'] ??
            payload['senderId'] ??
            payload['conversation_user_id'] ??
            payload['sender_id'],
      );

  static PushConversationIntent? fromUri(Uri uri) =>
      _fromValue(uri.queryParameters['conversationUserId']);

  static PushConversationIntent? _fromValue(Object? raw) {
    final value = switch (raw) {
      num value when value.isFinite => value.toInt(),
      String value => int.tryParse(value),
      _ => null,
    };
    return value == null || value <= 0 ? null : PushConversationIntent._(value);
  }
}
