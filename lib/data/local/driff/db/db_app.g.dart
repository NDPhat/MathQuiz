// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_app.dart';

// ignore_for_file: type=lint
class $PrePraLocalEntityTable extends PrePraLocalEntity
    with TableInfo<$PrePraLocalEntityTable, PrePraLocalEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrePraLocalEntityTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _sumQMeta = const VerificationMeta('sumQ');
  @override
  late final GeneratedColumn<int> sumQ = GeneratedColumn<int>(
      'sumQ', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sign, option, dateSave, sumQ, score];
  @override
  String get aliasedName => _alias ?? 'pre_pra_local_entity';
  @override
  String get actualTableName => 'pre_pra_local_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<PrePraLocalEntityData> instance,
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
    if (data.containsKey('sumQ')) {
      context.handle(
          _sumQMeta, sumQ.isAcceptableOrUnknown(data['sumQ']!, _sumQMeta));
    } else if (isInserting) {
      context.missing(_sumQMeta);
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
  PrePraLocalEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrePraLocalEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign'])!,
      option: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}option_game_mode'])!,
      dateSave: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateSave'])!,
      sumQ: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sumQ'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score']),
    );
  }

  @override
  $PrePraLocalEntityTable createAlias(String alias) {
    return $PrePraLocalEntityTable(attachedDatabase, alias);
  }
}

