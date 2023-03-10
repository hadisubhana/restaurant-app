import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_model.dart';

enum ResultState { loading, noData, hasData, error }

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String restaurantId;

  DetailProvider(this.restaurantId, {required this.apiService}) {
    _fetchDetail();
  }

  late DetailModel _detailResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  DetailModel get result => _detailResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetail() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detail = await apiService.getDetailById(restaurantId);
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
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
