// Autogenerated from Pigeon (v1.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class Book {
  String? title;
  String? subtitle;
  String? author;
  String? summary;
  String? publishDate;
  int? pageCount;
  Thumbnail? thumbnail;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['title'] = title;
    pigeonMap['subtitle'] = subtitle;
    pigeonMap['author'] = author;
    pigeonMap['summary'] = summary;
    pigeonMap['publishDate'] = publishDate;
    pigeonMap['pageCount'] = pageCount;
    pigeonMap['thumbnail'] = thumbnail == null ? null : thumbnail!.encode();
    return pigeonMap;
  }

  static Book decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return Book()
      ..title = pigeonMap['title'] as String?
      ..subtitle = pigeonMap['subtitle'] as String?
      ..author = pigeonMap['author'] as String?
      ..summary = pigeonMap['summary'] as String?
      ..publishDate = pigeonMap['publishDate'] as String?
      ..pageCount = pigeonMap['pageCount'] as int?
      ..thumbnail = pigeonMap['thumbnail'] != null
          ? Thumbnail.decode(pigeonMap['thumbnail']!)
          : null;
  }
}

class Thumbnail {
  String? url;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['url'] = url;
    return pigeonMap;
  }

  static Thumbnail decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return Thumbnail()..url = pigeonMap['url'] as String?;
  }
}

class _FlutterBookApiCodec extends StandardMessageCodec {
  const _FlutterBookApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Book) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return Book.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class FlutterBookApi {
  static const MessageCodec<Object?> codec = _FlutterBookApiCodec();

  void displayBookDetails(Book book);
  static void setup(FlutterBookApi? api) {
    {
      const BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.FlutterBookApi.displayBookDetails', codec);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        // ignore: avoid_types_on_closure_parameters
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.FlutterBookApi.displayBookDetails was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final Book? arg_book = args[0] as Book?;
          assert(arg_book != null,
              'Argument for dev.flutter.pigeon.FlutterBookApi.displayBookDetails was null, expected non-null Book.');
          api.displayBookDetails(arg_book!);
          return;
        });
      }
    }
  }
}

class _HostBookApiCodec extends StandardMessageCodec {
  const _HostBookApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Book) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return Book.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class HostBookApi {
  /// Constructor for [HostBookApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  HostBookApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _HostBookApiCodec();

  Future<void> cancel() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.HostBookApi.cancel', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> finishEditingBook(Book arg_book) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.HostBookApi.finishEditingBook', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_book]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}