class PrePraLocalEntityData extends DataClass
    implements Insertable<PrePraLocalEntityData> {
  final int id;
  final String sign;
  final String option;
  final String dateSave;
  final int sumQ;
  final int? score;
  const PrePraLocalEntityData(
      {required this.id,
      required this.sign,
      required this.option,
      required this.dateSave,
      required this.sumQ,
      this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sign'] = Variable<String>(sign);
    map['option_game_mode'] = Variable<String>(option);
    map['dateSave'] = Variable<String>(dateSave);
    map['sumQ'] = Variable<int>(sumQ);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    return map;
  }

  PrePraLocalEntityCompanion toCompanion(bool nullToAbsent) {
    return PrePraLocalEntityCompanion(
      id: Value(id),
      sign: Value(sign),
      option: Value(option),
      dateSave: Value(dateSave),
      sumQ: Value(sumQ),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
    );
  }

  factory PrePraLocalEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrePraLocalEntityData(
      id: serializer.fromJson<int>(json['id']),
      sign: serializer.fromJson<String>(json['sign']),
      option: serializer.fromJson<String>(json['option']),
      dateSave: serializer.fromJson<String>(json['dateSave']),
      sumQ: serializer.fromJson<int>(json['sumQ']),
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
      'sumQ': serializer.toJson<int>(sumQ),
      'score': serializer.toJson<int?>(score),
    };
  }

  PrePraLocalEntityData copyWith(
          {int? id,
          String? sign,
          String? option,
          String? dateSave,
          int? sumQ,
          Value<int?> score = const Value.absent()}) =>
      PrePraLocalEntityData(
        id: id ?? this.id,
        sign: sign ?? this.sign,
        option: option ?? this.option,
        dateSave: dateSave ?? this.dateSave,
        sumQ: sumQ ?? this.sumQ,
        score: score.present ? score.value : this.score,
      );
  @override
  String toString() {
    return (StringBuffer('PrePraLocalEntityData(')
          ..write('id: $id, ')
          ..write('sign: $sign, ')
          ..write('option: $option, ')
          ..write('dateSave: $dateSave, ')
          ..write('sumQ: $sumQ, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sign, option, dateSave, sumQ, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrePraLocalEntityData &&
          other.id == this.id &&
          other.sign == this.sign &&
          other.option == this.option &&
          other.dateSave == this.dateSave &&
          other.sumQ == this.sumQ &&
          other.score == this.score);
}

class PrePraLocalEntityCompanion
    extends UpdateCompanion<PrePraLocalEntityData> {
  final Value<int> id;
  final Value<String> sign;
  final Value<String> option;
  final Value<String> dateSave;
  final Value<int> sumQ;
  final Value<int?> score;
  const PrePraLocalEntityCompanion({
    this.id = const Value.absent(),
    this.sign = const Value.absent(),
    this.option = const Value.absent(),
    this.dateSave = const Value.absent(),
    this.sumQ = const Value.absent(),
    this.score = const Value.absent(),
  });
  PrePraLocalEntityCompanion.insert({
    this.id = const Value.absent(),
    required String sign,
    required String option,
    required String dateSave,
    required int sumQ,
    this.score = const Value.absent(),
  })  : sign = Value(sign),
        option = Value(option),
        dateSave = Value(dateSave),
        sumQ = Value(sumQ);
  static Insertable<PrePraLocalEntityData> custom({
    Expression<int>? id,
    Expression<String>? sign,
    Expression<String>? option,
    Expression<String>? dateSave,
    Expression<int>? sumQ,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sign != null) 'sign': sign,
      if (option != null) 'option_game_mode': option,
      if (dateSave != null) 'dateSave': dateSave,
      if (sumQ != null) 'sumQ': sumQ,
      if (score != null) 'score': score,
    });
  }

  PrePraLocalEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? sign,
      Value<String>? option,
      Value<String>? dateSave,
      Value<int>? sumQ,
      Value<int?>? score}) {
    return PrePraLocalEntityCompanion(
      id: id ?? this.id,
      sign: sign ?? this.sign,
      option: option ?? this.option,
      dateSave: dateSave ?? this.dateSave,
      sumQ: sumQ ?? this.sumQ,
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
    if (sumQ.present) {
      map['sumQ'] = Variable<int>(sumQ.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrePraLocalEntityCompanion(')
          ..write('id: $id, ')
          ..write('sign: $sign, ')
          ..write('option: $option, ')
          ..write('dateSave: $dateSave, ')
          ..write('sumQ: $sumQ, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

class $PreTestLocalEntityTable extends PreTestLocalEntity
    with TableInfo<$PreTestLocalEntityTable, PreTestLocalEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreTestLocalEntityTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _sumQMeta = const VerificationMeta('sumQ');
  @override
  late final GeneratedColumn<int> sumQ = GeneratedColumn<int>(
      'sumQ', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, dateSave, sumQ, score];
  @override
  String get aliasedName => _alias ?? 'pre_test_local_entity';
  @override
  String get actualTableName => 'pre_test_local_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<PreTestLocalEntityData> instance,
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
    if (data.containsKey('sumQ')) {
      context.handle(
          _sumQMeta, sumQ.isAcceptableOrUnknown(data['sumQ']!, _sumQMeta));
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
  PreTestLocalEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreTestLocalEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateSave: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateSave'])!,
      sumQ: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sumQ']),
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score']),
    );
  }

  @override
  $PreTestLocalEntityTable createAlias(String alias) {
    return $PreTestLocalEntityTable(attachedDatabase, alias);
  }
}

class PreTestLocalEntityData extends DataClass
    implements Insertable<PreTestLocalEntityData> {
  final int id;
  final String dateSave;
  final int? sumQ;
  final int? score;
  const PreTestLocalEntityData(
      {required this.id, required this.dateSave, this.sumQ, this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['dateSave'] = Variable<String>(dateSave);
    if (!nullToAbsent || sumQ != null) {
      map['sumQ'] = Variable<int>(sumQ);
    }
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    return map;
  }

  PreTestLocalEntityCompanion toCompanion(bool nullToAbsent) {
    return PreTestLocalEntityCompanion(
      id: Value(id),
      dateSave: Value(dateSave),
      sumQ: sumQ == null && nullToAbsent ? const Value.absent() : Value(sumQ),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
    );
  }

  factory PreTestLocalEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreTestLocalEntityData(
      id: serializer.fromJson<int>(json['id']),
      dateSave: serializer.fromJson<String>(json['dateSave']),
      sumQ: serializer.fromJson<int?>(json['sumQ']),
      score: serializer.fromJson<int?>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateSave': serializer.toJson<String>(dateSave),
      'sumQ': serializer.toJson<int?>(sumQ),
      'score': serializer.toJson<int?>(score),
    };
  }

  PreTestLocalEntityData copyWith(
          {int? id,
          String? dateSave,
          Value<int?> sumQ = const Value.absent(),
          Value<int?> score = const Value.absent()}) =>
      PreTestLocalEntityData(
        id: id ?? this.id,
        dateSave: dateSave ?? this.dateSave,
        sumQ: sumQ.present ? sumQ.value : this.sumQ,
        score: score.present ? score.value : this.score,
      );
  @override
  String toString() {
    return (StringBuffer('PreTestLocalEntityData(')
          ..write('id: $id, ')
          ..write('dateSave: $dateSave, ')
          ..write('sumQ: $sumQ, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateSave, sumQ, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreTestLocalEntityData &&
          other.id == this.id &&
          other.dateSave == this.dateSave &&
          other.sumQ == this.sumQ &&
          other.score == this.score);
}

class PreTestLocalEntityCompanion
    extends UpdateCompanion<PreTestLocalEntityData> {
  final Value<int> id;
  final Value<String> dateSave;
  final Value<int?> sumQ;
  final Value<int?> score;
  const PreTestLocalEntityCompanion({
    this.id = const Value.absent(),
    this.dateSave = const Value.absent(),
    this.sumQ = const Value.absent(),
    this.score = const Value.absent(),
  });
  PreTestLocalEntityCompanion.insert({
    this.id = const Value.absent(),
    required String dateSave,
    this.sumQ = const Value.absent(),
    this.score = const Value.absent(),
  }) : dateSave = Value(dateSave);
  static Insertable<PreTestLocalEntityData> custom({
    Expression<int>? id,
    Expression<String>? dateSave,
    Expression<int>? sumQ,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateSave != null) 'dateSave': dateSave,
      if (sumQ != null) 'sumQ': sumQ,
      if (score != null) 'score': score,
    });
  }

  PreTestLocalEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? dateSave,
      Value<int?>? sumQ,
      Value<int?>? score}) {
    return PreTestLocalEntityCompanion(
      id: id ?? this.id,
      dateSave: dateSave ?? this.dateSave,
      sumQ: sumQ ?? this.sumQ,
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
    if (sumQ.present) {
      map['sumQ'] = Variable<int>(sumQ.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreTestLocalEntityCompanion(')
          ..write('id: $id, ')
          ..write('dateSave: $dateSave, ')
          ..write('sumQ: $sumQ, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

class $QuizPraLocalEntityTable extends QuizPraLocalEntity
    with TableInfo<$QuizPraLocalEntityTable, QuizPraLocalEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizPraLocalEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _prePraIdMeta =
      const VerificationMeta('prePraId');
  @override
  late final GeneratedColumn<int> prePraId = GeneratedColumn<int>(
      'prePraId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pre_pra_local_entity (id)'));
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
      [id, prePraId, num1, quiz, infoQuiz, sign, num2, answer, answerSelect];
  @override
  String get aliasedName => _alias ?? 'quiz_pra_local_entity';
  @override
  String get actualTableName => 'quiz_pra_local_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<QuizPraLocalEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('prePraId')) {
      context.handle(_prePraIdMeta,
          prePraId.isAcceptableOrUnknown(data['prePraId']!, _prePraIdMeta));
    } else if (isInserting) {
      context.missing(_prePraIdMeta);
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
  QuizPraLocalEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizPraLocalEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      prePraId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prePraId'])!,
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
  $QuizPraLocalEntityTable createAlias(String alias) {
    return $QuizPraLocalEntityTable(attachedDatabase, alias);
  }
}

class QuizPraLocalEntityData extends DataClass
    implements Insertable<QuizPraLocalEntityData> {
  final int id;
  final int prePraId;
  final String? num1;
  final String? quiz;
  final bool? infoQuiz;
  final String sign;
  final String? num2;
  final String answer;
  final String answerSelect;
  const QuizPraLocalEntityData(
      {required this.id,
      required this.prePraId,
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
    map['prePraId'] = Variable<int>(prePraId);
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

  QuizPraLocalEntityCompanion toCompanion(bool nullToAbsent) {
    return QuizPraLocalEntityCompanion(
      id: Value(id),
      prePraId: Value(prePraId),
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

  factory QuizPraLocalEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizPraLocalEntityData(
      id: serializer.fromJson<int>(json['id']),
      prePraId: serializer.fromJson<int>(json['prePraId']),
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
      'prePraId': serializer.toJson<int>(prePraId),
      'num1': serializer.toJson<String?>(num1),
      'quiz': serializer.toJson<String?>(quiz),
      'infoQuiz': serializer.toJson<bool?>(infoQuiz),
      'sign': serializer.toJson<String>(sign),
      'num2': serializer.toJson<String?>(num2),
      'answer': serializer.toJson<String>(answer),
      'answerSelect': serializer.toJson<String>(answerSelect),
    };
  }

  QuizPraLocalEntityData copyWith(
          {int? id,
          int? prePraId,
          Value<String?> num1 = const Value.absent(),
          Value<String?> quiz = const Value.absent(),
          Value<bool?> infoQuiz = const Value.absent(),
          String? sign,
          Value<String?> num2 = const Value.absent(),
          String? answer,
          String? answerSelect}) =>
      QuizPraLocalEntityData(
        id: id ?? this.id,
        prePraId: prePraId ?? this.prePraId,
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
    return (StringBuffer('QuizPraLocalEntityData(')
          ..write('id: $id, ')
          ..write('prePraId: $prePraId, ')
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
      id, prePraId, num1, quiz, infoQuiz, sign, num2, answer, answerSelect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizPraLocalEntityData &&
          other.id == this.id &&
          other.prePraId == this.prePraId &&
          other.num1 == this.num1 &&
          other.quiz == this.quiz &&
          other.infoQuiz == this.infoQuiz &&
          other.sign == this.sign &&
          other.num2 == this.num2 &&
          other.answer == this.answer &&
          other.answerSelect == this.answerSelect);
}

class QuizPraLocalEntityCompanion
    extends UpdateCompanion<QuizPraLocalEntityData> {
  final Value<int> id;
  final Value<int> prePraId;
  final Value<String?> num1;
  final Value<String?> quiz;
  final Value<bool?> infoQuiz;
  final Value<String> sign;
  final Value<String?> num2;
  final Value<String> answer;
  final Value<String> answerSelect;
  const QuizPraLocalEntityCompanion({
    this.id = const Value.absent(),
    this.prePraId = const Value.absent(),
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    this.sign = const Value.absent(),
    this.num2 = const Value.absent(),
    this.answer = const Value.absent(),
    this.answerSelect = const Value.absent(),
  });
  QuizPraLocalEntityCompanion.insert({
    this.id = const Value.absent(),
    required int prePraId,
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    required String sign,
    this.num2 = const Value.absent(),
    required String answer,
    required String answerSelect,
  })  : prePraId = Value(prePraId),
        sign = Value(sign),
        answer = Value(answer),
        answerSelect = Value(answerSelect);
  static Insertable<QuizPraLocalEntityData> custom({
    Expression<int>? id,
    Expression<int>? prePraId,
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
      if (prePraId != null) 'prePraId': prePraId,
      if (num1 != null) 'num1': num1,
      if (quiz != null) 'quiz': quiz,
      if (infoQuiz != null) 'infoQuiz': infoQuiz,
      if (sign != null) 'sign': sign,
      if (num2 != null) 'num2': num2,
      if (answer != null) 'answer': answer,
      if (answerSelect != null) 'answerSelect': answerSelect,
    });
  }

  QuizPraLocalEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? prePraId,
      Value<String?>? num1,
      Value<String?>? quiz,
      Value<bool?>? infoQuiz,
      Value<String>? sign,
      Value<String?>? num2,
      Value<String>? answer,
      Value<String>? answerSelect}) {
    return QuizPraLocalEntityCompanion(
      id: id ?? this.id,
      prePraId: prePraId ?? this.prePraId,
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
    if (prePraId.present) {
      map['prePraId'] = Variable<int>(prePraId.value);
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
    return (StringBuffer('QuizPraLocalEntityCompanion(')
          ..write('id: $id, ')
          ..write('prePraId: $prePraId, ')
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

class $QuizTestLocalEntityTable extends QuizTestLocalEntity
    with TableInfo<$QuizTestLocalEntityTable, QuizTestLocalEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizTestLocalEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _preTestIdMeta =
      const VerificationMeta('preTestId');
  @override
  late final GeneratedColumn<int> preTestId = GeneratedColumn<int>(
      'preTestId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pre_test_local_entity (id)'));
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
      [id, preTestId, num1, quiz, infoQuiz, num2, answer, answerSelect];
  @override
  String get aliasedName => _alias ?? 'quiz_test_local_entity';
  @override
  String get actualTableName => 'quiz_test_local_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<QuizTestLocalEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('preTestId')) {
      context.handle(_preTestIdMeta,
          preTestId.isAcceptableOrUnknown(data['preTestId']!, _preTestIdMeta));
    } else if (isInserting) {
      context.missing(_preTestIdMeta);
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
  QuizTestLocalEntityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizTestLocalEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      preTestId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}preTestId'])!,
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
  $QuizTestLocalEntityTable createAlias(String alias) {
    return $QuizTestLocalEntityTable(attachedDatabase, alias);
  }
}

class QuizTestLocalEntityData extends DataClass
    implements Insertable<QuizTestLocalEntityData> {
  final int id;
  final int preTestId;
  final String? num1;
  final String? quiz;
  final bool? infoQuiz;
  final String? num2;
  final String answer;
  final String answerSelect;
  const QuizTestLocalEntityData(
      {required this.id,
      required this.preTestId,
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
    map['preTestId'] = Variable<int>(preTestId);
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

  QuizTestLocalEntityCompanion toCompanion(bool nullToAbsent) {
    return QuizTestLocalEntityCompanion(
      id: Value(id),
      preTestId: Value(preTestId),
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

  factory QuizTestLocalEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizTestLocalEntityData(
      id: serializer.fromJson<int>(json['id']),
      preTestId: serializer.fromJson<int>(json['preTestId']),
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
      'preTestId': serializer.toJson<int>(preTestId),
      'num1': serializer.toJson<String?>(num1),
      'quiz': serializer.toJson<String?>(quiz),
      'infoQuiz': serializer.toJson<bool?>(infoQuiz),
      'num2': serializer.toJson<String?>(num2),
      'answer': serializer.toJson<String>(answer),
      'answerSelect': serializer.toJson<String>(answerSelect),
    };
  }

  QuizTestLocalEntityData copyWith(
          {int? id,
          int? preTestId,
          Value<String?> num1 = const Value.absent(),
          Value<String?> quiz = const Value.absent(),
          Value<bool?> infoQuiz = const Value.absent(),
          Value<String?> num2 = const Value.absent(),
          String? answer,
          String? answerSelect}) =>
      QuizTestLocalEntityData(
        id: id ?? this.id,
        preTestId: preTestId ?? this.preTestId,
        num1: num1.present ? num1.value : this.num1,
        quiz: quiz.present ? quiz.value : this.quiz,
        infoQuiz: infoQuiz.present ? infoQuiz.value : this.infoQuiz,
        num2: num2.present ? num2.value : this.num2,
        answer: answer ?? this.answer,
        answerSelect: answerSelect ?? this.answerSelect,
      );
  @override
  String toString() {
    return (StringBuffer('QuizTestLocalEntityData(')
          ..write('id: $id, ')
          ..write('preTestId: $preTestId, ')
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
  int get hashCode => Object.hash(
      id, preTestId, num1, quiz, infoQuiz, num2, answer, answerSelect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizTestLocalEntityData &&
          other.id == this.id &&
          other.preTestId == this.preTestId &&
          other.num1 == this.num1 &&
          other.quiz == this.quiz &&
          other.infoQuiz == this.infoQuiz &&
          other.num2 == this.num2 &&
          other.answer == this.answer &&
          other.answerSelect == this.answerSelect);
}

class QuizTestLocalEntityCompanion
    extends UpdateCompanion<QuizTestLocalEntityData> {
  final Value<int> id;
  final Value<int> preTestId;
  final Value<String?> num1;
  final Value<String?> quiz;
  final Value<bool?> infoQuiz;
  final Value<String?> num2;
  final Value<String> answer;
  final Value<String> answerSelect;
  const QuizTestLocalEntityCompanion({
    this.id = const Value.absent(),
    this.preTestId = const Value.absent(),
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    this.num2 = const Value.absent(),
    this.answer = const Value.absent(),
    this.answerSelect = const Value.absent(),
  });
  QuizTestLocalEntityCompanion.insert({
    this.id = const Value.absent(),
    required int preTestId,
    this.num1 = const Value.absent(),
    this.quiz = const Value.absent(),
    this.infoQuiz = const Value.absent(),
    this.num2 = const Value.absent(),
    required String answer,
    required String answerSelect,
  })  : preTestId = Value(preTestId),
        answer = Value(answer),
        answerSelect = Value(answerSelect);
  static Insertable<QuizTestLocalEntityData> custom({
    Expression<int>? id,
    Expression<int>? preTestId,
    Expression<String>? num1,
    Expression<String>? quiz,
    Expression<bool>? infoQuiz,
    Expression<String>? num2,
    Expression<String>? answer,
    Expression<String>? answerSelect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preTestId != null) 'preTestId': preTestId,
      if (num1 != null) 'num1': num1,
      if (quiz != null) 'quiz': quiz,
      if (infoQuiz != null) 'infoQuiz': infoQuiz,
      if (num2 != null) 'num2': num2,
      if (answer != null) 'answer': answer,
      if (answerSelect != null) 'answerSelect': answerSelect,
    });
  }

  QuizTestLocalEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? preTestId,
      Value<String?>? num1,
      Value<String?>? quiz,
      Value<bool?>? infoQuiz,
      Value<String?>? num2,
      Value<String>? answer,
      Value<String>? answerSelect}) {
    return QuizTestLocalEntityCompanion(
      id: id ?? this.id,
      preTestId: preTestId ?? this.preTestId,
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
    if (preTestId.present) {
      map['preTestId'] = Variable<int>(preTestId.value);
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
    return (StringBuffer('QuizTestLocalEntityCompanion(')
          ..write('id: $id, ')
          ..write('preTestId: $preTestId, ')
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

class $LocalNotifyEntityTable extends LocalNotifyEntity
    with TableInfo<$LocalNotifyEntityTable, LocalNotifyEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalNotifyEntityTable(this.attachedDatabase, [this._alias]);
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
  String get aliasedName => _alias ?? 'local_notify_entity';
  @override
  String get actualTableName => 'local_notify_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalNotifyEntityData> instance,
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
  LocalNotifyEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalNotifyEntityData(
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
  $LocalNotifyEntityTable createAlias(String alias) {
    return $LocalNotifyEntityTable(attachedDatabase, alias);
  }
}

class LocalNotifyEntityData extends DataClass
    implements Insertable<LocalNotifyEntityData> {
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
  const LocalNotifyEntityData(
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

  LocalNotifyEntityCompanion toCompanion(bool nullToAbsent) {
    return LocalNotifyEntityCompanion(
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

  factory LocalNotifyEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalNotifyEntityData(
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

  LocalNotifyEntityData copyWith(
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
      LocalNotifyEntityData(
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
    return (StringBuffer('LocalNotifyEntityData(')
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
      (other is LocalNotifyEntityData &&
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

class LocalNotifyEntityCompanion
    extends UpdateCompanion<LocalNotifyEntityData> {
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
  const LocalNotifyEntityCompanion({
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
  LocalNotifyEntityCompanion.insert({
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
  static Insertable<LocalNotifyEntityData> custom({
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

  LocalNotifyEntityCompanion copyWith(
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
    return LocalNotifyEntityCompanion(
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
    return (StringBuffer('LocalNotifyEntityCompanion(')
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
  static const VerificationMeta _participateMeta =
      const VerificationMeta('participate');
  @override
  late final GeneratedColumn<int> participate = GeneratedColumn<int>(
      'participate', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, imageUser, score, participate];
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
    if (data.containsKey('participate')) {
      context.handle(
          _participateMeta,
          participate.isAcceptableOrUnknown(
              data['participate']!, _participateMeta));
    } else if (isInserting) {
      context.missing(_participateMeta);
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
      participate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}participate'])!,
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
  final int participate;
  const PlayerLocalEntityData(
      {required this.id,
      required this.name,
      required this.imageUser,
      this.score,
      required this.participate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['imageUser'] = Variable<String>(imageUser);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<double>(score);
    }
    map['participate'] = Variable<int>(participate);
    return map;
  }

  PlayerLocalEntityCompanion toCompanion(bool nullToAbsent) {
    return PlayerLocalEntityCompanion(
      id: Value(id),
      name: Value(name),
      imageUser: Value(imageUser),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
      participate: Value(participate),
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
      participate: serializer.fromJson<int>(json['participate']),
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
      'participate': serializer.toJson<int>(participate),
    };
  }

  PlayerLocalEntityData copyWith(
          {int? id,
          String? name,
          String? imageUser,
          Value<double?> score = const Value.absent(),
          int? participate}) =>
      PlayerLocalEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUser: imageUser ?? this.imageUser,
        score: score.present ? score.value : this.score,
        participate: participate ?? this.participate,
      );
  @override
  String toString() {
    return (StringBuffer('PlayerLocalEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUser: $imageUser, ')
          ..write('score: $score, ')
          ..write('participate: $participate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imageUser, score, participate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerLocalEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUser == this.imageUser &&
          other.score == this.score &&
          other.participate == this.participate);
}

class PlayerLocalEntityCompanion
    extends UpdateCompanion<PlayerLocalEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> imageUser;
  final Value<double?> score;
  final Value<int> participate;
  const PlayerLocalEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUser = const Value.absent(),
    this.score = const Value.absent(),
    this.participate = const Value.absent(),
  });
  PlayerLocalEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String imageUser,
    this.score = const Value.absent(),
    required int participate,
  })  : name = Value(name),
        imageUser = Value(imageUser),
        participate = Value(participate);
  static Insertable<PlayerLocalEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imageUser,
    Expression<double>? score,
    Expression<int>? participate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUser != null) 'imageUser': imageUser,
      if (score != null) 'score': score,
      if (participate != null) 'participate': participate,
    });
  }

  PlayerLocalEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? imageUser,
      Value<double?>? score,
      Value<int>? participate}) {
    return PlayerLocalEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUser: imageUser ?? this.imageUser,
      score: score ?? this.score,
      participate: participate ?? this.participate,
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
    if (participate.present) {
      map['participate'] = Variable<int>(participate.value);
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
          ..write('participate: $participate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $PrePraLocalEntityTable prePraLocalEntity =
      $PrePraLocalEntityTable(this);
  late final $PreTestLocalEntityTable preTestLocalEntity =
      $PreTestLocalEntityTable(this);
  late final $QuizPraLocalEntityTable quizPraLocalEntity =
      $QuizPraLocalEntityTable(this);
  late final $QuizTestLocalEntityTable quizTestLocalEntity =
      $QuizTestLocalEntityTable(this);
  late final $LocalNotifyEntityTable localNotifyEntity =
      $LocalNotifyEntityTable(this);
  late final $PlayerLocalEntityTable playerLocalEntity =
      $PlayerLocalEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        prePraLocalEntity,
        preTestLocalEntity,
        quizPraLocalEntity,
        quizTestLocalEntity,
        localNotifyEntity,
        playerLocalEntity
      ];
}
