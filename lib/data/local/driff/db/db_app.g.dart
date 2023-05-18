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
  static const VerificationMeta _eNumMeta = const VerificationMeta('eNum');
  @override
  late final GeneratedColumn<int> eNum = GeneratedColumn<int>(
      'eNum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sNumMeta = const VerificationMeta('sNum');
  @override
  late final GeneratedColumn<int> sNum = GeneratedColumn<int>(
      'sNum', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timePerMeta =
      const VerificationMeta('timePer');
  @override
  late final GeneratedColumn<int> timePer = GeneratedColumn<int>(
      'timePer', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sign, option, dateSave, numQ, eNum, sNum, timePer, score];
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
    if (data.containsKey('eNum')) {
      context.handle(
          _eNumMeta, eNum.isAcceptableOrUnknown(data['eNum']!, _eNumMeta));
    } else if (isInserting) {
      context.missing(_eNumMeta);
    }
    if (data.containsKey('sNum')) {
      context.handle(
          _sNumMeta, sNum.isAcceptableOrUnknown(data['sNum']!, _sNumMeta));
    } else if (isInserting) {
      context.missing(_sNumMeta);
    }
    if (data.containsKey('timePer')) {
      context.handle(_timePerMeta,
          timePer.isAcceptableOrUnknown(data['timePer']!, _timePerMeta));
    } else if (isInserting) {
      context.missing(_timePerMeta);
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
      eNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}eNum'])!,
      sNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sNum'])!,
      timePer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timePer'])!,
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
  final int eNum;
  final int sNum;
  final int timePer;
  final int? score;
  const PreQuizGameEntityData(
      {required this.id,
      required this.sign,
      required this.option,
      required this.dateSave,
      required this.numQ,
      required this.eNum,
      required this.sNum,
      required this.timePer,
      this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sign'] = Variable<String>(sign);
    map['option_game_mode'] = Variable<String>(option);
    map['dateSave'] = Variable<String>(dateSave);
    map['numQ'] = Variable<int>(numQ);
    map['eNum'] = Variable<int>(eNum);
    map['sNum'] = Variable<int>(sNum);
    map['timePer'] = Variable<int>(timePer);
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
      eNum: Value(eNum),
      sNum: Value(sNum),
      timePer: Value(timePer),
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
      eNum: serializer.fromJson<int>(json['eNum']),
      sNum: serializer.fromJson<int>(json['sNum']),
      timePer: serializer.fromJson<int>(json['timePer']),
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
      'eNum': serializer.toJson<int>(eNum),
      'sNum': serializer.toJson<int>(sNum),
      'timePer': serializer.toJson<int>(timePer),
      'score': serializer.toJson<int?>(score),
    };
  }

  PreQuizGameEntityData copyWith(
          {int? id,
          String? sign,
          String? option,
          String? dateSave,
          int? numQ,
          int? eNum,
          int? sNum,
          int? timePer,
          Value<int?> score = const Value.absent()}) =>
      PreQuizGameEntityData(
        id: id ?? this.id,
        sign: sign ?? this.sign,
        option: option ?? this.option,
        dateSave: dateSave ?? this.dateSave,
        numQ: numQ ?? this.numQ,
        eNum: eNum ?? this.eNum,
        sNum: sNum ?? this.sNum,
        timePer: timePer ?? this.timePer,
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
          ..write('eNum: $eNum, ')
          ..write('sNum: $sNum, ')
          ..write('timePer: $timePer, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sign, option, dateSave, numQ, eNum, sNum, timePer, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreQuizGameEntityData &&
          other.id == this.id &&
          other.sign == this.sign &&
          other.option == this.option &&
          other.dateSave == this.dateSave &&
          other.numQ == this.numQ &&
          other.eNum == this.eNum &&
          other.sNum == this.sNum &&
          other.timePer == this.timePer &&
          other.score == this.score);
}

class PreQuizGameEntityCompanion
    extends UpdateCompanion<PreQuizGameEntityData> {
  final Value<int> id;
  final Value<String> sign;
  final Value<String> option;
  final Value<String> dateSave;
  final Value<int> numQ;
  final Value<int> eNum;
  final Value<int> sNum;
  final Value<int> timePer;
  final Value<int?> score;
  const PreQuizGameEntityCompanion({
    this.id = const Value.absent(),
    this.sign = const Value.absent(),
    this.option = const Value.absent(),
    this.dateSave = const Value.absent(),
    this.numQ = const Value.absent(),
    this.eNum = const Value.absent(),
    this.sNum = const Value.absent(),
    this.timePer = const Value.absent(),
    this.score = const Value.absent(),
  });
  PreQuizGameEntityCompanion.insert({
    this.id = const Value.absent(),
    required String sign,
    required String option,
    required String dateSave,
    required int numQ,
    required int eNum,
    required int sNum,
    required int timePer,
    this.score = const Value.absent(),
  })  : sign = Value(sign),
        option = Value(option),
        dateSave = Value(dateSave),
        numQ = Value(numQ),
        eNum = Value(eNum),
        sNum = Value(sNum),
        timePer = Value(timePer);
  static Insertable<PreQuizGameEntityData> custom({
    Expression<int>? id,
    Expression<String>? sign,
    Expression<String>? option,
    Expression<String>? dateSave,
    Expression<int>? numQ,
    Expression<int>? eNum,
    Expression<int>? sNum,
    Expression<int>? timePer,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sign != null) 'sign': sign,
      if (option != null) 'option_game_mode': option,
      if (dateSave != null) 'dateSave': dateSave,
      if (numQ != null) 'numQ': numQ,
      if (eNum != null) 'eNum': eNum,
      if (sNum != null) 'sNum': sNum,
      if (timePer != null) 'timePer': timePer,
      if (score != null) 'score': score,
    });
  }

  PreQuizGameEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? sign,
      Value<String>? option,
      Value<String>? dateSave,
      Value<int>? numQ,
      Value<int>? eNum,
      Value<int>? sNum,
      Value<int>? timePer,
      Value<int?>? score}) {
    return PreQuizGameEntityCompanion(
      id: id ?? this.id,
      sign: sign ?? this.sign,
      option: option ?? this.option,
      dateSave: dateSave ?? this.dateSave,
      numQ: numQ ?? this.numQ,
      eNum: eNum ?? this.eNum,
      sNum: sNum ?? this.sNum,
      timePer: timePer ?? this.timePer,
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
    if (eNum.present) {
      map['eNum'] = Variable<int>(eNum.value);
    }
    if (sNum.present) {
      map['sNum'] = Variable<int>(sNum.value);
    }
    if (timePer.present) {
      map['timePer'] = Variable<int>(timePer.value);
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
          ..write('eNum: $eNum, ')
          ..write('sNum: $sNum, ')
          ..write('timePer: $timePer, ')
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

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $PreQuizGameEntityTable preQuizGameEntity =
      $PreQuizGameEntityTable(this);
  late final $PreTestEntityTable preTestEntity = $PreTestEntityTable(this);
  late final $QuizGameEntityTable quizGameEntity = $QuizGameEntityTable(this);
  late final $QuizTestEntityTable quizTestEntity = $QuizTestEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [preQuizGameEntity, preTestEntity, quizGameEntity, quizTestEntity];
}
