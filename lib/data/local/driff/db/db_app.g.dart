// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app.dart';

// ignore_for_file: type=lint
class $PreQuizEntityTable extends PreQuizEntity
    with TableInfo<$PreQuizEntityTable, PreQuizEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreQuizEntityTable(this.attachedDatabase, [this._alias]);
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
      'option', aliasedName, false,
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
  String get aliasedName => _alias ?? 'pre_quiz_entity';
  @override
  String get actualTableName => 'pre_quiz_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PreQuizEntityData> instance,
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
    if (data.containsKey('option')) {
      context.handle(_optionMeta,
          option.isAcceptableOrUnknown(data['option']!, _optionMeta));
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
  PreQuizEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreQuizEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign'])!,
      option: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option'])!,
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
  $PreQuizEntityTable createAlias(String alias) {
    return $PreQuizEntityTable(attachedDatabase, alias);
  }
}

class PreQuizEntityData extends DataClass
    implements Insertable<PreQuizEntityData> {
  final int id;
  final String sign;
  final String option;
  final String dateSave;
  final int numQ;
  final int eNum;
  final int sNum;
  final int timePer;
  final int? score;
  const PreQuizEntityData(
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
    map['option'] = Variable<String>(option);
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

  PreQuizEntityCompanion toCompanion(bool nullToAbsent) {
    return PreQuizEntityCompanion(
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

  factory PreQuizEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreQuizEntityData(
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

  PreQuizEntityData copyWith(
          {int? id,
          String? sign,
          String? option,
          String? dateSave,
          int? numQ,
          int? eNum,
          int? sNum,
          int? timePer,
          Value<int?> score = const Value.absent()}) =>
      PreQuizEntityData(
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
    return (StringBuffer('PreQuizEntityData(')
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
      (other is PreQuizEntityData &&
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

class PreQuizEntityCompanion extends UpdateCompanion<PreQuizEntityData> {
  final Value<int> id;
  final Value<String> sign;
  final Value<String> option;
  final Value<String> dateSave;
  final Value<int> numQ;
  final Value<int> eNum;
  final Value<int> sNum;
  final Value<int> timePer;
  final Value<int?> score;
  const PreQuizEntityCompanion({
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
  PreQuizEntityCompanion.insert({
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
  static Insertable<PreQuizEntityData> custom({
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
      if (option != null) 'option': option,
      if (dateSave != null) 'dateSave': dateSave,
      if (numQ != null) 'numQ': numQ,
      if (eNum != null) 'eNum': eNum,
      if (sNum != null) 'sNum': sNum,
      if (timePer != null) 'timePer': timePer,
      if (score != null) 'score': score,
    });
  }

  PreQuizEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? sign,
      Value<String>? option,
      Value<String>? dateSave,
      Value<int>? numQ,
      Value<int>? eNum,
      Value<int>? sNum,
      Value<int>? timePer,
      Value<int?>? score}) {
    return PreQuizEntityCompanion(
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
      map['option'] = Variable<String>(option.value);
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
    return (StringBuffer('PreQuizEntityCompanion(')
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
  late final GeneratedColumn<int> num1 = GeneratedColumn<int>(
      'num1', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _signMeta = const VerificationMeta('sign');
  @override
  late final GeneratedColumn<String> sign = GeneratedColumn<String>(
      'sign', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _num2Meta = const VerificationMeta('num2');
  @override
  late final GeneratedColumn<int> num2 = GeneratedColumn<int>(
      'num2', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<int> answer = GeneratedColumn<int>(
      'answer', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _answerSelectMeta =
      const VerificationMeta('answerSelect');
  @override
  late final GeneratedColumn<int> answerSelect = GeneratedColumn<int>(
      'answerSelect', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, preId, num1, sign, num2, answer, answerSelect];
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
    } else if (isInserting) {
      context.missing(_num1Meta);
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
    } else if (isInserting) {
      context.missing(_num2Meta);
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
          .read(DriftSqlType.int, data['${effectivePrefix}num1'])!,
      sign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign'])!,
      num2: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num2'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}answer'])!,
      answerSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}answerSelect'])!,
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
  final int num1;
  final String sign;
  final int num2;
  final int answer;
  final int answerSelect;
  const QuizTestEntityData(
      {required this.id,
      required this.preId,
      required this.num1,
      required this.sign,
      required this.num2,
      required this.answer,
      required this.answerSelect});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['preId'] = Variable<int>(preId);
    map['num1'] = Variable<int>(num1);
    map['sign'] = Variable<String>(sign);
    map['num2'] = Variable<int>(num2);
    map['answer'] = Variable<int>(answer);
    map['answerSelect'] = Variable<int>(answerSelect);
    return map;
  }

  QuizTestEntityCompanion toCompanion(bool nullToAbsent) {
    return QuizTestEntityCompanion(
      id: Value(id),
      preId: Value(preId),
      num1: Value(num1),
      sign: Value(sign),
      num2: Value(num2),
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
      num1: serializer.fromJson<int>(json['num1']),
      sign: serializer.fromJson<String>(json['sign']),
      num2: serializer.fromJson<int>(json['num2']),
      answer: serializer.fromJson<int>(json['answer']),
      answerSelect: serializer.fromJson<int>(json['answerSelect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'preId': serializer.toJson<int>(preId),
      'num1': serializer.toJson<int>(num1),
      'sign': serializer.toJson<String>(sign),
      'num2': serializer.toJson<int>(num2),
      'answer': serializer.toJson<int>(answer),
      'answerSelect': serializer.toJson<int>(answerSelect),
    };
  }

  QuizTestEntityData copyWith(
          {int? id,
          int? preId,
          int? num1,
          String? sign,
          int? num2,
          int? answer,
          int? answerSelect}) =>
      QuizTestEntityData(
        id: id ?? this.id,
        preId: preId ?? this.preId,
        num1: num1 ?? this.num1,
        sign: sign ?? this.sign,
        num2: num2 ?? this.num2,
        answer: answer ?? this.answer,
        answerSelect: answerSelect ?? this.answerSelect,
      );
  @override
  String toString() {
    return (StringBuffer('QuizTestEntityData(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('sign: $sign, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, preId, num1, sign, num2, answer, answerSelect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizTestEntityData &&
          other.id == this.id &&
          other.preId == this.preId &&
          other.num1 == this.num1 &&
          other.sign == this.sign &&
          other.num2 == this.num2 &&
          other.answer == this.answer &&
          other.answerSelect == this.answerSelect);
}

class QuizTestEntityCompanion extends UpdateCompanion<QuizTestEntityData> {
  final Value<int> id;
  final Value<int> preId;
  final Value<int> num1;
  final Value<String> sign;
  final Value<int> num2;
  final Value<int> answer;
  final Value<int> answerSelect;
  const QuizTestEntityCompanion({
    this.id = const Value.absent(),
    this.preId = const Value.absent(),
    this.num1 = const Value.absent(),
    this.sign = const Value.absent(),
    this.num2 = const Value.absent(),
    this.answer = const Value.absent(),
    this.answerSelect = const Value.absent(),
  });
  QuizTestEntityCompanion.insert({
    this.id = const Value.absent(),
    required int preId,
    required int num1,
    required String sign,
    required int num2,
    required int answer,
    required int answerSelect,
  })  : preId = Value(preId),
        num1 = Value(num1),
        sign = Value(sign),
        num2 = Value(num2),
        answer = Value(answer),
        answerSelect = Value(answerSelect);
  static Insertable<QuizTestEntityData> custom({
    Expression<int>? id,
    Expression<int>? preId,
    Expression<int>? num1,
    Expression<String>? sign,
    Expression<int>? num2,
    Expression<int>? answer,
    Expression<int>? answerSelect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preId != null) 'preId': preId,
      if (num1 != null) 'num1': num1,
      if (sign != null) 'sign': sign,
      if (num2 != null) 'num2': num2,
      if (answer != null) 'answer': answer,
      if (answerSelect != null) 'answerSelect': answerSelect,
    });
  }

  QuizTestEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? preId,
      Value<int>? num1,
      Value<String>? sign,
      Value<int>? num2,
      Value<int>? answer,
      Value<int>? answerSelect}) {
    return QuizTestEntityCompanion(
      id: id ?? this.id,
      preId: preId ?? this.preId,
      num1: num1 ?? this.num1,
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
      map['num1'] = Variable<int>(num1.value);
    }
    if (sign.present) {
      map['sign'] = Variable<String>(sign.value);
    }
    if (num2.present) {
      map['num2'] = Variable<int>(num2.value);
    }
    if (answer.present) {
      map['answer'] = Variable<int>(answer.value);
    }
    if (answerSelect.present) {
      map['answerSelect'] = Variable<int>(answerSelect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizTestEntityCompanion(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('sign: $sign, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }
}

class $QuizPraEntityTable extends QuizPraEntity
    with TableInfo<$QuizPraEntityTable, QuizPraEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizPraEntityTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> num1 = GeneratedColumn<int>(
      'num1', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _signMeta = const VerificationMeta('sign');
  @override
  late final GeneratedColumn<String> sign = GeneratedColumn<String>(
      'sign', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _num2Meta = const VerificationMeta('num2');
  @override
  late final GeneratedColumn<int> num2 = GeneratedColumn<int>(
      'num2', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<int> answer = GeneratedColumn<int>(
      'answer', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _answerSelectMeta =
      const VerificationMeta('answerSelect');
  @override
  late final GeneratedColumn<int> answerSelect = GeneratedColumn<int>(
      'answerSelect', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, preId, num1, sign, num2, answer, answerSelect];
  @override
  String get aliasedName => _alias ?? 'quiz_pra_entity';
  @override
  String get actualTableName => 'quiz_pra_entity';
  @override
  VerificationContext validateIntegrity(Insertable<QuizPraEntityData> instance,
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
  QuizPraEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizPraEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      preId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}preId'])!,
      num1: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num1']),
      sign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign'])!,
      num2: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num2']),
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}answer'])!,
      answerSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}answerSelect'])!,
    );
  }

  @override
  $QuizPraEntityTable createAlias(String alias) {
    return $QuizPraEntityTable(attachedDatabase, alias);
  }
}

class QuizPraEntityData extends DataClass
    implements Insertable<QuizPraEntityData> {
  final int id;
  final int preId;
  final int? num1;
  final String sign;
  final int? num2;
  final int answer;
  final int answerSelect;
  const QuizPraEntityData(
      {required this.id,
      required this.preId,
      this.num1,
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
      map['num1'] = Variable<int>(num1);
    }
    map['sign'] = Variable<String>(sign);
    if (!nullToAbsent || num2 != null) {
      map['num2'] = Variable<int>(num2);
    }
    map['answer'] = Variable<int>(answer);
    map['answerSelect'] = Variable<int>(answerSelect);
    return map;
  }

  QuizPraEntityCompanion toCompanion(bool nullToAbsent) {
    return QuizPraEntityCompanion(
      id: Value(id),
      preId: Value(preId),
      num1: num1 == null && nullToAbsent ? const Value.absent() : Value(num1),
      sign: Value(sign),
      num2: num2 == null && nullToAbsent ? const Value.absent() : Value(num2),
      answer: Value(answer),
      answerSelect: Value(answerSelect),
    );
  }

  factory QuizPraEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizPraEntityData(
      id: serializer.fromJson<int>(json['id']),
      preId: serializer.fromJson<int>(json['preId']),
      num1: serializer.fromJson<int?>(json['num1']),
      sign: serializer.fromJson<String>(json['sign']),
      num2: serializer.fromJson<int?>(json['num2']),
      answer: serializer.fromJson<int>(json['answer']),
      answerSelect: serializer.fromJson<int>(json['answerSelect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'preId': serializer.toJson<int>(preId),
      'num1': serializer.toJson<int?>(num1),
      'sign': serializer.toJson<String>(sign),
      'num2': serializer.toJson<int?>(num2),
      'answer': serializer.toJson<int>(answer),
      'answerSelect': serializer.toJson<int>(answerSelect),
    };
  }

  QuizPraEntityData copyWith(
          {int? id,
          int? preId,
          Value<int?> num1 = const Value.absent(),
          String? sign,
          Value<int?> num2 = const Value.absent(),
          int? answer,
          int? answerSelect}) =>
      QuizPraEntityData(
        id: id ?? this.id,
        preId: preId ?? this.preId,
        num1: num1.present ? num1.value : this.num1,
        sign: sign ?? this.sign,
        num2: num2.present ? num2.value : this.num2,
        answer: answer ?? this.answer,
        answerSelect: answerSelect ?? this.answerSelect,
      );
  @override
  String toString() {
    return (StringBuffer('QuizPraEntityData(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('sign: $sign, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, preId, num1, sign, num2, answer, answerSelect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizPraEntityData &&
          other.id == this.id &&
          other.preId == this.preId &&
          other.num1 == this.num1 &&
          other.sign == this.sign &&
          other.num2 == this.num2 &&
          other.answer == this.answer &&
          other.answerSelect == this.answerSelect);
}

class QuizPraEntityCompanion extends UpdateCompanion<QuizPraEntityData> {
  final Value<int> id;
  final Value<int> preId;
  final Value<int?> num1;
  final Value<String> sign;
  final Value<int?> num2;
  final Value<int> answer;
  final Value<int> answerSelect;
  const QuizPraEntityCompanion({
    this.id = const Value.absent(),
    this.preId = const Value.absent(),
    this.num1 = const Value.absent(),
    this.sign = const Value.absent(),
    this.num2 = const Value.absent(),
    this.answer = const Value.absent(),
    this.answerSelect = const Value.absent(),
  });
  QuizPraEntityCompanion.insert({
    this.id = const Value.absent(),
    required int preId,
    this.num1 = const Value.absent(),
    required String sign,
    this.num2 = const Value.absent(),
    required int answer,
    required int answerSelect,
  })  : preId = Value(preId),
        sign = Value(sign),
        answer = Value(answer),
        answerSelect = Value(answerSelect);
  static Insertable<QuizPraEntityData> custom({
    Expression<int>? id,
    Expression<int>? preId,
    Expression<int>? num1,
    Expression<String>? sign,
    Expression<int>? num2,
    Expression<int>? answer,
    Expression<int>? answerSelect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preId != null) 'preId': preId,
      if (num1 != null) 'num1': num1,
      if (sign != null) 'sign': sign,
      if (num2 != null) 'num2': num2,
      if (answer != null) 'answer': answer,
      if (answerSelect != null) 'answerSelect': answerSelect,
    });
  }

  QuizPraEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? preId,
      Value<int?>? num1,
      Value<String>? sign,
      Value<int?>? num2,
      Value<int>? answer,
      Value<int>? answerSelect}) {
    return QuizPraEntityCompanion(
      id: id ?? this.id,
      preId: preId ?? this.preId,
      num1: num1 ?? this.num1,
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
      map['num1'] = Variable<int>(num1.value);
    }
    if (sign.present) {
      map['sign'] = Variable<String>(sign.value);
    }
    if (num2.present) {
      map['num2'] = Variable<int>(num2.value);
    }
    if (answer.present) {
      map['answer'] = Variable<int>(answer.value);
    }
    if (answerSelect.present) {
      map['answerSelect'] = Variable<int>(answerSelect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizPraEntityCompanion(')
          ..write('id: $id, ')
          ..write('preId: $preId, ')
          ..write('num1: $num1, ')
          ..write('sign: $sign, ')
          ..write('num2: $num2, ')
          ..write('answer: $answer, ')
          ..write('answerSelect: $answerSelect')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $PreQuizEntityTable preQuizEntity = $PreQuizEntityTable(this);
  late final $PreTestEntityTable preTestEntity = $PreTestEntityTable(this);
  late final $QuizTestEntityTable quizTestEntity = $QuizTestEntityTable(this);
  late final $QuizPraEntityTable quizPraEntity = $QuizPraEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [preQuizEntity, preTestEntity, quizTestEntity, quizPraEntity];
}
