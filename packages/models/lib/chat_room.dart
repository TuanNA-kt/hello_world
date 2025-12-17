import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
abstract class ChatRoom with _$ChatRoom {
  factory ChatRoom({
    String? id,
    @JsonKey(name: 'participant_ids')
    required List<String> participantIds,
    @JsonKey(name: 'created_at')
    int? createdAt,
    @JsonKey(name: 'updated_at')
    int? updatedAt,
    @JsonKey(name: 'created_by')
    required String createdBy,
    String? name,
    @JsonKey(name: 'avatar_url')
    String? avatarUrl,
    @JsonKey(name: 'is_group')
    @Default(false) bool isGroup,
    @JsonKey(name: 'last_message')
    Message? lastMessage,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);
}