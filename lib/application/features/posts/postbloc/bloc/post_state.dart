part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostStateLoading extends PostState {}

final class PostStateLoaded extends PostState {
  final List<PostEntity> posts;
  const PostStateLoaded({required this.posts});

  @override
  List<Object> get props => [];
}

class PostStateError extends PostState {
  final String message;

  const PostStateError({required this.message});

  @override
  List<Object> get props => [];
}
