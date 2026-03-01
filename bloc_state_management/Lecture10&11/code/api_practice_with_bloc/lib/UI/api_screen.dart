import 'package:api_practice_with_bloc/Bloc/API_Bloc/bloc/api_bloc.dart';
import 'package:api_practice_with_bloc/Utils/api_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class APIPage extends StatefulWidget {
  const APIPage({super.key});

  @override
  State<APIPage> createState() => _APIPageState();
}

class _APIPageState extends State<APIPage> {
  @override
  void initState() {
    super.initState();
    context.read<ApiBloc>().add(FetchApiDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Email',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<ApiBloc>().add(QueryEvent(value));
              },
            ),
          ),
          BlocBuilder<ApiBloc, ApiState>(
            builder: (context, state) {
              if (state.status == APIStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == APIStatus.success) {
                return Expanded(
                  child: state.listError.isNotEmpty
                      ? Center(child: Text(state.listError))
                      : ListView.builder(
                          itemCount: state.filteredList.isEmpty
                              ? state.dataList.length
                              : state.filteredList.length,
                          itemBuilder: (context, index) {
                            final post = state.filteredList.isEmpty
                                ? state.dataList[index]
                                : state.filteredList[index];
                            return ListTile(
                              title: Text(post.id.toString()),
                              subtitle: Text(post.email.toString()),
                            );
                          },
                        ),
                );
              } else if (state.status == APIStatus.failed) {
                return Center(child: Text(state.errorMessage));
              }
              return const Center(child: Text('Unknown state'));
            },
          ),
        ],
      ),
    );
  }
}
