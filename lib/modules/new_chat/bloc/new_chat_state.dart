
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/user.dart';

part 'new_chat_state.freezed.dart';

enum NewChatStatus { initial, loading, success, failure }

@freezed
abstract class NewChatState with _$NewChatState {
  const factory NewChatState({
    @Default(NewChatStatus.initial) NewChatStatus status,
    @Default([]) List<User> friendList,
    @Default([]) List<User> filteredFriendList,
    @Default([]) List<User> selectedUsers,
    @Default('') String searchQuery,
    @Default('') String errorMessage}) = _NewChatState;
}

extension NewChatStateExt on NewChatState {
  bool get isSearching => searchQuery.isNotEmpty;
  bool get isSelecting => selectedUsers.isNotEmpty;
  bool isUserSelected(User user) => selectedUsers.contains(user);
}