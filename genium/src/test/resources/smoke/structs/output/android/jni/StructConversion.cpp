#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
namespace genium
{
namespace jni
{
::fire::SomeVeryExternalStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalStruct* dummy)
{
    ::fire::SomeVeryExternalStruct _nout{};
    int8_t n_intField = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "intField",
        (int8_t*)nullptr );
    _nout.intField = n_intField;
    return _nout;
}
::genium::optional<::fire::SomeVeryExternalStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::fire::SomeVeryExternalStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::fire::SomeVeryExternalStruct>(convert_from_jni(_jenv, _jinput, (::fire::SomeVeryExternalStruct*)nullptr))
        : ::genium::optional<::fire::SomeVeryExternalStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$AnotherExternalStruct", ::fire::SomeVeryExternalStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::fire::SomeVeryExternalStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jintField = _ninput.intField;
    ::genium::jni::set_field_value(_jenv, _jresult, "intField", jintField);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::fire::SomeVeryExternalStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::fire::StructsQualifiedType::QualifiedType
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::StructsQualifiedType::QualifiedType* dummy)
{
    ::fire::StructsQualifiedType::QualifiedType _nout{};
    ::smoke::Point n_type_collection_point = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "typeCollectionPoint",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.type_collection_point = n_type_collection_point;
    ::smoke::Structs::Point n_interface_point = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "interfacePoint",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    _nout.interface_point = n_interface_point;
    ::fire::StructsQualifiedType::TypeCollectionPointsArray n_type_collection_explicit_points = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "typeCollectionExplicitPoints",
        "Ljava/util/List;"),
        (::fire::StructsQualifiedType::TypeCollectionPointsArray*)nullptr );
    _nout.type_collection_explicit_points = n_type_collection_explicit_points;
    ::fire::StructsQualifiedType::InterfacePointsArray n_interface_explicit_points = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "interfaceExplicitPoints",
        "Ljava/util/List;"),
        (::fire::StructsQualifiedType::InterfacePointsArray*)nullptr );
    _nout.interface_explicit_points = n_interface_explicit_points;
    ::std::vector< ::smoke::Point > n_type_collection_implicit_points = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "typeCollectionImplicitPoints",
        "Ljava/util/List;"),
        (::std::vector< ::smoke::Point >*)nullptr );
    _nout.type_collection_implicit_points = n_type_collection_implicit_points;
    ::std::vector< ::smoke::Structs::Point > n_interface_implicit_points = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "interfaceImplicitPoints",
        "Ljava/util/List;"),
        (::std::vector< ::smoke::Structs::Point >*)nullptr );
    _nout.interface_implicit_points = n_interface_implicit_points;
    ::std::shared_ptr< ::smoke::StructsInstance > n_structs_instance = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "structsInstance",
        "Lcom/example/smoke/StructsInstance;"),
        (::std::shared_ptr< ::smoke::StructsInstance >*)nullptr );
    _nout.structs_instance = n_structs_instance;
    return _nout;
}
::genium::optional<::fire::StructsQualifiedType::QualifiedType>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::fire::StructsQualifiedType::QualifiedType>* dummy)
{
    return _jinput
        ? ::genium::optional<::fire::StructsQualifiedType::QualifiedType>(convert_from_jni(_jenv, _jinput, (::fire::StructsQualifiedType::QualifiedType*)nullptr))
        : ::genium::optional<::fire::StructsQualifiedType::QualifiedType>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/fire/StructsQualifiedType$QualifiedType", ::fire::StructsQualifiedType::QualifiedType)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput)
{
    auto& javaClass = CachedJavaClass<::fire::StructsQualifiedType::QualifiedType>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jtype_collection_point = convert_to_jni(_jenv, _ninput.type_collection_point);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "typeCollectionPoint",
        "Lcom/example/smoke/Point;", jtype_collection_point);
    auto jinterface_point = convert_to_jni(_jenv, _ninput.interface_point);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "interfacePoint",
        "Lcom/example/smoke/Structs$Point;", jinterface_point);
    auto jtype_collection_explicit_points = convert_to_jni(_jenv, _ninput.type_collection_explicit_points);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "typeCollectionExplicitPoints",
        "Ljava/util/List;", jtype_collection_explicit_points);
    auto jinterface_explicit_points = convert_to_jni(_jenv, _ninput.interface_explicit_points);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "interfaceExplicitPoints",
        "Ljava/util/List;", jinterface_explicit_points);
    auto jtype_collection_implicit_points = convert_to_jni(_jenv, _ninput.type_collection_implicit_points);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "typeCollectionImplicitPoints",
        "Ljava/util/List;", jtype_collection_implicit_points);
    auto jinterface_implicit_points = convert_to_jni(_jenv, _ninput.interface_implicit_points);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "interfaceImplicitPoints",
        "Ljava/util/List;", jinterface_implicit_points);
    auto jstructs_instance = convert_to_jni(_jenv, _ninput.structs_instance);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "structsInstance",
        "Lcom/example/smoke/StructsInstance;", jstructs_instance);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::fire::StructsQualifiedType::QualifiedType> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::AllTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::AllTypesStruct* dummy)
{
    ::smoke::AllTypesStruct _nout{};
    int8_t n_int8_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int8Field",
        (int8_t*)nullptr );
    _nout.int8_field = n_int8_field;
    uint8_t n_uint8_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint8Field",
        (uint8_t*)nullptr );
    _nout.uint8_field = n_uint8_field;
    int16_t n_int16_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int16Field",
        (int16_t*)nullptr );
    _nout.int16_field = n_int16_field;
    uint16_t n_uint16_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint16Field",
        (uint16_t*)nullptr );
    _nout.uint16_field = n_uint16_field;
    int32_t n_int32_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int32Field",
        (int32_t*)nullptr );
    _nout.int32_field = n_int32_field;
    uint32_t n_uint32_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint32Field",
        (uint32_t*)nullptr );
    _nout.uint32_field = n_uint32_field;
    int64_t n_int64_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int64Field",
        (int64_t*)nullptr );
    _nout.int64_field = n_int64_field;
    uint64_t n_uint64_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint64Field",
        (uint64_t*)nullptr );
    _nout.uint64_field = n_uint64_field;
    float n_float_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "floatField",
        (float*)nullptr );
    _nout.float_field = n_float_field;
    double n_double_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "doubleField",
        (double*)nullptr );
    _nout.double_field = n_double_field;
    ::std::string n_string_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.string_field = n_string_field;
    bool n_boolean_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "booleanField",
        (bool*)nullptr );
    _nout.boolean_field = n_boolean_field;
    ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "bytesField",
        (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr );
    _nout.bytes_field = n_bytes_field;
    ::smoke::Point n_point_field = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "pointField",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.point_field = n_point_field;
    return _nout;
}
::genium::optional<::smoke::AllTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::AllTypesStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::AllTypesStruct>(convert_from_jni(_jenv, _jinput, (::smoke::AllTypesStruct*)nullptr))
        : ::genium::optional<::smoke::AllTypesStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/AllTypesStruct", ::smoke::AllTypesStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::AllTypesStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jint8_field = _ninput.int8_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int8Field", jint8_field);
    auto juint8_field = _ninput.uint8_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint8Field", juint8_field);
    auto jint16_field = _ninput.int16_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int16Field", jint16_field);
    auto juint16_field = _ninput.uint16_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint16Field", juint16_field);
    auto jint32_field = _ninput.int32_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int32Field", jint32_field);
    auto juint32_field = _ninput.uint32_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint32Field", juint32_field);
    auto jint64_field = _ninput.int64_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int64Field", jint64_field);
    auto juint64_field = _ninput.uint64_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint64Field", juint64_field);
    auto jfloat_field = _ninput.float_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "floatField", jfloat_field);
    auto jdouble_field = _ninput.double_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "doubleField", jdouble_field);
    auto jstring_field = _ninput.string_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    auto jboolean_field = _ninput.boolean_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "booleanField", jboolean_field);
    auto jbytes_field = _ninput.bytes_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "bytesField", jbytes_field);
    auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "pointField",
        "Lcom/example/smoke/Point;", jpoint_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::AllTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Line
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Line* dummy)
{
    ::smoke::Line _nout{};
    ::smoke::Point n_a = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "a",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.a = n_a;
    ::smoke::Point n_b = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "b",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.b = n_b;
    return _nout;
}
::genium::optional<::smoke::Line>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Line>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Line>(convert_from_jni(_jenv, _jinput, (::smoke::Line*)nullptr))
        : ::genium::optional<::smoke::Line>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Line", ::smoke::Line)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Line>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto ja = convert_to_jni(_jenv, _ninput.a);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "a",
        "Lcom/example/smoke/Point;", ja);
    auto jb = convert_to_jni(_jenv, _ninput.b);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "b",
        "Lcom/example/smoke/Point;", jb);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Line> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Point
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Point* dummy)
{
    ::smoke::Point _nout{};
    double n_x = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "x",
        (double*)nullptr );
    _nout.x = n_x;
    double n_y = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "y",
        (double*)nullptr );
    _nout.y = n_y;
    return _nout;
}
::genium::optional<::smoke::Point>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Point>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Point>(convert_from_jni(_jenv, _jinput, (::smoke::Point*)nullptr))
        : ::genium::optional<::smoke::Point>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Point", ::smoke::Point)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Point>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jx = _ninput.x;
    ::genium::jni::set_field_value(_jenv, _jresult, "x", jx);
    auto jy = _ninput.y;
    ::genium::jni::set_field_value(_jenv, _jresult, "y", jy);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Point> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Route
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Route* dummy)
{
    ::smoke::Route _nout{};
    ::std::string n_description = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "description",
        (::std::string*)nullptr );
    _nout.description = n_description;
    ::smoke::RouteType n_type = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "type",
        "Lcom/example/smoke/RouteType;"),
        (::smoke::RouteType*)nullptr );
    _nout.type = n_type;
    return _nout;
}
::genium::optional<::smoke::Route>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Route>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Route>(convert_from_jni(_jenv, _jinput, (::smoke::Route*)nullptr))
        : ::genium::optional<::smoke::Route>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Route", ::smoke::Route)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Route& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Route>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jdescription = _ninput.description;
    ::genium::jni::set_field_value(_jenv, _jresult, "description", jdescription);
    auto jtype = convert_to_jni(_jenv, _ninput.type);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "type",
        "Lcom/example/smoke/RouteType;", jtype);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Route> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::AllTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct* dummy)
{
    int8_t n_int8_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int8Field",
        (int8_t*)nullptr );
    uint8_t n_uint8_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint8Field",
        (uint8_t*)nullptr );
    int16_t n_int16_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int16Field",
        (int16_t*)nullptr );
    uint16_t n_uint16_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint16Field",
        (uint16_t*)nullptr );
    int32_t n_int32_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int32Field",
        (int32_t*)nullptr );
    uint32_t n_uint32_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint32Field",
        (uint32_t*)nullptr );
    int64_t n_int64_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "int64Field",
        (int64_t*)nullptr );
    uint64_t n_uint64_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "uint64Field",
        (uint64_t*)nullptr );
    float n_float_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "floatField",
        (float*)nullptr );
    double n_double_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "doubleField",
        (double*)nullptr );
    ::std::string n_string_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    bool n_boolean_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "booleanField",
        (bool*)nullptr );
    ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "bytesField",
        (::std::shared_ptr< ::std::vector< uint8_t > >*)nullptr );
    ::smoke::Structs::Point n_point_field = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "pointField",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    return ::smoke::Structs::AllTypesStruct(std::move(n_int8_field), std::move(n_uint8_field), std::move(n_int16_field), std::move(n_uint16_field), std::move(n_int32_field), std::move(n_uint32_field), std::move(n_int64_field), std::move(n_uint64_field), std::move(n_float_field), std::move(n_double_field), std::move(n_string_field), std::move(n_boolean_field), std::move(n_bytes_field), std::move(n_point_field));
}
::genium::optional<::smoke::Structs::AllTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::AllTypesStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::AllTypesStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::AllTypesStruct*)nullptr))
        : ::genium::optional<::smoke::Structs::AllTypesStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$AllTypesStruct", ::smoke::Structs::AllTypesStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::AllTypesStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jint8_field = _ninput.int8_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int8Field", jint8_field);
    auto juint8_field = _ninput.uint8_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint8Field", juint8_field);
    auto jint16_field = _ninput.int16_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int16Field", jint16_field);
    auto juint16_field = _ninput.uint16_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint16Field", juint16_field);
    auto jint32_field = _ninput.int32_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int32Field", jint32_field);
    auto juint32_field = _ninput.uint32_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint32Field", juint32_field);
    auto jint64_field = _ninput.int64_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "int64Field", jint64_field);
    auto juint64_field = _ninput.uint64_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "uint64Field", juint64_field);
    auto jfloat_field = _ninput.float_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "floatField", jfloat_field);
    auto jdouble_field = _ninput.double_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "doubleField", jdouble_field);
    auto jstring_field = _ninput.string_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    auto jboolean_field = _ninput.boolean_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "booleanField", jboolean_field);
    auto jbytes_field = _ninput.bytes_field;
    ::genium::jni::set_field_value(_jenv, _jresult, "bytesField", jbytes_field);
    auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "pointField",
        "Lcom/example/smoke/Structs$Point;", jpoint_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::AllTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::DoubleNestingImmutableStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::DoubleNestingImmutableStruct* dummy)
{
    ::smoke::Structs::NestingImmutableStruct n_nesting_struct_field = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "nestingStructField",
        "Lcom/example/smoke/Structs$NestingImmutableStruct;"),
        (::smoke::Structs::NestingImmutableStruct*)nullptr );
    return ::smoke::Structs::DoubleNestingImmutableStruct(std::move(n_nesting_struct_field));
}
::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::DoubleNestingImmutableStruct*)nullptr))
        : ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$DoubleNestingImmutableStruct", ::smoke::Structs::DoubleNestingImmutableStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::DoubleNestingImmutableStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::DoubleNestingImmutableStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jnesting_struct_field = convert_to_jni(_jenv, _ninput.nesting_struct_field);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "nestingStructField",
        "Lcom/example/smoke/Structs$NestingImmutableStruct;", jnesting_struct_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::DoubleNestingImmutableStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::ExternalStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ExternalStruct* dummy)
{
    ::smoke::Structs::ExternalStruct _nout{};
    ::std::string n_stringField = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.stringField = n_stringField;
    ::std::string n_externalStringField = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "externalStringField",
        (::std::string*)nullptr );
    _nout.set_some_string(n_externalStringField);
    ::std::vector< int8_t > n_externalArrayField = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "externalArrayField",
        "Ljava/util/List;"),
        (::std::vector< int8_t >*)nullptr );
    _nout.set_some_array(n_externalArrayField);
    ::fire::SomeVeryExternalStruct n_externalStructField = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "externalStructField",
        "Lcom/example/smoke/Structs$AnotherExternalStruct;"),
        (::fire::SomeVeryExternalStruct*)nullptr );
    _nout.set_some_struct(n_externalStructField);
    return _nout;
}
::genium::optional<::smoke::Structs::ExternalStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::ExternalStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::ExternalStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::ExternalStruct*)nullptr))
        : ::genium::optional<::smoke::Structs::ExternalStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$ExternalStruct", ::smoke::Structs::ExternalStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::ExternalStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstringField = _ninput.stringField;
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstringField);
    auto jexternalStringField = _ninput.get_some_string();
    ::genium::jni::set_field_value(_jenv, _jresult, "externalStringField", jexternalStringField);
    auto jexternalArrayField = convert_to_jni(_jenv, _ninput.get_some_array());
    ::genium::jni::set_object_field_value(_jenv, _jresult, "externalArrayField",
        "Ljava/util/List;", jexternalArrayField);
    auto jexternalStructField = convert_to_jni(_jenv, _ninput.get_some_struct());
    ::genium::jni::set_object_field_value(_jenv, _jresult, "externalStructField",
        "Lcom/example/smoke/Structs$AnotherExternalStruct;", jexternalStructField);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::ExternalStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::ImmutableStructWithCppAccessors
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ImmutableStructWithCppAccessors* dummy)
{
    ::std::string n_string_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    return ::smoke::Structs::ImmutableStructWithCppAccessors(std::move(n_string_field));
}
::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::ImmutableStructWithCppAccessors*)nullptr))
        : ::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$ImmutableStructWithCppAccessors", ::smoke::Structs::ImmutableStructWithCppAccessors)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ImmutableStructWithCppAccessors& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::ImmutableStructWithCppAccessors>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstring_field = _ninput.get_string_field();
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::ImmutableStructWithCppAccessors> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::Line
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Line* dummy)
{
    ::smoke::Structs::Line _nout{};
    ::smoke::Structs::Point n_a = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "a",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    _nout.a = n_a;
    ::smoke::Structs::Point n_b = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "b",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    _nout.b = n_b;
    return _nout;
}
::genium::optional<::smoke::Structs::Line>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Line>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::Line>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::Line*)nullptr))
        : ::genium::optional<::smoke::Structs::Line>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$Line", ::smoke::Structs::Line)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::Line>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto ja = convert_to_jni(_jenv, _ninput.a);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "a",
        "Lcom/example/smoke/Structs$Point;", ja);
    auto jb = convert_to_jni(_jenv, _ninput.b);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "b",
        "Lcom/example/smoke/Structs$Point;", jb);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Line> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::MutableStructWithCppAccessors
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::MutableStructWithCppAccessors* dummy)
{
    ::smoke::Structs::MutableStructWithCppAccessors _nout{};
    ::std::string n_string_field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.set_string_field(n_string_field);
    return _nout;
}
::genium::optional<::smoke::Structs::MutableStructWithCppAccessors>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::MutableStructWithCppAccessors>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::MutableStructWithCppAccessors>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::MutableStructWithCppAccessors*)nullptr))
        : ::genium::optional<::smoke::Structs::MutableStructWithCppAccessors>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$MutableStructWithCppAccessors", ::smoke::Structs::MutableStructWithCppAccessors)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::MutableStructWithCppAccessors& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::MutableStructWithCppAccessors>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstring_field = _ninput.get_string_field();
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::MutableStructWithCppAccessors> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::NestingImmutableStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::NestingImmutableStruct* dummy)
{
    ::smoke::Structs::AllTypesStruct n_struct_field = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "structField",
        "Lcom/example/smoke/Structs$AllTypesStruct;"),
        (::smoke::Structs::AllTypesStruct*)nullptr );
    return ::smoke::Structs::NestingImmutableStruct(std::move(n_struct_field));
}
::genium::optional<::smoke::Structs::NestingImmutableStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::NestingImmutableStruct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::NestingImmutableStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::NestingImmutableStruct*)nullptr))
        : ::genium::optional<::smoke::Structs::NestingImmutableStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$NestingImmutableStruct", ::smoke::Structs::NestingImmutableStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::NestingImmutableStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::NestingImmutableStruct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstruct_field = convert_to_jni(_jenv, _ninput.struct_field);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "structField",
        "Lcom/example/smoke/Structs$AllTypesStruct;", jstruct_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::NestingImmutableStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::Point
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Point* dummy)
{
    ::smoke::Structs::Point _nout{};
    double n_x = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "x",
        (double*)nullptr );
    _nout.x = n_x;
    double n_y = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "y",
        (double*)nullptr );
    _nout.y = n_y;
    return _nout;
}
::genium::optional<::smoke::Structs::Point>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Point>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::Point>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::Point*)nullptr))
        : ::genium::optional<::smoke::Structs::Point>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$Point", ::smoke::Structs::Point)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::Point>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jx = _ninput.x;
    ::genium::jni::set_field_value(_jenv, _jresult, "x", jx);
    auto jy = _ninput.y;
    ::genium::jni::set_field_value(_jenv, _jresult, "y", jy);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Point> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::StructWithArrayOfImmutable
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::StructWithArrayOfImmutable* dummy)
{
    ::smoke::Structs::ArrayOfImmutable n_array_field = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "arrayField",
        "Ljava/util/List;"),
        (::smoke::Structs::ArrayOfImmutable*)nullptr );
    return ::smoke::Structs::StructWithArrayOfImmutable(std::move(n_array_field));
}
::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::StructWithArrayOfImmutable*)nullptr))
        : ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$StructWithArrayOfImmutable", ::smoke::Structs::StructWithArrayOfImmutable)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::StructWithArrayOfImmutable& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::StructWithArrayOfImmutable>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jarray_field = convert_to_jni(_jenv, _ninput.array_field);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "arrayField",
        "Ljava/util/List;", jarray_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::StructWithArrayOfImmutable> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::Yet_Another_External_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Yet_Another_External_Struct* dummy)
{
    ::smoke::Structs::Yet_Another_External_Struct _nout{};
    ::std::string n_string_Field = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "stringField",
        (::std::string*)nullptr );
    _nout.string_Field = n_string_Field;
    return _nout;
}
::genium::optional<::smoke::Structs::Yet_Another_External_Struct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Structs::Yet_Another_External_Struct>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Structs::Yet_Another_External_Struct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::Yet_Another_External_Struct*)nullptr))
        : ::genium::optional<::smoke::Structs::Yet_Another_External_Struct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Structs$YetAnotherExternalStruct", ::smoke::Structs::Yet_Another_External_Struct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Yet_Another_External_Struct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Structs::Yet_Another_External_Struct>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jstring_Field = _ninput.string_Field;
    ::genium::jni::set_field_value(_jenv, _jresult, "stringField", jstring_Field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Structs::Yet_Another_External_Struct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::StructsWithConstantsInterface::MultiRoute
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::StructsWithConstantsInterface::MultiRoute* dummy)
{
    ::smoke::StructsWithConstantsInterface::MultiRoute _nout{};
    ::std::vector< ::std::string > n_descriptions = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "descriptions",
        "Ljava/util/List;"),
        (::std::vector< ::std::string >*)nullptr );
    _nout.descriptions = n_descriptions;
    ::smoke::RouteType n_type = convert_from_jni(
        _jenv,
        ::genium::jni::get_object_field_value(
        _jenv,
        _jinput,
        "type",
        "Lcom/example/smoke/RouteType;"),
        (::smoke::RouteType*)nullptr );
    _nout.type = n_type;
    return _nout;
}
::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute>(convert_from_jni(_jenv, _jinput, (::smoke::StructsWithConstantsInterface::MultiRoute*)nullptr))
        : ::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/StructsWithConstantsInterface$MultiRoute", ::smoke::StructsWithConstantsInterface::MultiRoute)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::StructsWithConstantsInterface::MultiRoute& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::StructsWithConstantsInterface::MultiRoute>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jdescriptions = convert_to_jni(_jenv, _ninput.descriptions);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "descriptions",
        "Ljava/util/List;", jdescriptions);
    auto jtype = convert_to_jni(_jenv, _ninput.type);
    ::genium::jni::set_object_field_value(_jenv, _jresult, "type",
        "Lcom/example/smoke/RouteType;", jtype);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::StructsWithConstantsInterface::MultiRoute> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::StructsWithMethodsInterface::Vector3
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::StructsWithMethodsInterface::Vector3* dummy)
{
    ::smoke::StructsWithMethodsInterface::Vector3 _nout{};
    double n_x = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "x",
        (double*)nullptr );
    _nout.x = n_x;
    double n_y = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "y",
        (double*)nullptr );
    _nout.y = n_y;
    double n_z = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "z",
        (double*)nullptr );
    _nout.z = n_z;
    return _nout;
}
::genium::optional<::smoke::StructsWithMethodsInterface::Vector3>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::StructsWithMethodsInterface::Vector3>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::StructsWithMethodsInterface::Vector3>(convert_from_jni(_jenv, _jinput, (::smoke::StructsWithMethodsInterface::Vector3*)nullptr))
        : ::genium::optional<::smoke::StructsWithMethodsInterface::Vector3>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/StructsWithMethodsInterface$Vector3", ::smoke::StructsWithMethodsInterface::Vector3)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::StructsWithMethodsInterface::Vector3& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::StructsWithMethodsInterface::Vector3>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jx = _ninput.x;
    ::genium::jni::set_field_value(_jenv, _jresult, "x", jx);
    auto jy = _ninput.y;
    ::genium::jni::set_field_value(_jenv, _jresult, "y", jy);
    auto jz = _ninput.z;
    ::genium::jni::set_field_value(_jenv, _jresult, "z", jz);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::StructsWithMethodsInterface::Vector3> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Vector
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Vector* dummy)
{
    ::smoke::Vector _nout{};
    double n_x = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "x",
        (double*)nullptr );
    _nout.x = n_x;
    double n_y = ::genium::jni::get_field_value(
        _jenv,
        _jinput,
        "y",
        (double*)nullptr );
    _nout.y = n_y;
    return _nout;
}
::genium::optional<::smoke::Vector>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::genium::optional<::smoke::Vector>* dummy)
{
    return _jinput
        ? ::genium::optional<::smoke::Vector>(convert_from_jni(_jenv, _jinput, (::smoke::Vector*)nullptr))
        : ::genium::optional<::smoke::Vector>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/Vector", ::smoke::Vector)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Vector& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Vector>::java_class;
    auto _jresult = ::genium::jni::alloc_object(_jenv, javaClass);
    auto jx = _ninput.x;
    ::genium::jni::set_field_value(_jenv, _jresult, "x", jx);
    auto jy = _ninput.y;
    ::genium::jni::set_field_value(_jenv, _jresult, "y", jy);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::genium::optional<::smoke::Vector> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
