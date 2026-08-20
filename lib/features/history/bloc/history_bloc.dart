


import 'package:bloc/bloc.dart';
import 'package:quiz_app/core/database/database_helper.dart';
import 'package:quiz_app/features/history/bloc/history_event.dart';
import 'package:quiz_app/features/history/bloc/history_state.dart';

import '../../result/models/result_model.dart';

class HistoryBloc  extends Bloc<HistoryEvent,HistoryState>{


  final DatabaseHelper databaseHelper;

  HistoryBloc(this.databaseHelper): super(HistoryIntial()){
    on<GetHistory>(_getHistory);
  }

  Future<void> _getHistory(GetHistory event, Emitter<HistoryState> emit,
      )
  async {

    emit(HistoryLoading());

    try{
      await databaseHelper.createDatabase();

      final data=await databaseHelper.getResults();

      final results=data.map((result)=> ResultModel.fromMap(result),).toList();

      emit(HistoryLoaded(results));


  }
    catch(e){
      emit(HistoryError(e.toString()),
  );
  }
}
}