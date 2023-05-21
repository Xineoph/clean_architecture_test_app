import 'package:ca_test_project/injections.dart';
import 'package:ca_test_project/presentation/cubits/get_joke_cubit.dart';
import 'package:ca_test_project/presentation/cubits/get_jokes_state.dart';
import 'package:ca_test_project/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<GetJokesCubit>(),
      child: Scaffold(
        body: BlocBuilder<GetJokesCubit, GetJokesState>(
            builder: (context, state) {
          if (state.isLoading!) {
            return const LoadingWidget();
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.joke!.setup,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  _buildSpacer(),
                  Text(
                    state.joke!.punchline,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  _buildSpacer(),
                  ElevatedButton(
                    onPressed: () {
                      context.read<GetJokesCubit>().getJoke();
                    },
                    child: Container(
                      color: Colors.blue,
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        'Get a new joke',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSpacer() {
    return const SizedBox(
      height: 20,
    );
  }
}
