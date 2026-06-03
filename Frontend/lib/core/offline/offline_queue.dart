import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

/// Hive-backed offline SOS queue.
///
/// When the device has no internet, SOS requests are serialised and stored here.
/// On connectivity restoration, the queue drains to POST /emergency/bundle.
///
/// Box name is intentionally obfuscated ('_rsos_oq') to avoid easy inspection.
class OfflineQueue {
  static const _boxName = '_rsos_oq';

  late Box<String> _box;

  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  /// Add a pending SOS request to the queue.
  /// [payload] is the full JSON-serialisable request body.
  Future<String> enqueue(Map<String, dynamic> payload) async {
    final id = 'offline_${DateTime.now().millisecondsSinceEpoch}';
    final entry = jsonEncode({
      'id': id,
      'timestamp': DateTime.now().toIso8601String(),
      'payload': payload,
    });
    await _box.put(id, entry);
    return id;
  }

  /// Returns all pending queue entries ordered by enqueue time (oldest first).
  List<QueuedSos> get pending {
    return _box.values
        .map((raw) {
          try {
            final json = jsonDecode(raw) as Map<String, dynamic>;
            return QueuedSos(
              id: json['id'] as String,
              timestamp: DateTime.parse(json['timestamp'] as String),
              payload: json['payload'] as Map<String, dynamic>,
            );
          } catch (_) {
            return null;
          }
        })
        .whereType<QueuedSos>()
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  /// Remove a successfully submitted entry from the queue.
  Future<void> dequeue(String id) async => _box.delete(id);

  /// How many pending items are queued.
  int get length => _box.length;

  bool get isEmpty => _box.isEmpty;
  bool get isNotEmpty => _box.isNotEmpty;
}

class QueuedSos {
  final String id;
  final DateTime timestamp;
  final Map<String, dynamic> payload;

  const QueuedSos({
    required this.id,
    required this.timestamp,
    required this.payload,
  });
}
