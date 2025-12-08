part of 'chats_bloc.dart';

sealed class ChatsEvent extends Equatable {
  const ChatsEvent();

  @override
  List<Object?> get props => [];
}

final class ChatsSubscriptionRequested extends ChatsEvent {
  const ChatsSubscriptionRequested();
}

final class ChatsSearchQueryChanged extends ChatsEvent {
  final String query;

  const ChatsSearchQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}

final class ChatsSearchCleared extends ChatsEvent {
  const ChatsSearchCleared();
}