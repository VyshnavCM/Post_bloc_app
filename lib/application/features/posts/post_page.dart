import 'package:api_handling_uisng_bloc/application/core/services/theme_service.dart';
import 'package:api_handling_uisng_bloc/application/features/posts/postbloc/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<PostBloc>(context).add(PostRequestedEvent());
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          Switch(
              activeColor: Colors.green,
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              inactiveThumbColor: Colors.blue[900],
              inactiveTrackColor: Colors.blue[400],
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              })
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('All post', style: themeData.textTheme.displayLarge),
              const SizedBox(height: 20),
              Expanded(child:
                  BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                if (state is PostInitial) {
                  const Text('Your posts are waiting to be loaded');
                } else if (state is PostStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.red[900],
                    ),
                  );
                } else if (state is PostStateLoaded) {
                  return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Center(child: Text('${index + 1}')),
                            ),
                            title: Text(state.posts[index].title),
                            subtitle: Text(state.posts[index].body),
                          ),
                        );
                      });
                } else if (state is PostStateError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const Center(
                  child: Text('Somethig went wrong'),
                );
              }))
            ]),
      ),
    );
  }
}
