// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

var _client;

Future streamApiResponse(
  List<dynamic> jsonBody,
  Future<dynamic> Function() callbackAction,
) async {
  // Add your function code here!

  _client = http.Client();

  // Prepare request

  final url = 'https://api.openai.com/v1/chat/completions';
  final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${FFAppState().chatGPTAppKey}"
  };

  String body = jsonEncode({
    "model": "${FFAppState().chatGPTModel}",
    "messages": jsonBody,
    "stream": true,
  });

  // Create Request

  var request = http.Request("POST", Uri.parse(url))..headers.addAll(headers);
  request.body = body;

  final http.StreamedResponse response = await _client.send(request);

  // Before steaming response, add anempty ChatResponse object to chatHistory

  FFAppState().addToChatHistory(ChatResponseStruct(
    author: "assistant",
    content: "",
  ));

  // Stream Response

  response.stream.listen((List<int> value) {
    var str = utf8.decode(value);
    String result = str.contains("data:") ? "OK" : "KO";
    //Process the results or add it to UI

    if (str.contains("data:")) {
      List<String> dataList = str.split("data:");
      dataList.forEach((data) {
        addToChatHistory(data, callbackAction);
      });
    }
  });
}

addToChatHistory(String data, callbackAction) {
  if (data.contains("content")) {
    ContentResponse contentResponse =
        ContentResponse.fromJson(jsonDecode(data));
    if (contentResponse.choices != null &&
        contentResponse.choices![0].delta != null &&
        contentResponse.choices![0].delta!.content != null) {
      String content = contentResponse.choices![0].delta!.content!;
      FFAppState().updateChatHistoryAtIndex(FFAppState().chatHistory.length - 1,
          (e) {
        return e..content = "${e.content}$content";
      });
    }
    // set AppState and scroll to last item in list
    callbackAction();
  }
}

getApiBody(dynamic jsonBody) {
  String body = jsonEncode({
    "model": "${FFAppState().chatGPTModel}",
    "messages": jsonBody,
    "stream": true,
  });
}

class ContentResponse {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;

  ContentResponse({this.id, this.object, this.created, this.choices});

  ContentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['model'] = this.model;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  int? index;
  Delta? delta;
  String? finishReason;

  Choices({this.index, this.delta, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    delta = json['delta'] != null ? new Delta.fromJson(json['delta']) : null;
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    if (this.delta != null) {
      data['delta'] = this.delta!.toJson();
    }
    data['finish_reason'] = this.finishReason;
    return data;
  }
}

class Delta {
  String? content;

  Delta({this.content});

  Delta.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}
