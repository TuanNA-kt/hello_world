import 'package:chat_repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/modules/new_chat/bloc/new_chat_state.dart';
import 'package:logger/logger.dart';
import 'package:models/user.dart';

class NewChatCubit extends Cubit<NewChatState> {
  final ChatRepository _chatRepository;
  var logger = Logger(output: ConsoleOutput());

  NewChatCubit({required ChatRepository chatRepository}) : _chatRepository = chatRepository, super(const NewChatState());

  Future<void> loadFriendList() async {
    emit(state.copyWith(status: NewChatStatus.loading));

    try {
      final friendList = await _chatRepository.getAllUsers();
      logger.i("List friend: $friendList");
      emit(state.copyWith(
        status: NewChatStatus.success,
        friendList: friendList
      ));
    } catch (e) {
      emit(state.copyWith(
        status: NewChatStatus.failure,
        errorMessage: e.toString()
      ));
    }
  }

  void searchUser(String query) {
    final trimmedQuery = query.trim().toLowerCase();

    if(query.isEmpty) {
      emit(state.copyWith(searchQuery: '', filteredFriendList: []));
    }

    final filteredList = state.friendList.where((user) {
      return user.name.toLowerCase().contains(trimmedQuery);
    }).toList();

    emit(state.copyWith(
      searchQuery: query,
      filteredFriendList: filteredList
    ));
  }

  void toggleUserSelection(User user) {
    final isSelected = state.isUserSelected(user);

    if(isSelected) {
      removeSelectedUser(user);
    } else {
      final updated = [...state.selectedUsers, user];
      emit(state.copyWith(selectedUsers: updated));
    }

  }

  void removeSelectedUser(User user) {
    final updatedSelectedList = state.selectedUsers.where((u) {
      return user.id != u.id;
    }).toList();

    emit(state.copyWith(selectedUsers: updatedSelectedList));
  }

  void clearSelectedUser() {
    if(state.selectedUsers.isNotEmpty) emit(state.copyWith(selectedUsers: []));
  }

  Future<void> createChat(String currentUserId) async {
    if(state.selectedUsers.isEmpty) return;

    try {
      emit(state.copyWith(status: NewChatStatus.loading));

      _chatRepository.createChatRoom(currentUserId, state.selectedUsers);
    } catch (e) {

    }
  }
}