import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_app/core/database/database_helper.dart';
import 'package:quiz_app/core/widgets/app_bar.dart';

import 'bloc/history_bloc.dart';
import 'bloc/history_event.dart';
import 'bloc/history_state.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
        DatabaseHelper(),
      )..add(GetHistory()),

      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Quiz History',
        ),

        body: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {

            if (state is HistoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HistoryLoaded) {
              if (state.results.isEmpty) {
                return const Center(
                  child: Text(
                    'No Quiz History',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  final result = state.results[index];

                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.quiz,
                        size: 35,
                      ),
                      title: Text(
                        '${result.category} Quiz',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Score: ${result.score}/${result.totalQuestions}',
                      ),
                    ),
                  );
                },
              );
            }

            if (state is HistoryError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}