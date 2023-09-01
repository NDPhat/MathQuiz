// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app.dart';

// ignore_for_file: type=lint
class $PreQuizGameEntityTable extends PreQuizGameEntity
    with TableInfo<$PreQuizGameEntityTable, PreQuizGameEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreQuizGameEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _signMeta = const VerificationMeta('sign');
  @override
  late final GeneratedColumn<String> sign = GeneratedColumn<String>(
      'sign', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionMeta = const VerificationMeta('option');
  @override
  late final GeneratedColumn<String> option = GeneratedColumn<String>(
      'option_game_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateSaveMeta =
      const VerificationMeta('dateSave');
  @override
  late final GeneratedColumn<String> dateSave = GeneratedColumn<String>(
      'dateSave', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numQMeta = const VerificationMeta('numQ');
  @override
  late final GeneratedColumn<int> numQ = GeneratedColumn<int>(
      'numQ', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sign, option, dateSave, numQ, score];
  @override
  String get aliasedName => _alias ?? 'pre_quiz_game_entity';
  @override
  String get actualTableName => 'pre_quiz_game_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<PreQuizGameEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sign')) {
      context.handle(
          _signMeta, sign.isAcceptableOrUnknown(data['sign']!, _signMeta));
    } else if (isInserting) {
      context.missing(_signMeta);
    }
    if (data.containsKey('option_game_mode')) {
      context.handle(_optionMeta,
          option.isAcceptableOrUnknown(data['option_game_mode']!, _optionMeta));
    } else if (isInserting) {
      context.missing(_optionMeta);
    }
    if (data.containsKey('dateSave')) {
      context.handle(_dateSaveMeta,
          dateSave.isAcceptableOrUnknown(data['dateSave']!, _dateSaveMeta));
    } else if (isInserting) {
      context.missing(_dateSaveMeta);
    }
    if (data.containsKey('numQ')) {
      context.handle(
          _numQMeta, numQ.isAcceptableOrUnknown(data['numQ']!, _numQMeta));
    } else if (isInserting) {
      context.missing(_numQMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PreQuizGameEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreQuizGameEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign'])!,
      option: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}option_game_mode'])!,
      dateSave: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateSave'])!,
      numQ: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}numQ'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score']),
    );
  }

  @override
  $PreQuizGameEntityTable createAlias(String alias) {
    return $PreQuizGameEntityTable(attachedDatabase, alias);
  }
}

