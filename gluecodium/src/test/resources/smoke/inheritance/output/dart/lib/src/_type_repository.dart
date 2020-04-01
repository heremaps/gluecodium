import 'package:library/src/smoke/ChildClassFromClass.dart';
import 'package:library/src/smoke/ChildClassFromInterface.dart';
import 'package:library/src/smoke/ChildInterface.dart';
import 'package:library/src/smoke/ChildWithParentClassReferences.dart';
import 'package:library/src/smoke/InternalChild.dart';
import 'package:library/src/smoke/InternalParent.dart';
import 'package:library/src/smoke/ParentClass.dart';
import 'package:library/src/smoke/ParentInterface.dart';
import 'package:library/src/smoke/ParentWithClassReferences.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
final Map<String, Function> typeRepository = {
  "smoke_ParentInterface": (handle) => ParentInterface$Impl(handle),
  "smoke_ChildInterface": (handle) => ChildInterface$Impl(handle),
  "smoke_ChildClassFromInterface": (handle) => ChildClassFromInterface$Impl(handle),
  "smoke_ParentClass": (handle) => ParentClass$Impl(handle),
  "smoke_ChildClassFromClass": (handle) => ChildClassFromClass$Impl(handle),
  "smoke_InternalParent": (handle) => InternalParent$Impl(handle),
  "smoke_InternalChild": (handle) => InternalChild$Impl(handle),
  "smoke_ParentWithClassReferences": (handle) => ParentWithClassReferences$Impl(handle),
  "smoke_ChildWithParentClassReferences": (handle) => ChildWithParentClassReferences$Impl(handle),
 };
