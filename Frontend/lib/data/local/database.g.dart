// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $IncidentCachesTable extends IncidentCaches
    with TableInfo<$IncidentCachesTable, IncidentCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncidentCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadJsonMeta =
      const VerificationMeta('payloadJson');
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
      'payload_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, payloadJson, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incident_caches';
  @override
  VerificationContext validateIntegrity(Insertable<IncidentCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
          _payloadJsonMeta,
          payloadJson.isAcceptableOrUnknown(
              data['payload_json']!, _payloadJsonMeta));
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncidentCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncidentCache(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      payloadJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload_json'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $IncidentCachesTable createAlias(String alias) {
    return $IncidentCachesTable(attachedDatabase, alias);
  }
}

class IncidentCache extends DataClass implements Insertable<IncidentCache> {
  final String id;
  final String payloadJson;
  final DateTime cachedAt;
  const IncidentCache(
      {required this.id, required this.payloadJson, required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['payload_json'] = Variable<String>(payloadJson);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  IncidentCachesCompanion toCompanion(bool nullToAbsent) {
    return IncidentCachesCompanion(
      id: Value(id),
      payloadJson: Value(payloadJson),
      cachedAt: Value(cachedAt),
    );
  }

  factory IncidentCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncidentCache(
      id: serializer.fromJson<String>(json['id']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  IncidentCache copyWith(
          {String? id, String? payloadJson, DateTime? cachedAt}) =>
      IncidentCache(
        id: id ?? this.id,
        payloadJson: payloadJson ?? this.payloadJson,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  IncidentCache copyWithCompanion(IncidentCachesCompanion data) {
    return IncidentCache(
      id: data.id.present ? data.id.value : this.id,
      payloadJson:
          data.payloadJson.present ? data.payloadJson.value : this.payloadJson,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncidentCache(')
          ..write('id: $id, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, payloadJson, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncidentCache &&
          other.id == this.id &&
          other.payloadJson == this.payloadJson &&
          other.cachedAt == this.cachedAt);
}

class IncidentCachesCompanion extends UpdateCompanion<IncidentCache> {
  final Value<String> id;
  final Value<String> payloadJson;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const IncidentCachesCompanion({
    this.id = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IncidentCachesCompanion.insert({
    required String id,
    required String payloadJson,
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        payloadJson = Value(payloadJson);
  static Insertable<IncidentCache> custom({
    Expression<String>? id,
    Expression<String>? payloadJson,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IncidentCachesCompanion copyWith(
      {Value<String>? id,
      Value<String>? payloadJson,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return IncidentCachesCompanion(
      id: id ?? this.id,
      payloadJson: payloadJson ?? this.payloadJson,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncidentCachesCompanion(')
          ..write('id: $id, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $IncidentCachesTable incidentCaches = $IncidentCachesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [incidentCaches];
}

typedef $$IncidentCachesTableCreateCompanionBuilder = IncidentCachesCompanion
    Function({
  required String id,
  required String payloadJson,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});
typedef $$IncidentCachesTableUpdateCompanionBuilder = IncidentCachesCompanion
    Function({
  Value<String> id,
  Value<String> payloadJson,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$IncidentCachesTableFilterComposer
    extends Composer<_$AppDatabase, $IncidentCachesTable> {
  $$IncidentCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$IncidentCachesTableOrderingComposer
    extends Composer<_$AppDatabase, $IncidentCachesTable> {
  $$IncidentCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$IncidentCachesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncidentCachesTable> {
  $$IncidentCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$IncidentCachesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncidentCachesTable,
    IncidentCache,
    $$IncidentCachesTableFilterComposer,
    $$IncidentCachesTableOrderingComposer,
    $$IncidentCachesTableAnnotationComposer,
    $$IncidentCachesTableCreateCompanionBuilder,
    $$IncidentCachesTableUpdateCompanionBuilder,
    (
      IncidentCache,
      BaseReferences<_$AppDatabase, $IncidentCachesTable, IncidentCache>
    ),
    IncidentCache,
    PrefetchHooks Function()> {
  $$IncidentCachesTableTableManager(
      _$AppDatabase db, $IncidentCachesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncidentCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncidentCachesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncidentCachesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> payloadJson = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IncidentCachesCompanion(
            id: id,
            payloadJson: payloadJson,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String payloadJson,
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IncidentCachesCompanion.insert(
            id: id,
            payloadJson: payloadJson,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IncidentCachesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IncidentCachesTable,
    IncidentCache,
    $$IncidentCachesTableFilterComposer,
    $$IncidentCachesTableOrderingComposer,
    $$IncidentCachesTableAnnotationComposer,
    $$IncidentCachesTableCreateCompanionBuilder,
    $$IncidentCachesTableUpdateCompanionBuilder,
    (
      IncidentCache,
      BaseReferences<_$AppDatabase, $IncidentCachesTable, IncidentCache>
    ),
    IncidentCache,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$IncidentCachesTableTableManager get incidentCaches =>
      $$IncidentCachesTableTableManager(_db, _db.incidentCaches);
}
