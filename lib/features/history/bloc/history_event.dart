import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable{
  HistoryEvent();

  @override
  List<Object> get props=>[];

}

class GetHistory extends HistoryEvent{}