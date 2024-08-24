// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatResponseStruct extends BaseStruct {
  ChatResponseStruct({
    String? author,
    String? content,
  })  : _author = author,
        _content = content;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  static ChatResponseStruct fromMap(Map<String, dynamic> data) =>
      ChatResponseStruct(
        author: data['author'] as String?,
        content: data['content'] as String?,
      );

  static ChatResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'author': _author,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatResponseStruct(
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatResponseStruct &&
        author == other.author &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([author, content]);
}

ChatResponseStruct createChatResponseStruct({
  String? author,
  String? content,
}) =>
    ChatResponseStruct(
      author: author,
      content: content,
    );
