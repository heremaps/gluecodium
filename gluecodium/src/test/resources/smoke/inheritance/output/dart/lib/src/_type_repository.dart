import 'package:library/src/smoke/child_class_from_class.dart';
import 'package:library/src/smoke/child_class_from_interface.dart';
import 'package:library/src/smoke/child_interface.dart';
import 'package:library/src/smoke/child_with_parent_class_references.dart';
import 'package:library/src/smoke/internal_child.dart';
import 'package:library/src/smoke/internal_parent.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'package:library/src/smoke/parent_with_class_references.dart';
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
