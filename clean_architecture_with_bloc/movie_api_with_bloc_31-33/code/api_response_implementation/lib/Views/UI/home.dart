import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:splash_screen_practice/Bloc/Movie_Bloc/movie_bloc.dart';
import 'package:splash_screen_practice/Bloc/Movie_Bloc/movie_events.dart';
import 'package:splash_screen_practice/Bloc/Movie_Bloc/movie_states.dart';
import 'package:splash_screen_practice/Configs/Routes/route_names.dart';
import 'package:splash_screen_practice/Data/Response/api_response.dart';
import 'package:splash_screen_practice/Services/Storage/app_local_storage.dart';
import 'package:splash_screen_practice/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late MovieBloc _movieBloc;
  @override
  void initState() {
    super.initState();
    _movieBloc = MovieBloc(movieRepo: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              AppLocalStorage localStorage = AppLocalStorage();
              localStorage.deleteValue("token").then((value) {
                localStorage.deleteValue("isLogin").then((value) {
                  Navigator.pushNamed(context, RouteNames.loginScreen);
                });
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => _movieBloc..add(MoviesFetchEvent()),
        child: BlocBuilder<MovieBloc, MovieStates>(
          builder: (BuildContext context, state) {
            switch (state.moviesList.apiStatus) {
              case ApiResponse.loading:
                return const Center(child: CircularProgressIndicator());
              case ApiResponse.failed:
                return Text(
                  state.moviesList.errorMessage.toString(),
                ); // Widget for displaying error state
              case ApiResponse.completed:
                if (state.moviesList.data == null) {
                  // Widget for displaying no data found message
                  return Text("No data Found");
                }
                final movieList = state.moviesList.data!;

                return Expanded(
                  child: ListView.builder(
                    itemCount: movieList.tvShow.length,
                    itemBuilder: (context, index) {
                      final tvShow = movieList.tvShow[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            tvShow.imageThumbnailPath.toString(),
                          ), // Widget for displaying network image
                          title: Text(
                            tvShow.name.toString(),
                          ), // Title of the movie
                          subtitle: Text(
                            tvShow.network.toString(),
                          ), // Network of the movie
                          trailing: Text(
                            tvShow.status.toString(),
                          ), // Status of the movie
                        ),
                      );
                    },
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
