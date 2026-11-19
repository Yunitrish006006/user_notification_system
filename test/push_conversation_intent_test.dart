import 'package:test/test.dart';
import 'package:user_notification_system/user_notification_system.dart';

void main() {
  test('decodes the existing push aliases and positive Web IDs', () {
    for (final key in [
      'conversationUserId',
      'senderId',
      'conversation_user_id',
      'sender_id',
    ]) {
      expect(PushConversationIntent.fromPayload({key: '42'})?.userId, 42);
    }
    expect(
      PushConversationIntent.fromPayload({
        'conversationUserId': 42,
        'sender_id': 43,
      })?.userId,
      42,
    );
    expect(
      PushConversationIntent.fromUri(
        Uri.parse('https://example.test/?conversationUserId=42'),
      )?.userId,
      42,
    );
  });

  test('ignores unusable or absent IDs', () {
    for (final value in [0, -1, 'abc', double.infinity, null]) {
      expect(PushConversationIntent.fromPayload({'senderId': value}), isNull);
    }
  });
}
