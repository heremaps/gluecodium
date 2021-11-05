import 'package:library/src/smoke/child_class_from_class.dart';
import 'package:library/src/smoke/child_class_from_interface.dart';
import 'package:library/src/smoke/child_class_with_imports.dart';
import 'package:library/src/smoke/child_class_with_lambda.dart';
import 'package:library/src/smoke/child_interface.dart';
import 'package:library/src/smoke/child_with_parent_class_references.dart';
import 'package:library/src/smoke/grand_child_interface.dart';
import 'package:library/src/smoke/interface_with_lambda.dart';
import 'package:library/src/smoke/internal_child.dart';
import 'package:library/src/smoke/internal_parent.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'package:library/src/smoke/parent_class_with_imports.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'package:library/src/smoke/parent_with_class_references.dart';
final Map<String, Function> typeRepository = {
  "smoke_ChildClassFromClass": (handle) => ChildClassFromClass$Impl(handle),
  "smoke_ChildClassFromInterface": (handle) => ChildClassFromInterface$Impl(handle),
  "smoke_ChildClassWithImports": (handle) => ChildClassWithImports$Impl(handle),
  "smoke_ChildClassWithLambda": (handle) => ChildClassWithLambda$Impl(handle),
  "smoke_ChildInterface": (handle) => ChildInterface$Impl(handle),
  "smoke_ChildWithParentClassReferences": (handle) => ChildWithParentClassReferences$Impl(handle),
  "smoke_GrandChildInterface": (handle) => GrandChildInterface$Impl(handle),
  "smoke_InterfaceWithLambda": (handle) => InterfaceWithLambda$Impl(handle),
  "smoke_InternalChild": (handle) => InternalChild$Impl(handle),
  "smoke_InternalParent": (handle) => InternalParent$Impl(handle),
  "smoke_ParentClass": (handle) => ParentClass$Impl(handle),
  "smoke_ParentClassWithImports": (handle) => ParentClassWithImports$Impl(handle),
  "smoke_ParentInterface": (handle) => ParentInterface$Impl(handle),
  "smoke_ParentWithClassReferences": (handle) => ParentWithClassReferences$Impl(handle),
 };
