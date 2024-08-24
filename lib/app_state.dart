import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  set errorDisplayed(String value) {
    _errorDisplayed = value;
  }

  String _chatGPTAppKey = '';
  String get chatGPTAppKey => _chatGPTAppKey;
  set chatGPTAppKey(String value) {
    _chatGPTAppKey = value;
    prefs.setString('ff_chatGPTAppKey', value);
  }

  String _chatGPTModel = 'gpt-3.5-turbo';
  String get chatGPTModel => _chatGPTModel;
  set chatGPTModel(String value) {
    _chatGPTModel = value;
    prefs.setString('ff_chatGPTModel', value);
  }

  List<ChatResponseStruct> _chatHistory = [];
  List<ChatResponseStruct> get chatHistory => _chatHistory;
  set chatHistory(List<ChatResponseStruct> value) {
    _chatHistory = value;
  }

  void addToChatHistory(ChatResponseStruct value) {
    chatHistory.add(value);
  }

  void removeFromChatHistory(ChatResponseStruct value) {
    chatHistory.remove(value);
  }

  void removeAtIndexFromChatHistory(int index) {
    chatHistory.removeAt(index);
  }

  void updateChatHistoryAtIndex(
    int index,
    ChatResponseStruct Function(ChatResponseStruct) updateFn,
  ) {
    chatHistory[index] = updateFn(_chatHistory[index]);
  }

  void insertAtIndexInChatHistory(int index, ChatResponseStruct value) {
    chatHistory.insert(index, value);
  }
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
