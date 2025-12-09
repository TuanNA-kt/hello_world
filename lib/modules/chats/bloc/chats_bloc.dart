import 'package:chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/chat_room_display.dart';

import 'chats_state.dart';

part 'chats_event.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatRepository _chatRepository;
  final String _currentUserId;

  ChatsBloc({
    required ChatRepository chatRepository,
    required String currentUserId,
  }) : _chatRepository = chatRepository,
       _currentUserId = currentUserId,
       super(const ChatsState()) {
    on<ChatsSubscriptionRequested>(_onSubscriptionRequested);
    on<ChatsSearchQueryChanged>(_onSearchQueryChanged);
    on<ChatsSearchCleared>(_onSearchCleared);
  }

  Future<void> _onSubscriptionRequested(
    ChatsSubscriptionRequested event,
    Emitter<ChatsState> emit,
  ) async {
    emit(state.copyWith(status: ChatsStatus.loading));

    await emit.forEach<List<ChatRoomDisplay>>(
      _chatRepository.getChatRooms(_currentUserId),
      onData: (chatRooms) {
        final totalUnread = chatRooms.fold(
          0,
          (sum, chat) => sum + chat.unreadCount,
        );

        return state.copyWith(
          status: ChatsStatus.success,
          chatRooms: chatRooms,
          filteredChatRooms: state.searchQuery.isNotEmpty
              ? _filterChats(chatRooms, state.searchQuery)
              : [],
          totalUnreadCount: totalUnread,
        );
      },
    );
  }

  void _onSearchQueryChanged(ChatsSearchQueryChanged event, Emitter<ChatsState> emit) {
    final query = event.query.trim().toLowerCase();

    if(query.isEmpty) {
      emit(state.copyWith(searchQuery: '', isSearching: false, filteredChatRooms: []));
    }
    final filtered = _filterChats(state.chatRooms, query);

    emit(state.copyWith(
      searchQuery: query,
      isSearching: true,
      filteredChatRooms: filtered,
    ));
  }

  void _onSearchCleared(
      ChatsSearchCleared event,
      Emitter<ChatsState> emit,
      ) {
    emit(state.copyWith(
      searchQuery: '',
      isSearching: false,
      filteredChatRooms: [],
      status: ChatsStatus.success,
    ));
  }

  List<ChatRoomDisplay> _filterChats(
    List<ChatRoomDisplay> chats,
    String query,
  ) {
    return chats.where((chat) {
      final nameMatch = chat.name.toLowerCase().contains(query);
      final messageMatch = chat.lastMessageText.toLowerCase().contains(query);
      return nameMatch || messageMatch;
    }).toList();
  }

}
