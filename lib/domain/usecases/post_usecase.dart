import 'package:api_handling_uisng_bloc/data/repositories/post_repo_impl.dart';
import 'package:api_handling_uisng_bloc/domain/entities/post_entity.dart';
import 'package:api_handling_uisng_bloc/domain/repositories/post_repository.dart';


class PostUseCases {
  PostRepository postRepo = PostRepoImpl();

  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = await postRepo.getPostFromDataSource();
    return posts;
  }
}
