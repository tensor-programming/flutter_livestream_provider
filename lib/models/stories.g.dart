// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Stories> _$storiesSerializer = new _$StoriesSerializer();

class _$StoriesSerializer implements StructuredSerializer<Stories> {
  @override
  final Iterable<Type> types = const [Stories, _$Stories];
  @override
  final String wireName = 'Stories';

  @override
  Iterable serialize(Serializers serializers, Stories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'kids',
      serializers.serialize(object.kids,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'parts',
      serializers.serialize(object.parts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
    if (object.deleted != null) {
      result
        ..add('deleted')
        ..add(serializers.serialize(object.deleted,
            specifiedType: const FullType(bool)));
    }
    if (object.by != null) {
      result
        ..add('by')
        ..add(serializers.serialize(object.by,
            specifiedType: const FullType(String)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(int)));
    }
    if (object.dead != null) {
      result
        ..add('dead')
        ..add(serializers.serialize(object.dead,
            specifiedType: const FullType(bool)));
    }
    if (object.parent != null) {
      result
        ..add('parent')
        ..add(serializers.serialize(object.parent,
            specifiedType: const FullType(int)));
    }
    if (object.poll != null) {
      result
        ..add('poll')
        ..add(serializers.serialize(object.poll,
            specifiedType: const FullType(int)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.descendants != null) {
      result
        ..add('descendants')
        ..add(serializers.serialize(object.descendants,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Stories deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deleted':
          result.deleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dead':
          result.dead = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'parent':
          result.parent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'poll':
          result.poll = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'kids':
          result.kids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parts':
          result.parts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'descendants':
          result.descendants = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Stories extends Stories {
  @override
  final int id;
  @override
  final bool deleted;
  @override
  final String type;
  @override
  final String by;
  @override
  final int time;
  @override
  final bool dead;
  @override
  final int parent;
  @override
  final int poll;
  @override
  final BuiltList<int> kids;
  @override
  final String url;
  @override
  final String title;
  @override
  final BuiltList<int> parts;
  @override
  final int descendants;

  factory _$Stories([void Function(StoriesBuilder) updates]) =>
      (new StoriesBuilder()..update(updates)).build();

  _$Stories._(
      {this.id,
      this.deleted,
      this.type,
      this.by,
      this.time,
      this.dead,
      this.parent,
      this.poll,
      this.kids,
      this.url,
      this.title,
      this.parts,
      this.descendants})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Stories', 'id');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Stories', 'type');
    }
    if (kids == null) {
      throw new BuiltValueNullFieldError('Stories', 'kids');
    }
    if (parts == null) {
      throw new BuiltValueNullFieldError('Stories', 'parts');
    }
  }

  @override
  Stories rebuild(void Function(StoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoriesBuilder toBuilder() => new StoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stories &&
        id == other.id &&
        deleted == other.deleted &&
        type == other.type &&
        by == other.by &&
        time == other.time &&
        dead == other.dead &&
        parent == other.parent &&
        poll == other.poll &&
        kids == other.kids &&
        url == other.url &&
        title == other.title &&
        parts == other.parts &&
        descendants == other.descendants;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    deleted.hashCode),
                                                type.hashCode),
                                            by.hashCode),
                                        time.hashCode),
                                    dead.hashCode),
                                parent.hashCode),
                            poll.hashCode),
                        kids.hashCode),
                    url.hashCode),
                title.hashCode),
            parts.hashCode),
        descendants.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Stories')
          ..add('id', id)
          ..add('deleted', deleted)
          ..add('type', type)
          ..add('by', by)
          ..add('time', time)
          ..add('dead', dead)
          ..add('parent', parent)
          ..add('poll', poll)
          ..add('kids', kids)
          ..add('url', url)
          ..add('title', title)
          ..add('parts', parts)
          ..add('descendants', descendants))
        .toString();
  }
}

class StoriesBuilder implements Builder<Stories, StoriesBuilder> {
  _$Stories _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _deleted;
  bool get deleted => _$this._deleted;
  set deleted(bool deleted) => _$this._deleted = deleted;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _by;
  String get by => _$this._by;
  set by(String by) => _$this._by = by;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  bool _dead;
  bool get dead => _$this._dead;
  set dead(bool dead) => _$this._dead = dead;

  int _parent;
  int get parent => _$this._parent;
  set parent(int parent) => _$this._parent = parent;

  int _poll;
  int get poll => _$this._poll;
  set poll(int poll) => _$this._poll = poll;

  ListBuilder<int> _kids;
  ListBuilder<int> get kids => _$this._kids ??= new ListBuilder<int>();
  set kids(ListBuilder<int> kids) => _$this._kids = kids;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<int> _parts;
  ListBuilder<int> get parts => _$this._parts ??= new ListBuilder<int>();
  set parts(ListBuilder<int> parts) => _$this._parts = parts;

  int _descendants;
  int get descendants => _$this._descendants;
  set descendants(int descendants) => _$this._descendants = descendants;

  StoriesBuilder();

  StoriesBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _deleted = _$v.deleted;
      _type = _$v.type;
      _by = _$v.by;
      _time = _$v.time;
      _dead = _$v.dead;
      _parent = _$v.parent;
      _poll = _$v.poll;
      _kids = _$v.kids?.toBuilder();
      _url = _$v.url;
      _title = _$v.title;
      _parts = _$v.parts?.toBuilder();
      _descendants = _$v.descendants;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Stories other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Stories;
  }

  @override
  void update(void Function(StoriesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Stories build() {
    _$Stories _$result;
    try {
      _$result = _$v ??
          new _$Stories._(
              id: id,
              deleted: deleted,
              type: type,
              by: by,
              time: time,
              dead: dead,
              parent: parent,
              poll: poll,
              kids: kids.build(),
              url: url,
              title: title,
              parts: parts.build(),
              descendants: descendants);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'kids';
        kids.build();

        _$failedField = 'parts';
        parts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Stories', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
