// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceDB.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAttendanceDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AttendanceDatabaseBuilder databaseBuilder(String name) =>
      _$AttendanceDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AttendanceDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AttendanceDatabaseBuilder(null);
}

class _$AttendanceDatabaseBuilder {
  _$AttendanceDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AttendanceDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AttendanceDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AttendanceDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AttendanceDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AttendanceDatabase extends AttendanceDatabase {
  _$AttendanceDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AttendanceDao? _attendanceDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Attendance` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `user` TEXT NOT NULL, `name` TEXT NOT NULL, `details` TEXT NOT NULL, `timeAndDate` TEXT NOT NULL, `cutOffTime` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AttendanceDao get attendanceDao {
    return _attendanceDaoInstance ??= _$AttendanceDao(database, changeListener);
  }
}

class _$AttendanceDao extends AttendanceDao {
  _$AttendanceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _attendanceInsertionAdapter = InsertionAdapter(
            database,
            'Attendance',
            (Attendance item) => <String, Object?>{
                  'id': item.id,
                  'user': item.user,
                  'name': item.name,
                  'details': item.details,
                  'timeAndDate': item.timeAndDate,
                  'cutOffTime': item.cutOffTime
                },
            changeListener),
        _attendanceUpdateAdapter = UpdateAdapter(
            database,
            'Attendance',
            ['id'],
            (Attendance item) => <String, Object?>{
                  'id': item.id,
                  'user': item.user,
                  'name': item.name,
                  'details': item.details,
                  'timeAndDate': item.timeAndDate,
                  'cutOffTime': item.cutOffTime
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Attendance> _attendanceInsertionAdapter;

  final UpdateAdapter<Attendance> _attendanceUpdateAdapter;

  @override
  Future<List<Attendance>> getAllAttendance() async {
    return _queryAdapter.queryList('SELECT * FROM Attendance',
        mapper: (Map<String, Object?> row) => Attendance(
            id: row['id'] as int?,
            user: row['user'] as String,
            name: row['name'] as String,
            details: row['details'] as String,
            timeAndDate: row['timeAndDate'] as String,
            cutOffTime: row['cutOffTime'] as String));
  }

  @override
  Stream<Attendance?> findAttendanceById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Attendance WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Attendance(
            id: row['id'] as int?,
            user: row['user'] as String,
            name: row['name'] as String,
            details: row['details'] as String,
            timeAndDate: row['timeAndDate'] as String,
            cutOffTime: row['cutOffTime'] as String),
        arguments: [id],
        queryableName: 'Attendance',
        isView: false);
  }

  @override
  Future<Attendance?> deleteAttendance(int id) async {
    return _queryAdapter.query('DELETE FROM Attendance WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Attendance(
            id: row['id'] as int?,
            user: row['user'] as String,
            name: row['name'] as String,
            details: row['details'] as String,
            timeAndDate: row['timeAndDate'] as String,
            cutOffTime: row['cutOffTime'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertAttendance(Attendance attendance) async {
    await _attendanceInsertionAdapter.insert(
        attendance, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAttendance(Attendance attendance) async {
    await _attendanceUpdateAdapter.update(attendance, OnConflictStrategy.abort);
  }
}
