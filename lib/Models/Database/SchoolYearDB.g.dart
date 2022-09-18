// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolYearDB.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorSchoolYearDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SchoolYearDatabaseBuilder databaseBuilder(String name) =>
      _$SchoolYearDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SchoolYearDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$SchoolYearDatabaseBuilder(null);
}

class _$SchoolYearDatabaseBuilder {
  _$SchoolYearDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$SchoolYearDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SchoolYearDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SchoolYearDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SchoolYearDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SchoolYearDatabase extends SchoolYearDatabase {
  _$SchoolYearDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SchoolYearDao? _schoolYearDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SchoolYear` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `schoolYear` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SchoolYearDao get schoolYearDao {
    return _schoolYearDaoInstance ??= _$SchoolYearDao(database, changeListener);
  }
}

class _$SchoolYearDao extends SchoolYearDao {
  _$SchoolYearDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _schoolYearInsertionAdapter = InsertionAdapter(
            database,
            'SchoolYear',
            (SchoolYear item) =>
                <String, Object?>{'id': item.id, 'schoolYear': item.schoolYear},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SchoolYear> _schoolYearInsertionAdapter;

  @override
  Future<List<SchoolYear>> getAllSchoolYear() async {
    return _queryAdapter.queryList('SELECT * FROM SchoolYear',
        mapper: (Map<String, Object?> row) => SchoolYear(
            id: row['id'] as int?, schoolYear: row['schoolYear'] as String));
  }

  @override
  Stream<SchoolYear?> findSchoolYearById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM SchoolYear WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SchoolYear(
            id: row['id'] as int?, schoolYear: row['schoolYear'] as String),
        arguments: [id],
        queryableName: 'SchoolYear',
        isView: false);
  }

  @override
  Future<SchoolYear?> deleteSchoolYear(int id) async {
    return _queryAdapter.query('DELETE FROM SchoolYear WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SchoolYear(
            id: row['id'] as int?, schoolYear: row['schoolYear'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertSchoolYear(SchoolYear attendance) async {
    await _schoolYearInsertionAdapter.insert(
        attendance, OnConflictStrategy.abort);
  }
}