class PreQuizGameEntityData extends DataClass
    implements Insertable<PreQuizGameEntityData> {
  final int id;
  final String sign;
  final String option;
  final String dateSave;
  final int numQ;
  final int? score;
  const PreQuizGameEntityData(
      {required this.id,
      required this.sign,
      required this.option,
      required this.dateSave,
      required this.numQ,
      this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sign'] = Variable<String>(sign);
    map['option_game_mode'] = Variable<String>(option);
    map['dateSave'] = Variable<String>(dateSave);
    map['numQ'] = Variable<int>(numQ);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    return map;
  }

  PreQuizGameEntityCompanion toCompanion(bool nullToAbsent) {
    return PreQuizGameEntityCompanion(
      id: Value(id),
      sign: Value(sign),
      option: Value(option),
      dateSave: Value(dateSave),
      numQ: Value(numQ),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
    );
  }

  factory PreQuizGameEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreQuizGameEntityData(
      id: serializer.fromJson<int>(json['id']),
      sign: serializer.fromJson<String>(json['sign']),
      option: serializer.fromJson<String>(json['option']),
      dateSave: serializer.fromJson<String>(json['dateSave']),
      numQ: serializer.fromJson<int>(json['numQ']),
      score: serializer.fromJson<int?>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sign': serializer.toJson<String>(sign),
      'option': serializer.toJson<String>(option),
      'dateSave': serializer.toJson<String>(dateSave),
      'numQ': serializer.toJson<int>(numQ),
      'score': serializer.toJson<int?>(score),
    };
  }

  PreQuizGameEntityData copyWith(
          {int? id,
          String? sign,
          String? option,
          String? dateSave,
          int? numQ,
          Value<int?> score = const Value.absent()}) =>
      PreQuizGameEntityData(
        id: id ?? this.id,
        sign: sign ?? this.sign,
        option: option ?? this.option,
        dateSave: dateSave ?? this.dateSave,
        numQ: numQ ?? this.numQ,
        score: score.present ? score.value : this.score,
      );
  @override
  String toString() {
    return (StringBuffer('PreQuizGameEntityData(')
          ..write('id: $id, ')
          ..write('sign: $sign, ')
          ..write('option: $option, ')
          ..write('dateSave: $dateSave, ')
          ..write('numQ: $numQ, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sign, option, dateSave, numQ, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreQuizGameEntityData &&
          other.id == this.id &&
          other.sign == this.sign &&
          other.option == this.option &&
          other.dateSave == this.dateSave &&
          other.numQ == this.numQ &&
          other.score == this.score);
}

class PreQuizGameEntityCompanion
    extends UpdateCompanion<PreQuizGameEntityData> {
  final Value<int> id;
  final Value<String> sign;
  final Value<String> option;
  final Value<String> dateSave;
  final Value<int> numQ;
  final Value<int?> score;
  const PreQuizGameEntityCompanion({
    this.id = const Value.absent(),
    this.sign = const Value.absent(),
    this.option = const Value.absent(),
    this.dateSave = const Value.absent(),
    this.numQ = const Value.absent(),
    this.score = const Value.absent(),
  });
  PreQuizGameEntityCompanion.insert({
    this.id = const Value.absent(),
    required String sign,
    required String option,
    required String dateSave,
    required int numQ,
    this.score = const Value.absent(),
  })  : sign = Value(sign),
        option = Value(option),
        dateSave = Value(dateSave),
        numQ = Value(numQ);
  static Insertable<PreQuizGameEntityData> custom({
    Expression<int>? id,
    Expression<String>? sign,
    Expression<String>? option,
    Expression<String>? dateSave,
    Expression<int>? numQ,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sign != null) 'sign': sign,
      if (option != null) 'option_game_mode': option,
      if (dateSave != null) 'dateSave': dateSave,
      if (numQ != null) 'numQ': numQ,
      if (score != null) 'score': score,
    });
  }

  PreQuizGameEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? sign,
      Value<String>? option,
      Value<String>? dateSave,
      Value<int>? numQ,
      Value<int?>? score}) {
    return PreQuizGameEntityCompanion(
      id: id ?? this.id,
      sign: sign ?? this.sign,
      option: option ?? this.option,
      dateSave: dateSave ?? this.dateSave,
      numQ: numQ ?? this.numQ,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sign.present) {
      map['sign'] = Variable<String>(sign.value);
    }
    if (option.present) {
      map['option_game_mode'] = Variable<String>(option.value);
    }
    if (dateSave.present) {
      map['dateSave'] = Variable<String>(dateSave.value);
    }
    if (numQ.present) {
      map['numQ'] = Variable<int>(numQ.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreQuizGameEntityCompanion(')
          ..write('id: $id, ')
          ..write('sign: $sign, ')
          ..write('option: $option, ')
          ..write('dateSave: $dateSave, ')
          ..write('numQ: $numQ, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

class $PreTestEntityTable extends PreTestEntity
    with TableInfo<$PreTestEntityTable, PreTestEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreTestEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateSaveMeta =
      const VerificationMeta('dateSave');
  @override
  late final GeneratedColumn<String> dateSave = GeneratedColumn<String>(
      'dateSave', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sumQuizMeta =
      const VerificationMeta('sumQuiz');
  @override
  late final GeneratedColumn<int> sumQuiz = GeneratedColumn<int>(
      'sumQuiz', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, dateSave, sumQuiz, score];
  @override
  String get aliasedName => _alias ?? 'pre_test_entity';
  @override
  String get actualTableName => 'pre_test_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PreTestEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('dateSave')) {
      context.handle(_dateSaveMeta,
          dateSave.isAcceptableOrUnknown(data['dateSave']!, _dateSaveMeta));
    } else if (isInserting) {
      context.missing(_dateSaveMeta);
    }
    if (data.containsKey('sumQuiz')) {
      context.handle(_sumQuizMeta,
          sumQuiz.isAcceptableOrUnknown(data['sumQuiz']!, _sumQuizMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PreTestEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreTestEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateSave: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateSave'])!,
      sumQuiz: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sumQuiz']),
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score']),
    );
  }

  @override
  $PreTestEntityTable createAlias(String alias) {
    return $PreTestEntityTable(attachedDatabase, alias);
  }
}

class PreTestEntityData extends DataClass
    implements Insertable<PreTestEntityData> {
  final int id;
  final String dateSave;
  final int? sumQuiz;
  final int? score;
  const PreTestEntityData(
      {required this.id, required this.dateSave, this.sumQuiz, this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['dateSave'] = Variable<String>(dateSave);
    if (!nullToAbsent || sumQuiz != null) {
      map['sumQuiz'] = Variable<int>(sumQuiz);
    }
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    return map;
  }

  PreTestEntityCompanion toCompanion(bool nullToAbsent) {
    return PreTestEntityCompanion(
      id: Value(id),
      dateSave: Value(dateSave),
      sumQuiz: sumQuiz == null && nullToAbsent
          ? const Value.absent()
          : Value(sumQuiz),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
    );
  }

  factory PreTestEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreTestEntityData(
      id: serializer.fromJson<int>(json['id']),
      dateSave: serializer.fromJson<String>(json['dateSave']),
      sumQuiz: serializer.fromJson<int?>(json['sumQuiz']),
      score: serializer.fromJson<int?>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateSave': serializer.toJson<String>(dateSave),
      'sumQuiz': serializer.toJson<int?>(sumQuiz),
      'score': serializer.toJson<int?>(score),
    };
  }

  PreTestEntityData copyWith(
          {int? id,
          String? dateSave,
          Value<int?> sumQuiz = const Value.absent(),
          Value<int?> score = const Value.absent()}) =>
      PreTestEntityData(
        id: id ?? this.id,
        dateSave: dateSave ?? this.dateSave,
        sumQuiz: sumQuiz.present ? sumQuiz.value : this.sumQuiz,
        score: score.present ? score.value : this.score,
      );
  @override
  String toString() {
    return (StringBuffer('PreTestEntityData(')
          ..write('id: $id, ')
          ..write('dateSave: $dateSave, ')
          ..write('sumQuiz: $sumQuiz, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateSave, sumQuiz, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreTestEntityData &&
          other.id == this.id &&
          other.dateSave == this.dateSave &&
          other.sumQuiz == this.sumQuiz &&
          other.score == this.score);
}

class PreTestEntityCompanion extends UpdateCompanion<PreTestEntityData> {
  final Value<int> id;
  final Value<String> dateSave;
  final Value<int?> sumQuiz;
  final Value<int?> score;
  const PreTestEntityCompanion({
    this.id = const Value.absent(),
    this.dateSave = const Value.absent(),
    this.sumQuiz = const Value.absent(),
    this.score = const Value.absent(),
  });
  PreTestEntityCompanion.insert({
    this.id = const Value.absent(),
    required String dateSave,
    this.sumQuiz = const Value.absent(),
    this.score = const Value.absent(),
  }) : dateSave = Value(dateSave);
  static Insertable<PreTestEntityData> custom({
    Expression<int>? id,
    Expression<String>? dateSave,
    Expression<int>? sumQuiz,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateSave != null) 'dateSave': dateSave,
      if (sumQuiz != null) 'sumQuiz': sumQuiz,
      if (score != null) 'score': score,
    });
  }

  PreTestEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? dateSave,
      Value<int?>? sumQuiz,
      Value<int?>? score}) {
    return PreTestEntityCompanion(
      id: id ?? this.id,
      dateSave: dateSave ?? this.dateSave,
      sumQuiz: sumQuiz ?? this.sumQuiz,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateSave.present) {
      map['dateSave'] = Variable<String>(dateSave.value);
    }
    if (sumQuiz.present) {
      map['sumQuiz'] = Variable<int>(sumQuiz.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreTestEntityCompanion(')
          ..write('id: $id, ')
          ..write('dateSave: $dateSave, ')
          ..write('sumQuiz: $sumQuiz, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

class $QuizGameEntityTable extends QuizGameEntity
    with TableInfo<$QuizGameEntityTable, QuizGameEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizGameEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _preIdMeta = const VerificationMeta('preId');
  @override
  late final GeneratedColumn<int> preId = GeneratedColumn<int>(
      'preId', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _num1Meta = const VerificationMeta('num1');
  @override
  late final GeneratedColumn<String> num1 = GeneratedColumn<String>(
      'num1', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quizMeta = const VerificationMeta('quiz');
  @override
  late final GeneratedColumn<String> quiz = GeneratedColumn<String>(
      'quiz', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _infoQuizMeta =
      const VerificationMeta('infoQuiz');
  @override
  late final GeneratedColumn<bool> infoQuiz =
      GeneratedColumn<bool>('infoQuiz', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("infoQuiz" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _signMeta = const VerificationMeta('sign');
  @override
  late final GeneratedColumn<String> sign = GeneratedColumn<String>(
      'sign', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _num2Meta = const VerificationMeta('num2');
  @override
  late final GeneratedColumn<String> num2 = GeneratedColumn<String>(
      'num2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerSelectMeta =
      const VerificationMeta('answerSelect');
  @override
  late final GeneratedColumn<String> answerSelect = GeneratedColumn<String>(
      'answerSelect', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, preId, num1, quiz, infoQuiz, sign, num2, answer, answerSelect];
  @override
  String get aliasedName => _alias ?? 'quiz_game_entity';
  @override
  String get actualTableName => 'quiz_game_entity';
  @override
  VerificationContext validateIntegrity(Insertable<QuizGameEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('preId')) {
      context.handle(
          _preIdMeta, preId.isAcceptableOrUnknown(data['preId']!, _preIdMeta));
    } else if (isInserting) {
      context.missing(_preIdMeta);
    }
    if (data.containsKey('num1')) {
      context.handle(
          _num1Meta, num1.isAcceptableOrUnknown(data['num1']!, _num1Meta));
    }
    if (data.containsKey('quiz')) {
      context.handle(
          _quizMeta, quiz.isAcceptableOrUnknown(data['quiz']!, _quizMeta));
    }
    if (data.containsKey('infoQuiz')) {
      context.handle(_infoQuizMeta,
          infoQuiz.isAcceptableOrUnknown(data['infoQuiz']!, _infoQuizMeta));
    }
    if (data.containsKey('sign')) {
      context.handle(
          _signMeta, sign.isAcceptableOrUnknown(data['sign']!, _signMeta));
    } else if (isInserting) {
      context.missing(_signMeta);
    }
    if (data.containsKey('num2')) {
      context.handle(
          _num2Meta, num2.isAcceptableOrUnknown(data['num2']!, _num2Meta));
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('answerSelect')) {
      context.handle(
          _answerSelectMeta,
          answerSelect.isAcceptableOrUnknown(
              data['answerSelect']!, _answerSelectMeta));
    } else if (isInserting) {
      context.missing(_answerSelectMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizGameEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizGameEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      preId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}preId'])!,
      num1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}num1']),
      quiz: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quiz']),
      infoQuiz: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}infoQuiz']),
      sign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign'])!,
      num2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}num2']),
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      answerSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answerSelect'])!,
    );
  }

  @override
  $QuizGameEntityTable createAlias(String alias) {
    return $QuizGameEntityTable(attachedDatabase, alias);
  }
}

class QuizGameEntityData extends DataClass
    implements Insertable<QuizGameEntityData> {
  final int id;
  final int preId;
  final String? num1;
  final String? quiz;
  final bool? infoQuiz;
  final String sign;
  final String? num2;
  final String answer;
  final String answerSelect;
  const QuizGameEntityData(
      {required this.id,
      required this.preId,
      this.num1,
      this.quiz,
      this.infoQuiz,
      required this.sign,
      this.num2,
      required this.answer,
      required this.answerSelect});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['preId'] = Variable<int>(preId);
    if (!nullToAbsent || num1 != null) {
      map['num1'] = Variable<String>(num1);
    }
    if (!nullToAbsent || quiz != null) {
      map['quiz'] = Variable<String>(quiz);
    }
    if (!nullToAbsent || infoQuiz != null) {
      map['infoQuiz'] = Variable<bool>(infoQuiz);
    }
    map['sign'] = Variable<String>(sign);
    if (!nullToAbsent || num2 != null) {
      map['num2'] = Variable<String>(num2);
    }
    map['answer'] = Variable<String>(answer);
    map['answerSelect'] = Variable<String>(answerSelect);
    return map;
  }

  QuizGameEntityCompanion toCompanion(bool nullToAbsent) {
    return QuizGameEntityCompanion(
      id: Value(id),
      preId: Value(preId),
      num1: num1 == null && nullToAbsent ? const Value.absent() : Value(num1),
      quiz: quiz == null && nullToAbsent ? const Value.absent() : Value(quiz),
      infoQuiz: infoQuiz == null && nullToAbsent
          ? const Value.absent()
          : Value(infoQuiz),
      sign: Value(sign),
      num2: num2 == null && nullToAbsent ? const Value.absent() : Value(num2),
      answer: Value(answer),
      answerSelect: Value(answerSelect),
    );
  }

  factory QuizGameEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizGameEntityData(
      id: serializer.fromJson<int>(json['id']),
      preId: serializer.fromJson<int>(json['preId']),
      num1: serializer.fromJson<String?>(json['num1']),
      quiz: serializer.fromJson<String?>(json['quiz']),
      infoQuiz: serializer.fromJson<bool?>(json['infoQuiz']),
      sign: serializer.fromJson<String>(json['sign']),
      num2: serializer.fromJson<String?>(json['num2']),
      answer: serializer.fromJson<String>(json['answer']),
      answerSelect: serializer.fromJson<String>(json['answerSelect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'preId': serializer.toJson<int>(preId),
      'num1': serializer.toJson<String?>(num1),
      'quiz': serializer.toJson<String?>(quiz),
      'infoQuiz': serializer.toJson<bool?>(infoQuiz),
      'sign': serializer.toJson<String>(sign),
      'num2': serializer.toJson<String?>(num2),
      'answer': serializer.toJson<String>(answer),
      'answerSelect': serializer.toJson<String>(answerSelect),
    };
  }

  QuizGameEntityData copyWith(
          {int? id,
          int? preId,
          Value<String?> num1 = const Value.absent(),
          Value<String?> quiz = const Value.absent(),
          Value<bool?> infoQuiz = const Value.absent(),
          String? sign,
          Value<String?> num2 = const Value.absent(),
          String? answer,
          String? answerSelect}) =>
      QuizGameEntityData(
        id: id ?? this.id,
        preId: preId ?? this.preId,
        num1: num1.present ? num1.value : this.num1,
        quiz: quiz.present ? quiz.value : this.quiz,
        infoQuiz: infoQuiz.present ? infoQuiz.value : this.infoQuiz,
        sign: sign ?? this.sign,
        num2: num2.present ? num2.value : this.num2,
        answer: answer ?? this.answer,
        answerSelect: answerSelect ?? this.answerSelect,
      );
  @override
  String toString() {
    return (StringBuffer('QuizGameEntityData(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('quiz: $quiz, ')
          ..write('infoQuiz: $infoQuiz, ')
          ..write('sign: $sign, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, preId, num1, quiz, infoQuiz, sign, num2, answer, answerSelect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizGameEntityData &&
          other.id == this.id &&
          other.preId == this.preId &&
          other.num1 == this.num1 &&
          other.quiz == this.quiz &&
          other.infoQuiz == this.infoQuiz &&
          other.sign == this.sign &&
          other.num2 == this.num2 &&
          other.answer == this.answer &&
          other.answerSelect == this.answerSelect);
}

class QuizGameEntityCompanion extends UpdateCompanion<QuizGameEntityData> {
  final Value<int> id;
  final Value<int> preId;
  final Value<String?> num1;
  final Value<String?> quiz;
  final Value<bool?> infoQuiz;
  final Value<String> sign;
  final Value<String?> num2;
  final Value<String> answer;
  final Value<String> answerSelect;
  const QuizGameEntityCompanion({
    this.id = const Value.absent(),
    this.preId = const Value.absent(),
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    this.sign = const Value.absent(),
    this.num2 = const Value.absent(),
    this.answer = const Value.absent(),
    this.answerSelect = const Value.absent(),
  });
  QuizGameEntityCompanion.insert({
    this.id = const Value.absent(),
    required int preId,
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    required String sign,
    this.num2 = const Value.absent(),
    required String answer,
    required String answerSelect,
  })  : preId = Value(preId),
        sign = Value(sign),
        answer = Value(answer),
        answerSelect = Value(answerSelect);
  static Insertable<QuizGameEntityData> custom({
    Expression<int>? id,
    Expression<int>? preId,
    Expression<String>? num1,
    Expression<String>? quiz,
    Expression<bool>? infoQuiz,
    Expression<String>? sign,
    Expression<String>? num2,
    Expression<String>? answer,
    Expression<String>? answerSelect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preId != null) 'preId': preId,
      if (num1 != null) 'num1': num1,
      if (quiz != null) 'quiz': quiz,
      if (infoQuiz != null) 'infoQuiz': infoQuiz,
      if (sign != null) 'sign': sign,
      if (num2 != null) 'num2': num2,
      if (answer != null) 'answer': answer,
      if (answerSelect != null) 'answerSelect': answerSelect,
    });
  }

  QuizGameEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? preId,
      Value<String?>? num1,
      Value<String?>? quiz,
      Value<bool?>? infoQuiz,
      Value<String>? sign,
      Value<String?>? num2,
      Value<String>? answer,
      Value<String>? answerSelect}) {
    return QuizGameEntityCompanion(
      id: id ?? this.id,
      preId: preId ?? this.preId,
      num1: num1 ?? this.num1,
      quiz: quiz ?? this.quiz,
      infoQuiz: infoQuiz ?? this.infoQuiz,
      sign: sign ?? this.sign,
      num2: num2 ?? this.num2,
      answer: answer ?? this.answer,
      answerSelect: answerSelect ?? this.answerSelect,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (preId.present) {
      map['preId'] = Variable<int>(preId.value);
    }
    if (num1.present) {
      map['num1'] = Variable<String>(num1.value);
    }
    if (quiz.present) {
      map['quiz'] = Variable<String>(quiz.value);
    }
    if (infoQuiz.present) {
      map['infoQuiz'] = Variable<bool>(infoQuiz.value);
    }
    if (sign.present) {
      map['sign'] = Variable<String>(sign.value);
    }
    if (num2.present) {
      map['num2'] = Variable<String>(num2.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (answerSelect.present) {
      map['answerSelect'] = Variable<String>(answerSelect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizGameEntityCompanion(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('quiz: $quiz, ')
          ..write('infoQuiz: $infoQuiz, ')
          ..write('sign: $sign, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }
}

class $QuizTestEntityTable extends QuizTestEntity
    with TableInfo<$QuizTestEntityTable, QuizTestEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizTestEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _preIdMeta = const VerificationMeta('preId');
  @override
  late final GeneratedColumn<int> preId = GeneratedColumn<int>(
      'preId', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _num1Meta = const VerificationMeta('num1');
  @override
  late final GeneratedColumn<String> num1 = GeneratedColumn<String>(
      'num1', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quizMeta = const VerificationMeta('quiz');
  @override
  late final GeneratedColumn<String> quiz = GeneratedColumn<String>(
      'quiz', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _infoQuizMeta =
      const VerificationMeta('infoQuiz');
  @override
  late final GeneratedColumn<bool> infoQuiz =
      GeneratedColumn<bool>('infoQuiz', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("infoQuiz" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _num2Meta = const VerificationMeta('num2');
  @override
  late final GeneratedColumn<String> num2 = GeneratedColumn<String>(
      'num2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerSelectMeta =
      const VerificationMeta('answerSelect');
  @override
  late final GeneratedColumn<String> answerSelect = GeneratedColumn<String>(
      'answerSelect', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, preId, num1, quiz, infoQuiz, num2, answer, answerSelect];
  @override
  String get aliasedName => _alias ?? 'quiz_test_entity';
  @override
  String get actualTableName => 'quiz_test_entity';
  @override
  VerificationContext validateIntegrity(Insertable<QuizTestEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('preId')) {
      context.handle(
          _preIdMeta, preId.isAcceptableOrUnknown(data['preId']!, _preIdMeta));
    } else if (isInserting) {
      context.missing(_preIdMeta);
    }
    if (data.containsKey('num1')) {
      context.handle(
          _num1Meta, num1.isAcceptableOrUnknown(data['num1']!, _num1Meta));
    }
    if (data.containsKey('quiz')) {
      context.handle(
          _quizMeta, quiz.isAcceptableOrUnknown(data['quiz']!, _quizMeta));
    }
    if (data.containsKey('infoQuiz')) {
      context.handle(_infoQuizMeta,
          infoQuiz.isAcceptableOrUnknown(data['infoQuiz']!, _infoQuizMeta));
    }
    if (data.containsKey('num2')) {
      context.handle(
          _num2Meta, num2.isAcceptableOrUnknown(data['num2']!, _num2Meta));
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('answerSelect')) {
      context.handle(
          _answerSelectMeta,
          answerSelect.isAcceptableOrUnknown(
              data['answerSelect']!, _answerSelectMeta));
    } else if (isInserting) {
      context.missing(_answerSelectMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizTestEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizTestEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      preId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}preId'])!,
      num1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}num1']),
      quiz: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quiz']),
      infoQuiz: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}infoQuiz']),
      num2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}num2']),
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      answerSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answerSelect'])!,
    );
  }

  @override
  $QuizTestEntityTable createAlias(String alias) {
    return $QuizTestEntityTable(attachedDatabase, alias);
  }
}

class QuizTestEntityData extends DataClass
    implements Insertable<QuizTestEntityData> {
  final int id;
  final int preId;
  final String? num1;
  final String? quiz;
  final bool? infoQuiz;
  final String? num2;
  final String answer;
  final String answerSelect;
  const QuizTestEntityData(
      {required this.id,
      required this.preId,
      this.num1,
      this.quiz,
      this.infoQuiz,
      this.num2,
      required this.answer,
      required this.answerSelect});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['preId'] = Variable<int>(preId);
    if (!nullToAbsent || num1 != null) {
      map['num1'] = Variable<String>(num1);
    }
    if (!nullToAbsent || quiz != null) {
      map['quiz'] = Variable<String>(quiz);
    }
    if (!nullToAbsent || infoQuiz != null) {
      map['infoQuiz'] = Variable<bool>(infoQuiz);
    }
    if (!nullToAbsent || num2 != null) {
      map['num2'] = Variable<String>(num2);
    }
    map['answer'] = Variable<String>(answer);
    map['answerSelect'] = Variable<String>(answerSelect);
    return map;
  }

  QuizTestEntityCompanion toCompanion(bool nullToAbsent) {
    return QuizTestEntityCompanion(
      id: Value(id),
      preId: Value(preId),
      num1: num1 == null && nullToAbsent ? const Value.absent() : Value(num1),
      quiz: quiz == null && nullToAbsent ? const Value.absent() : Value(quiz),
      infoQuiz: infoQuiz == null && nullToAbsent
          ? const Value.absent()
          : Value(infoQuiz),
      num2: num2 == null && nullToAbsent ? const Value.absent() : Value(num2),
      answer: Value(answer),
      answerSelect: Value(answerSelect),
    );
  }

  factory QuizTestEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizTestEntityData(
      id: serializer.fromJson<int>(json['id']),
      preId: serializer.fromJson<int>(json['preId']),
      num1: serializer.fromJson<String?>(json['num1']),
      quiz: serializer.fromJson<String?>(json['quiz']),
      infoQuiz: serializer.fromJson<bool?>(json['infoQuiz']),
      num2: serializer.fromJson<String?>(json['num2']),
      answer: serializer.fromJson<String>(json['answer']),
      answerSelect: serializer.fromJson<String>(json['answerSelect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'preId': serializer.toJson<int>(preId),
      'num1': serializer.toJson<String?>(num1),
      'quiz': serializer.toJson<String?>(quiz),
      'infoQuiz': serializer.toJson<bool?>(infoQuiz),
      'num2': serializer.toJson<String?>(num2),
      'answer': serializer.toJson<String>(answer),
      'answerSelect': serializer.toJson<String>(answerSelect),
    };
  }

  QuizTestEntityData copyWith(
          {int? id,
          int? preId,
          Value<String?> num1 = const Value.absent(),
          Value<String?> quiz = const Value.absent(),
          Value<bool?> infoQuiz = const Value.absent(),
          Value<String?> num2 = const Value.absent(),
          String? answer,
          String? answerSelect}) =>
      QuizTestEntityData(
        id: id ?? this.id,
        preId: preId ?? this.preId,
        num1: num1.present ? num1.value : this.num1,
        quiz: quiz.present ? quiz.value : this.quiz,
        infoQuiz: infoQuiz.present ? infoQuiz.value : this.infoQuiz,
        num2: num2.present ? num2.value : this.num2,
        answer: answer ?? this.answer,
        answerSelect: answerSelect ?? this.answerSelect,
      );
  @override
  String toString() {
    return (StringBuffer('QuizTestEntityData(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('quiz: $quiz, ')
          ..write('infoQuiz: $infoQuiz, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, preId, num1, quiz, infoQuiz, num2, answer, answerSelect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizTestEntityData &&
          other.id == this.id &&
          other.preId == this.preId &&
          other.num1 == this.num1 &&
          other.quiz == this.quiz &&
          other.infoQuiz == this.infoQuiz &&
          other.num2 == this.num2 &&
          other.answer == this.answer &&
          other.answerSelect == this.answerSelect);
}

class QuizTestEntityCompanion extends UpdateCompanion<QuizTestEntityData> {
  final Value<int> id;
  final Value<int> preId;
  final Value<String?> num1;
  final Value<String?> quiz;
  final Value<bool?> infoQuiz;
  final Value<String?> num2;
  final Value<String> answer;
  final Value<String> answerSelect;
  const QuizTestEntityCompanion({
    this.id = const Value.absent(),
    this.preId = const Value.absent(),
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    this.num2 = const Value.absent(),
    this.answer = const Value.absent(),
    this.answerSelect = const Value.absent(),
  });
  QuizTestEntityCompanion.insert({
    this.id = const Value.absent(),
    required int preId,
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    this.num2 = const Value.absent(),
    required String answer,
    required String answerSelect,
  })  : preId = Value(preId),
        answer = Value(answer),
        answerSelect = Value(answerSelect);
  static Insertable<QuizTestEntityData> custom({
    Expression<int>? id,
    Expression<int>? preId,
    Expression<String>? num1,
    Expression<String>? quiz,
    Expression<bool>? infoQuiz,
    Expression<String>? num2,
    Expression<String>? answer,
    Expression<String>? answerSelect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preId != null) 'preId': preId,
      if (num1 != null) 'num1': num1,
      if (quiz != null) 'quiz': quiz,
      if (infoQuiz != null) 'infoQuiz': infoQuiz,
      if (num2 != null) 'num2': num2,
      if (answer != null) 'answer': answer,
      if (answerSelect != null) 'answerSelect': answerSelect,
    });
  }

  QuizTestEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? preId,
      Value<String?>? num1,
      Value<String?>? quiz,
      Value<bool?>? infoQuiz,
      Value<String?>? num2,
      Value<String>? answer,
      Value<String>? answerSelect}) {
    return QuizTestEntityCompanion(
      id: id ?? this.id,
      preId: preId ?? this.preId,
      num1: num1 ?? this.num1,
      quiz: quiz ?? this.quiz,
      infoQuiz: infoQuiz ?? this.infoQuiz,
      num2: num2 ?? this.num2,
      answer: answer ?? this.answer,
      answerSelect: answerSelect ?? this.answerSelect,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (preId.present) {
      map['preId'] = Variable<int>(preId.value);
    }
    if (num1.present) {
      map['num1'] = Variable<String>(num1.value);
    }
    if (quiz.present) {
      map['quiz'] = Variable<String>(quiz.value);
    }
    if (infoQuiz.present) {
      map['infoQuiz'] = Variable<bool>(infoQuiz.value);
    }
    if (num2.present) {
      map['num2'] = Variable<String>(num2.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (answerSelect.present) {
      map['answerSelect'] = Variable<String>(answerSelect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizTestEntityCompanion(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('quiz: $quiz, ')
          ..write('infoQuiz: $infoQuiz, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }
}

class $NotifyTaskTable extends NotifyTask
    with TableInfo<$NotifyTaskTable, NotifyTaskData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotifyTaskTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<int> isCompleted = GeneratedColumn<int>(
      'isCompleted', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _daySaveMeta =
      const VerificationMeta('daySave');
  @override
  late final GeneratedColumn<String> daySave = GeneratedColumn<String>(
      'dateSave', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringDayMeta =
      const VerificationMeta('ringDay');
  @override
  late final GeneratedColumn<String> ringDay = GeneratedColumn<String>(
      'ringDay', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'startTime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'endTime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remindMeta = const VerificationMeta('remind');
  @override
  late final GeneratedColumn<String> remind = GeneratedColumn<String>(
      'remind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        note,
        isCompleted,
        daySave,
        ringDay,
        startTime,
        endTime,
        color,
        remind
      ];
  @override
  String get aliasedName => _alias ?? 'notify_task';
  @override
  String get actualTableName => 'notify_task';
  @override
  VerificationContext validateIntegrity(Insertable<NotifyTaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('isCompleted')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['isCompleted']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('dateSave')) {
      context.handle(_daySaveMeta,
          daySave.isAcceptableOrUnknown(data['dateSave']!, _daySaveMeta));
    } else if (isInserting) {
      context.missing(_daySaveMeta);
    }
    if (data.containsKey('ringDay')) {
      context.handle(_ringDayMeta,
          ringDay.isAcceptableOrUnknown(data['ringDay']!, _ringDayMeta));
    } else if (isInserting) {
      context.missing(_ringDayMeta);
    }
    if (data.containsKey('startTime')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['startTime']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('endTime')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['endTime']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('remind')) {
      context.handle(_remindMeta,
          remind.isAcceptableOrUnknown(data['remind']!, _remindMeta));
    } else if (isInserting) {
      context.missing(_remindMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotifyTaskData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotifyTaskData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}isCompleted'])!,
      daySave: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateSave'])!,
      ringDay: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringDay'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startTime'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}endTime'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      remind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remind'])!,
    );
  }

  @override
  $NotifyTaskTable createAlias(String alias) {
    return $NotifyTaskTable(attachedDatabase, alias);
  }
}

class NotifyTaskData extends DataClass implements Insertable<NotifyTaskData> {
  final int id;
  final String title;
  final String note;
  final int isCompleted;
  final String daySave;
  final String ringDay;
  final String startTime;
  final String endTime;
  final String color;
  final String remind;
  const NotifyTaskData(
      {required this.id,
      required this.title,
      required this.note,
      required this.isCompleted,
      required this.daySave,
      required this.ringDay,
      required this.startTime,
      required this.endTime,
      required this.color,
      required this.remind});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['note'] = Variable<String>(note);
    map['isCompleted'] = Variable<int>(isCompleted);
    map['dateSave'] = Variable<String>(daySave);
    map['ringDay'] = Variable<String>(ringDay);
    map['startTime'] = Variable<String>(startTime);
    map['endTime'] = Variable<String>(endTime);
    map['color'] = Variable<String>(color);
    map['remind'] = Variable<String>(remind);
    return map;
  }

  NotifyTaskCompanion toCompanion(bool nullToAbsent) {
    return NotifyTaskCompanion(
      id: Value(id),
      title: Value(title),
      note: Value(note),
      isCompleted: Value(isCompleted),
      daySave: Value(daySave),
      ringDay: Value(ringDay),
      startTime: Value(startTime),
      endTime: Value(endTime),
      color: Value(color),
      remind: Value(remind),
    );
  }

  factory NotifyTaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotifyTaskData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String>(json['note']),
      isCompleted: serializer.fromJson<int>(json['isCompleted']),
      daySave: serializer.fromJson<String>(json['daySave']),
      ringDay: serializer.fromJson<String>(json['ringDay']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      color: serializer.fromJson<String>(json['color']),
      remind: serializer.fromJson<String>(json['remind']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String>(note),
      'isCompleted': serializer.toJson<int>(isCompleted),
      'daySave': serializer.toJson<String>(daySave),
      'ringDay': serializer.toJson<String>(ringDay),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'color': serializer.toJson<String>(color),
      'remind': serializer.toJson<String>(remind),
    };
  }

  NotifyTaskData copyWith(
          {int? id,
          String? title,
          String? note,
          int? isCompleted,
          String? daySave,
          String? ringDay,
          String? startTime,
          String? endTime,
          String? color,
          String? remind}) =>
      NotifyTaskData(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        isCompleted: isCompleted ?? this.isCompleted,
        daySave: daySave ?? this.daySave,
        ringDay: ringDay ?? this.ringDay,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        color: color ?? this.color,
        remind: remind ?? this.remind,
      );
  @override
  String toString() {
    return (StringBuffer('NotifyTaskData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('daySave: $daySave, ')
          ..write('ringDay: $ringDay, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('color: $color, ')
          ..write('remind: $remind')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, note, isCompleted, daySave,
      ringDay, startTime, endTime, color, remind);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotifyTaskData &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.isCompleted == this.isCompleted &&
          other.daySave == this.daySave &&
          other.ringDay == this.ringDay &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.color == this.color &&
          other.remind == this.remind);
}

class NotifyTaskCompanion extends UpdateCompanion<NotifyTaskData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> note;
  final Value<int> isCompleted;
  final Value<String> daySave;
  final Value<String> ringDay;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<String> color;
  final Value<String> remind;
  const NotifyTaskCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.daySave = const Value.absent(),
    this.ringDay = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.color = const Value.absent(),
    this.remind = const Value.absent(),
  });
  NotifyTaskCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String note,
    required int isCompleted,
    required String daySave,
    required String ringDay,
    required String startTime,
    required String endTime,
    required String color,
    required String remind,
  })  : title = Value(title),
        note = Value(note),
        isCompleted = Value(isCompleted),
        daySave = Value(daySave),
        ringDay = Value(ringDay),
        startTime = Value(startTime),
        endTime = Value(endTime),
        color = Value(color),
        remind = Value(remind);
  static Insertable<NotifyTaskData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? note,
    Expression<int>? isCompleted,
    Expression<String>? daySave,
    Expression<String>? ringDay,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? color,
    Expression<String>? remind,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (isCompleted != null) 'isCompleted': isCompleted,
      if (daySave != null) 'dateSave': daySave,
      if (ringDay != null) 'ringDay': ringDay,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
      if (color != null) 'color': color,
      if (remind != null) 'remind': remind,
    });
  }

  NotifyTaskCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? note,
      Value<int>? isCompleted,
      Value<String>? daySave,
      Value<String>? ringDay,
      Value<String>? startTime,
      Value<String>? endTime,
      Value<String>? color,
      Value<String>? remind}) {
    return NotifyTaskCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
      daySave: daySave ?? this.daySave,
      ringDay: ringDay ?? this.ringDay,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      remind: remind ?? this.remind,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isCompleted.present) {
      map['isCompleted'] = Variable<int>(isCompleted.value);
    }
    if (daySave.present) {
      map['dateSave'] = Variable<String>(daySave.value);
    }
    if (ringDay.present) {
      map['ringDay'] = Variable<String>(ringDay.value);
    }
    if (startTime.present) {
      map['startTime'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['endTime'] = Variable<String>(endTime.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (remind.present) {
      map['remind'] = Variable<String>(remind.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotifyTaskCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('daySave: $daySave, ')
          ..write('ringDay: $ringDay, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('color: $color, ')
          ..write('remind: $remind')
          ..write(')'))
        .toString();
  }
}

class $PlayerLocalEntityTable extends PlayerLocalEntity
    with TableInfo<$PlayerLocalEntityTable, PlayerLocalEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerLocalEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUserMeta =
      const VerificationMeta('imageUser');
  @override
  late final GeneratedColumn<String> imageUser = GeneratedColumn<String>(
      'imageUser', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _joinMeta = const VerificationMeta('join');
  @override
  late final GeneratedColumn<int> join = GeneratedColumn<int>(
      'join', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, imageUser, score, join];
  @override
  String get aliasedName => _alias ?? 'player_local_entity';
  @override
  String get actualTableName => 'player_local_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlayerLocalEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('imageUser')) {
      context.handle(_imageUserMeta,
          imageUser.isAcceptableOrUnknown(data['imageUser']!, _imageUserMeta));
    } else if (isInserting) {
      context.missing(_imageUserMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    if (data.containsKey('join')) {
      context.handle(
          _joinMeta, join.isAcceptableOrUnknown(data['join']!, _joinMeta));
    } else if (isInserting) {
      context.missing(_joinMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerLocalEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerLocalEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUser: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imageUser'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}score']),
      join: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}join'])!,
    );
  }

  @override
  $PlayerLocalEntityTable createAlias(String alias) {
    return $PlayerLocalEntityTable(attachedDatabase, alias);
  }
}

class PlayerLocalEntityData extends DataClass
    implements Insertable<PlayerLocalEntityData> {
  final int id;
  final String name;
  final String imageUser;
  final double? score;
  final int join;
  const PlayerLocalEntityData(
      {required this.id,
      required this.name,
      required this.imageUser,
      this.score,
      required this.join});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['imageUser'] = Variable<String>(imageUser);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<double>(score);
    }
    map['join'] = Variable<int>(join);
    return map;
  }

  PlayerLocalEntityCompanion toCompanion(bool nullToAbsent) {
    return PlayerLocalEntityCompanion(
      id: Value(id),
      name: Value(name),
      imageUser: Value(imageUser),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
      join: Value(join),
    );
  }

  factory PlayerLocalEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerLocalEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUser: serializer.fromJson<String>(json['imageUser']),
      score: serializer.fromJson<double?>(json['score']),
      join: serializer.fromJson<int>(json['join']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'imageUser': serializer.toJson<String>(imageUser),
      'score': serializer.toJson<double?>(score),
      'join': serializer.toJson<int>(join),
    };
  }

  PlayerLocalEntityData copyWith(
          {int? id,
          String? name,
          String? imageUser,
          Value<double?> score = const Value.absent(),
          int? join}) =>
      PlayerLocalEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUser: imageUser ?? this.imageUser,
        score: score.present ? score.value : this.score,
        join: join ?? this.join,
      );
  @override
  String toString() {
    return (StringBuffer('PlayerLocalEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUser: $imageUser, ')
          ..write('score: $score, ')
          ..write('join: $join')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imageUser, score, join);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerLocalEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUser == this.imageUser &&
          other.score == this.score &&
          other.join == this.join);
}

class PlayerLocalEntityCompanion
    extends UpdateCompanion<PlayerLocalEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> imageUser;
  final Value<double?> score;
  final Value<int> join;
  const PlayerLocalEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUser = const Value.absent(),
    this.score = const Value.absent(),
    this.join = const Value.absent(),
  });
  PlayerLocalEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String imageUser,
    this.score = const Value.absent(),
    required int join,
  })  : name = Value(name),
        imageUser = Value(imageUser),
        join = Value(join);
  static Insertable<PlayerLocalEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imageUser,
    Expression<double>? score,
    Expression<int>? join,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUser != null) 'imageUser': imageUser,
      if (score != null) 'score': score,
      if (join != null) 'join': join,
    });
  }

  PlayerLocalEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? imageUser,
      Value<double?>? score,
      Value<int>? join}) {
    return PlayerLocalEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUser: imageUser ?? this.imageUser,
      score: score ?? this.score,
      join: join ?? this.join,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUser.present) {
      map['imageUser'] = Variable<String>(imageUser.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (join.present) {
      map['join'] = Variable<int>(join.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerLocalEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUser: $imageUser, ')
          ..write('score: $score, ')
          ..write('join: $join')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $PreQuizGameEntityTable preQuizGameEntity =
      $PreQuizGameEntityTable(this);
  late final $PreTestEntityTable preTestEntity = $PreTestEntityTable(this);
  late final $QuizGameEntityTable quizGameEntity = $QuizGameEntityTable(this);
  late final $QuizTestEntityTable quizTestEntity = $QuizTestEntityTable(this);
  late final $NotifyTaskTable notifyTask = $NotifyTaskTable(this);
  late final $PlayerLocalEntityTable playerLocalEntity =
      $PlayerLocalEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        preQuizGameEntity,
        preTestEntity,
        quizGameEntity,
        quizTestEntity,
        notifyTask,
        playerLocalEntity
      ];
}
