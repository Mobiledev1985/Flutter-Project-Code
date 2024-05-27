import 'package:equatable/equatable.dart';
import 'package:flutter_demo_project/api/api_end_point.dart';
import 'package:flutter_demo_project/api/bloc/api_client.dart';
import 'package:flutter_demo_project/api/bloc/api_event.dart';
import 'package:flutter_demo_project/api/bloc/api_state.dart';
// import 'package:flutter_demo_project/api/bloc/api_state.dart';
import 'package:flutter_demo_project/api/bloc/base_state.dart';
import 'package:flutter_demo_project/api/bloc/multi_state_bloc.dart';
import 'package:flutter_demo_project/features/post/models/post.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends MultiStateBloc<PostEvent, BaseState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>(
      (event, emit) async {
        final stream = ApiClient().apiRequest(
          apiEvent: const Get(
            ApiEndPoint.post,
          ),
        );
        await for (final state in stream) {
          emit(state);
          if (state is ApiSuccess) {
            List<PostModel> post = [];
            post =
                (state.data as List).map((e) => PostModel.fromJson(e)).toList();
            emit(ListOfPost(post: post));
          }
        }
      },
    );
  }
}
