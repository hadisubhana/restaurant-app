import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/list_model.dart';

enum ResultState { loading, noData, hasData, error }

class ListProvider extends ChangeNotifier {
  final ApiService apiService;

  ListProvider({required this.apiService}) {
    _fetchAllList();
  }

  late ListModel _listsResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  ListModel get result => _listsResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final list = await apiService.getLists();
      if (list.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _listsResult = list;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Lost Connection";
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
