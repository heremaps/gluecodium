import 'dart:ffi';
import 'dart:math';
class _LazyIterator<E> extends Iterator<E> {
  final List<E> list;
  final int step;
  final int length;
  int position;
  _LazyIterator(this.list, [int start = -1, int step = 1])
    : step = step, length = list.length, position = start;
  bool moveNext() {
    position += step;
    return position >= 0 && position < length;
  }
  E get current => list[position];
}
/// @nodoc
class LazyList<E> extends Iterable<E> implements List<E> {
  static final _cannotModify = "Cannot modify an unmodifiable list";
  final Pointer<Void> handle;
  final int _length;
  final E Function(int) _elementGetter;
  LazyList(this.handle, int length, this._elementGetter, void registerFinalizer(Object))
    : _length = length {
    registerFinalizer(this);
  }
  Iterator<E> get iterator => _LazyIterator(this);
  int get length => _length;
  E operator [](int index) => _elementGetter(index);
  List<R> cast<R>() => List.castFrom<E, R>(this);
  // Methods redirected to cast<E>()
  List<E> operator +(List<E> other) => cast<E>() + other;
  Map<int, E> asMap() => cast<E>().asMap();
  Iterable<E> getRange(int start, int end) => cast<E>().getRange(start, end);
  List<E> sublist(int start, [int? end]) => cast<E>().sublist(start, end);
  Iterable<E> get reversed => cast<E>().reversed;
  // Methods relying on the iterator
  int indexOf(E element, [int start = 0]) => indexWhere((it) => element == it, start);
  int indexWhere(bool test(E element), [int start = 0]) {
    final iterator = _LazyIterator(this, start - 1, 1);
    while (iterator.moveNext()) {
      if (test(iterator.current)) return iterator.position;
    }
    return -1;
  }
  int lastIndexOf(E element, [int? start]) => lastIndexWhere((it) => element == it, start);
  int lastIndexWhere(bool test(E element), [int? start]) {
    final iterator = _LazyIterator(this, start ?? length, -1);
    while (iterator.moveNext()) {
      if (test(iterator.current)) return iterator.position;
    }
    return -1;
  }
  // Unsupported methods
  void operator []=(int index, E value) => throw UnsupportedError(_cannotModify);
  void add(E value) => throw UnsupportedError(_cannotModify);
  void addAll(Iterable<E> iterable) => throw UnsupportedError(_cannotModify);
  void clear() => throw UnsupportedError(_cannotModify);
  void fillRange(int start, int end, [E? fillValue]) => throw UnsupportedError(_cannotModify);
  void insert(int index, E element) => throw UnsupportedError(_cannotModify);
  void insertAll(int index, Iterable<E> iterable) => throw UnsupportedError(_cannotModify);
  bool remove(Object? value) => throw UnsupportedError(_cannotModify);
  E removeAt(int index) => throw UnsupportedError(_cannotModify);
  E removeLast() => throw UnsupportedError(_cannotModify);
  void removeRange(int start, int end) => throw UnsupportedError(_cannotModify);
  void removeWhere(bool test(E element)) => throw UnsupportedError(_cannotModify);
  void replaceRange(int start, int end, Iterable<E> replacements) => throw UnsupportedError(_cannotModify);
  void retainWhere(bool test(E element)) => throw UnsupportedError(_cannotModify);
  void setAll(int index, Iterable<E> iterable) => throw UnsupportedError(_cannotModify);
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) => throw UnsupportedError(_cannotModify);
  void shuffle([Random? random]) => throw UnsupportedError(_cannotModify);
  void sort([int compare(E a, E b)?]) => throw UnsupportedError(_cannotModify);
  set first(E value) => throw UnsupportedError(_cannotModify);
  set last(E value) => throw UnsupportedError(_cannotModify);
  set length(int newLength) => throw UnsupportedError(_cannotModify);
}
