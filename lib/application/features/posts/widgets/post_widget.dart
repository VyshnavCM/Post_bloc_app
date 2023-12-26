import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../postbloc/bloc/post_bloc.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
