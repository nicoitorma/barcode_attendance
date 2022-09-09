// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentDB.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorStudentDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$StudentDatabaseBuilder databaseBuilder(String name) =>
      _$StudentDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$StudentDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$StudentDatabaseBuilder(null);
}

class _$StudentDatabaseBuilder {
  _$StudentDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$StudentDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$StudentDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<StudentDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$StudentDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$StudentDatabase extends StudentDatabase {
  _$StudentDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Student` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `idNumber` INTEGER, `department` TEXT NOT NULL, `studentYear` INTEGER, `studentBlock` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'Student',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'idNumber': item.idNumber,
                  'department': item.department,
                  'studentYear': item.studentYear,
                  'studentBlock': item.studentBlock
                },
            changeListener),
        _studentUpdateAdapter = UpdateAdapter(
            database,
            'Student',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'idNumber': item.idNumber,
                  'department': item.department,
                  'studentYear': item.studentYear,
                  'studentBlock': item.studentBlock
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  final UpdateAdapter<Student> _studentUpdateAdapter;

  @override
  Future<List<Student>> selectAllStudent() async {
    return _queryAdapter.queryList('SELECT * FROM Student',
        mapper: (Map<String, Object?> row) => Student(row['id'] as int,
            name: row['name'] as String,
            idNumber: row['idNumber'] as int?,
            department: row['department'] as String,
            studentYear: row['studentYear'] as int?,
            studentBlock: row['studentBlock'] as String?));
  }

  @override
  Stream<Student?> findStudentById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM Student WHERE idNumber = ?1',
        mapper: (Map<String, Object?> row) => Student(row['id'] as int,
            name: row['name'] as String,
            idNumber: row['idNumber'] as int?,
            department: row['department'] as String,
            studentYear: row['studentYear'] as int?,
            studentBlock: row['studentBlock'] as String?),
        arguments: [id],
        queryableName: 'Student',
        isView: false);
  }

  @override
  Future<Student?> deleteStudent(int id) async {
    return _queryAdapter.query('DELETE FROM Student WHERE idNumber = ?1',
        mapper: (Map<String, Object?> row) => Student(row['id'] as int,
            name: row['name'] as String,
            idNumber: row['idNumber'] as int?,
            department: row['department'] as String,
            studentYear: row['studentYear'] as int?,
            studentBlock: row['studentBlock'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertStudent(Student student) async {
    await _studentInsertionAdapter.insert(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStudent(Student student) async {
    await _studentUpdateAdapter.update(student, OnConflictStrategy.abort);
  }
}
