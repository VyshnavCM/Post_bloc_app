import 'package:api_handling_uisng_bloc/application/features/posts/postbloc/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/post_widget.dart';
import 'widgets/refresh_widget.dart';
import 'widgets/switch_widget.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: const PostPage(),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post App using Bloc',
          style: themeData.textTheme.titleMedium,
        ),
        actions: const [
          RefreshWidget(),
          SwitchWidget()
        ],
      ),
      body: PostWidget(themeData: themeData),
    );
  }
}





