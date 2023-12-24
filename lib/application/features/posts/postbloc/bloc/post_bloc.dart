import 'package:api_handling_uisng_bloc/domain/entities/post_entity.dart';
import 'package:api_handling_uisng_bloc/domain/usecases/post_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestedEvent>((event, emit) async {
      print('bloc initialized');
      try {
        final posts = await PostUseCases().getPostFromDataSource();
        emit(PostStateLoaded(posts: posts));
      } catch (e) {
        emit(PostStateError(message: e.toString()));
      }
    });
  }
}
