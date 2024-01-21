import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chatGPTAppKey = prefs.getString('ff_chatGPTAppKey') ?? _chatGPTAppKey;
    });
    _safeInit(() {
      _chatGPTModel = prefs.getString('ff_chatGPTModel') ?? _chatGPTModel;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _errorDisplayed = '';
  String get errorDisplayed => _errorDisplayed;
  set errorDisplayed(String _value) {
    _errorDisplayed = _value;
  }

  String _chatGPTAppKey = '';
  String get chatGPTAppKey => _chatGPTAppKey;
  set chatGPTAppKey(String _value) {
    _chatGPTAppKey = _value;
    prefs.setString('ff_chatGPTAppKey', _value);
  }

  String _chatGPTModel = 'gpt-3.5-turbo';
  String get chatGPTModel => _chatGPTModel;
  set chatGPTModel(String _value) {
    _chatGPTModel = _value;
    prefs.setString('ff_chatGPTModel', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
