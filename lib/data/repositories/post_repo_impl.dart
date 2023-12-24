import 'package:api_handling_uisng_bloc/data/data_sources/post_remote_data_source.dart';
import 'package:api_handling_uisng_bloc/domain/entities/post_entity.dart';
import 'package:api_handling_uisng_bloc/domain/repositories/post_repository.dart';

class PostRepoImpl implements PostRepository {
  PostRemoteDataSource postRemoteDataSource = PsotRemoteDataSourceImpl();

  @override
  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = await postRemoteDataSource.getPostFromApi();
    return posts;
  }
}
