import 'package:api_handling_uisng_bloc/application/features/posts/postbloc/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<PostBloc>(context).add(PostRequestedEvent());
      },
      icon: const Icon(Icons.refresh_rounded),
    );
  }
}