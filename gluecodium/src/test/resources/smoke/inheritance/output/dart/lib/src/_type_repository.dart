import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/smoke/ChildClassFromClass.dart';
import 'package:library/src/smoke/ChildClassFromInterface.dart';
import 'package:library/src/smoke/ChildInterface.dart';
import 'package:library/src/smoke/InternalChild.dart';
import 'package:library/src/smoke/InternalParent.dart';
import 'package:library/src/smoke/ParentClass.dart';
import 'package:library/src/smoke/ParentInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
final Map<String, Function> typeRepository = {
  "smoke_ParentInterface": (handle) => ParentInterface__Impl(handle),
  "smoke_ChildInterface": (handle) => ChildInterface__Impl(handle),
  "smoke_ChildClassFromInterface": (handle) => ChildClassFromInterface__Factory.create(handle),
  "smoke_ParentClass": (handle) => ParentClass(handle),
  "smoke_ChildClassFromClass": (handle) => ChildClassFromClass__Factory.create(handle),
  "smoke_InternalParent": (handle) => InternalParent(handle),
  "smoke_InternalChild": (handle) => InternalChild__Factory.create(handle),
 };
