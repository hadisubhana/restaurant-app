import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/search_model.dart';

enum ResultState { loading, noData, hasData, error }

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider({required this.apiService}) {
    fetchAllList(value);
  }

  late SearchModel _detailResult;
  late ResultState _state;
  String _message = '';
  String _value = '';

  String get message => _message;
  String get value => _value;

  SearchModel get result => _detailResult;

  ResultState get state => _state;

  Future<dynamic> fetchAllList(String value) async {
    try {
      _state = ResultState.loading;
      _value = value;
      notifyListeners();
      final detail = await apiService.search(value);
      if (detail.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailResult = detail;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Lost Connection";
    } on Exception {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Masukan kata untuk mencari data.";
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
