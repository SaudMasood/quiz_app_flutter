import 'package:equatable/equatable.dart';

import '../../result/models/result_model.dart';

abstract class HistoryState {

  HistoryState();


}

class HistoryIntial extends HistoryState{}

class HistoryLoading extends HistoryState{}

class HistoryLoaded extends HistoryState {
  final List<ResultModel> results;

   HistoryLoaded(this.results);
}

class HistoryError extends HistoryState{

  final String message;

  HistoryError(this.message);
}

