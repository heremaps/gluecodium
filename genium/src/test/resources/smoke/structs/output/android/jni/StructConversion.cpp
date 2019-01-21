#include "StructConversion.h"
#include <cstdint>
#include <vector>
#include "FieldAccessMethods.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
namespace genium
{
namespace jni
{
::smoke::Structs::Point
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Point* dummy)
{
    ::smoke::Structs::Point _nout{};
    double n_x = genium::jni::get_double_field(_jenv, _jinput, "x");
    _nout.x = n_x;
    double n_y = genium::jni::get_double_field(_jenv, _jinput, "y");
    _nout.y = n_y;
    return _nout;
}
std::shared_ptr<::smoke::Structs::Point>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Point>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Structs::Point>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::Point*)nullptr))
        : std::shared_ptr<::smoke::Structs::Point>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Point& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$Point");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jx = _ninput.x;
    genium::jni::set_double_field(_jenv, _jresult, "x", jx);
    auto jy = _ninput.y;
    genium::jni::set_double_field(_jenv, _jresult, "y", jy);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Point> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::Color
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Color* dummy)
{
    ::smoke::Structs::Color _nout{};
    uint8_t n_red = genium::jni::get_short_field(_jenv, _jinput, "red");
    _nout.red = n_red;
    uint8_t n_green = genium::jni::get_short_field(_jenv, _jinput, "green");
    _nout.green = n_green;
    uint8_t n_blue = genium::jni::get_short_field(_jenv, _jinput, "blue");
    _nout.blue = n_blue;
    return _nout;
}
std::shared_ptr<::smoke::Structs::Color>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Color>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Structs::Color>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::Color*)nullptr))
        : std::shared_ptr<::smoke::Structs::Color>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Color& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$Color");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jred = _ninput.red;
    genium::jni::set_short_field(_jenv, _jresult, "red", jred);
    auto jgreen = _ninput.green;
    genium::jni::set_short_field(_jenv, _jresult, "green", jgreen);
    auto jblue = _ninput.blue;
    genium::jni::set_short_field(_jenv, _jresult, "blue", jblue);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Color> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::Line
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Line* dummy)
{
    ::smoke::Structs::Line _nout{};
    ::smoke::Structs::Point n_a = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "a",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    _nout.a = n_a;
    ::smoke::Structs::Point n_b = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "b",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    _nout.b = n_b;
    return _nout;
}
std::shared_ptr<::smoke::Structs::Line>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Line>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Structs::Line>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::Line*)nullptr))
        : std::shared_ptr<::smoke::Structs::Line>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Line& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$Line");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto ja = convert_to_jni(_jenv, _ninput.a);
    genium::jni::set_object_field(_jenv, _jresult, "a",
        "Lcom/example/smoke/Structs$Point;", ja);
    auto jb = convert_to_jni(_jenv, _ninput.b);
    genium::jni::set_object_field(_jenv, _jresult, "b",
        "Lcom/example/smoke/Structs$Point;", jb);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Line> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::ColoredLine
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ColoredLine* dummy)
{
    ::smoke::Structs::ColoredLine _nout{};
    ::smoke::Structs::Line n_line = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "line",
        "Lcom/example/smoke/Structs$Line;"),
        (::smoke::Structs::Line*)nullptr );
    _nout.line = n_line;
    ::smoke::Structs::Color n_color = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "color",
        "Lcom/example/smoke/Structs$Color;"),
        (::smoke::Structs::Color*)nullptr );
    _nout.color = n_color;
    return _nout;
}
std::shared_ptr<::smoke::Structs::ColoredLine>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::ColoredLine>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Structs::ColoredLine>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::ColoredLine*)nullptr))
        : std::shared_ptr<::smoke::Structs::ColoredLine>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ColoredLine& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$ColoredLine");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jline = convert_to_jni(_jenv, _ninput.line);
    genium::jni::set_object_field(_jenv, _jresult, "line",
        "Lcom/example/smoke/Structs$Line;", jline);
    auto jcolor = convert_to_jni(_jenv, _ninput.color);
    genium::jni::set_object_field(_jenv, _jresult, "color",
        "Lcom/example/smoke/Structs$Color;", jcolor);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::ColoredLine> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::AllTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::AllTypesStruct* dummy)
{
    int8_t n_int8_field = genium::jni::get_byte_field(_jenv, _jinput, "int8Field");
    uint8_t n_uint8_field = genium::jni::get_short_field(_jenv, _jinput, "uint8Field");
    int16_t n_int16_field = genium::jni::get_short_field(_jenv, _jinput, "int16Field");
    uint16_t n_uint16_field = genium::jni::get_int_field(_jenv, _jinput, "uint16Field");
    int32_t n_int32_field = genium::jni::get_int_field(_jenv, _jinput, "int32Field");
    uint32_t n_uint32_field = genium::jni::get_long_field(_jenv, _jinput, "uint32Field");
    int64_t n_int64_field = genium::jni::get_long_field(_jenv, _jinput, "int64Field");
    uint64_t n_uint64_field = genium::jni::get_long_field(_jenv, _jinput, "uint64Field");
    float n_float_field = genium::jni::get_float_field(_jenv, _jinput, "floatField");
    double n_double_field = genium::jni::get_double_field(_jenv, _jinput, "doubleField");
    ::std::string n_string_field = genium::jni::get_string_field(_jenv, _jinput, "stringField");
    bool n_boolean_field = genium::jni::get_boolean_field(_jenv, _jinput, "booleanField");
    ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = genium::jni::get_byte_array_field(_jenv, _jinput, "bytesField");
    ::smoke::Structs::Point n_point_field = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "pointField",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    return ::smoke::Structs::AllTypesStruct(n_int8_field, n_uint8_field, n_int16_field, n_uint16_field, n_int32_field, n_uint32_field, n_int64_field, n_uint64_field, n_float_field, n_double_field, n_string_field, n_boolean_field, n_bytes_field, n_point_field);
}
std::shared_ptr<::smoke::Structs::AllTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::AllTypesStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Structs::AllTypesStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::AllTypesStruct*)nullptr))
        : std::shared_ptr<::smoke::Structs::AllTypesStruct>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::AllTypesStruct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$AllTypesStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jint8_field = _ninput.int8_field;
    genium::jni::set_byte_field(_jenv, _jresult, "int8Field", jint8_field);
    auto juint8_field = _ninput.uint8_field;
    genium::jni::set_short_field(_jenv, _jresult, "uint8Field", juint8_field);
    auto jint16_field = _ninput.int16_field;
    genium::jni::set_short_field(_jenv, _jresult, "int16Field", jint16_field);
    auto juint16_field = _ninput.uint16_field;
    genium::jni::set_int_field(_jenv, _jresult, "uint16Field", juint16_field);
    auto jint32_field = _ninput.int32_field;
    genium::jni::set_int_field(_jenv, _jresult, "int32Field", jint32_field);
    auto juint32_field = _ninput.uint32_field;
    genium::jni::set_long_field(_jenv, _jresult, "uint32Field", juint32_field);
    auto jint64_field = _ninput.int64_field;
    genium::jni::set_long_field(_jenv, _jresult, "int64Field", jint64_field);
    auto juint64_field = _ninput.uint64_field;
    genium::jni::set_long_field(_jenv, _jresult, "uint64Field", juint64_field);
    auto jfloat_field = _ninput.float_field;
    genium::jni::set_float_field(_jenv, _jresult, "floatField", jfloat_field);
    auto jdouble_field = _ninput.double_field;
    genium::jni::set_double_field(_jenv, _jresult, "doubleField", jdouble_field);
    auto jstring_field = _ninput.string_field;
    genium::jni::set_string_field(_jenv, _jresult, "stringField", jstring_field);
    auto jboolean_field = _ninput.boolean_field;
    genium::jni::set_boolean_field(_jenv, _jresult, "booleanField", jboolean_field);
    auto jbytes_field = _ninput.bytes_field;
    genium::jni::set_byte_array_field(_jenv, _jresult, "bytesField", jbytes_field);
    auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
    genium::jni::set_object_field(_jenv, _jresult, "pointField",
        "Lcom/example/smoke/Structs$Point;", jpoint_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::AllTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::ExternalStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::ExternalStruct* dummy)
{
    ::smoke::Structs::ExternalStruct _nout{};
    ::std::string n_stringField = genium::jni::get_string_field(_jenv, _jinput, "stringField");
    _nout.stringField = n_stringField;
    ::std::string n_externalStringField = genium::jni::get_string_field(_jenv, _jinput, "externalStringField");
    _nout.set_some_string(n_externalStringField);
    ::std::vector< int8_t > n_externalArrayField = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "externalArrayField",
        "Ljava/util/List;"),
        (::std::vector< int8_t >*)nullptr );
    _nout.set_some_array(n_externalArrayField);
    ::fire::SomeVeryExternalStruct n_externalStructField = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "externalStructField",
        "Lcom/example/smoke/Structs$AnotherExternalStruct;"),
        (::fire::SomeVeryExternalStruct*)nullptr );
    _nout.set_some_struct(n_externalStructField);
    return _nout;
}
std::shared_ptr<::smoke::Structs::ExternalStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::ExternalStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Structs::ExternalStruct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::ExternalStruct*)nullptr))
        : std::shared_ptr<::smoke::Structs::ExternalStruct>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::ExternalStruct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$ExternalStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jstringField = _ninput.stringField;
    genium::jni::set_string_field(_jenv, _jresult, "stringField", jstringField);
    auto jexternalStringField = _ninput.get_some_string();
    genium::jni::set_string_field(_jenv, _jresult, "externalStringField", jexternalStringField);
    auto jexternalArrayField = convert_to_jni(_jenv, _ninput.get_some_array());
    genium::jni::set_object_field(_jenv, _jresult, "externalArrayField",
        "Ljava/util/List;", jexternalArrayField);
    auto jexternalStructField = convert_to_jni(_jenv, _ninput.get_some_struct());
    genium::jni::set_object_field(_jenv, _jresult, "externalStructField",
        "Lcom/example/smoke/Structs$AnotherExternalStruct;", jexternalStructField);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::ExternalStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::fire::SomeVeryExternalStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::SomeVeryExternalStruct* dummy)
{
    ::fire::SomeVeryExternalStruct _nout{};
    int8_t n_intField = genium::jni::get_byte_field(_jenv, _jinput, "intField");
    _nout.intField = n_intField;
    return _nout;
}
std::shared_ptr<::fire::SomeVeryExternalStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::SomeVeryExternalStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::fire::SomeVeryExternalStruct>(convert_from_jni(_jenv, _jinput, (::fire::SomeVeryExternalStruct*)nullptr))
        : std::shared_ptr<::fire::SomeVeryExternalStruct>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::SomeVeryExternalStruct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$AnotherExternalStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jintField = _ninput.intField;
    genium::jni::set_byte_field(_jenv, _jresult, "intField", jintField);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::SomeVeryExternalStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Structs::Yet_Another_External_Struct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Structs::Yet_Another_External_Struct* dummy)
{
    ::smoke::Structs::Yet_Another_External_Struct _nout{};
    ::std::string n_string_Field = genium::jni::get_string_field(_jenv, _jinput, "stringField");
    _nout.string_Field = n_string_Field;
    return _nout;
}
std::shared_ptr<::smoke::Structs::Yet_Another_External_Struct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Structs::Yet_Another_External_Struct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Structs::Yet_Another_External_Struct>(convert_from_jni(_jenv, _jinput, (::smoke::Structs::Yet_Another_External_Struct*)nullptr))
        : std::shared_ptr<::smoke::Structs::Yet_Another_External_Struct>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Structs::Yet_Another_External_Struct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Structs$YetAnotherExternalStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jstring_Field = _ninput.string_Field;
    genium::jni::set_string_field(_jenv, _jresult, "stringField", jstring_Field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Structs::Yet_Another_External_Struct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::fire::StructsQualifiedType::QualifiedType
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::fire::StructsQualifiedType::QualifiedType* dummy)
{
    ::fire::StructsQualifiedType::QualifiedType _nout{};
    ::smoke::Point n_type_collection_point = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "typeCollectionPoint",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.type_collection_point = n_type_collection_point;
    ::smoke::Structs::Point n_interface_point = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "interfacePoint",
        "Lcom/example/smoke/Structs$Point;"),
        (::smoke::Structs::Point*)nullptr );
    _nout.interface_point = n_interface_point;
    ::fire::StructsQualifiedType::TypeCollectionPointsArray n_type_collection_explicit_points = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "typeCollectionExplicitPoints",
        "Ljava/util/List;"),
        (::fire::StructsQualifiedType::TypeCollectionPointsArray*)nullptr );
    _nout.type_collection_explicit_points = n_type_collection_explicit_points;
    ::fire::StructsQualifiedType::InterfacePointsArray n_interface_explicit_points = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "interfaceExplicitPoints",
        "Ljava/util/List;"),
        (::fire::StructsQualifiedType::InterfacePointsArray*)nullptr );
    _nout.interface_explicit_points = n_interface_explicit_points;
    ::std::vector< ::smoke::Point > n_type_collection_implicit_points = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "typeCollectionImplicitPoints",
        "Ljava/util/List;"),
        (::std::vector< ::smoke::Point >*)nullptr );
    _nout.type_collection_implicit_points = n_type_collection_implicit_points;
    ::std::vector< ::smoke::Structs::Point > n_interface_implicit_points = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "interfaceImplicitPoints",
        "Ljava/util/List;"),
        (::std::vector< ::smoke::Structs::Point >*)nullptr );
    _nout.interface_implicit_points = n_interface_implicit_points;
    ::std::shared_ptr< ::smoke::StructsInstance > n_structs_instance = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "structsInstance",
        "Lcom/example/smoke/StructsInstance;"),
        (::std::shared_ptr< ::smoke::StructsInstance >*)nullptr );
    _nout.structs_instance = n_structs_instance;
    return _nout;
}
std::shared_ptr<::fire::StructsQualifiedType::QualifiedType>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::fire::StructsQualifiedType::QualifiedType>* dummy)
{
    return _jinput
        ? std::make_shared<::fire::StructsQualifiedType::QualifiedType>(convert_from_jni(_jenv, _jinput, (::fire::StructsQualifiedType::QualifiedType*)nullptr))
        : std::shared_ptr<::fire::StructsQualifiedType::QualifiedType>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::fire::StructsQualifiedType::QualifiedType& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/fire/StructsQualifiedType$QualifiedType");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jtype_collection_point = convert_to_jni(_jenv, _ninput.type_collection_point);
    genium::jni::set_object_field(_jenv, _jresult, "typeCollectionPoint",
        "Lcom/example/smoke/Point;", jtype_collection_point);
    auto jinterface_point = convert_to_jni(_jenv, _ninput.interface_point);
    genium::jni::set_object_field(_jenv, _jresult, "interfacePoint",
        "Lcom/example/smoke/Structs$Point;", jinterface_point);
    auto jtype_collection_explicit_points = convert_to_jni(_jenv, _ninput.type_collection_explicit_points);
    genium::jni::set_object_field(_jenv, _jresult, "typeCollectionExplicitPoints",
        "Ljava/util/List;", jtype_collection_explicit_points);
    auto jinterface_explicit_points = convert_to_jni(_jenv, _ninput.interface_explicit_points);
    genium::jni::set_object_field(_jenv, _jresult, "interfaceExplicitPoints",
        "Ljava/util/List;", jinterface_explicit_points);
    auto jtype_collection_implicit_points = convert_to_jni(_jenv, _ninput.type_collection_implicit_points);
    genium::jni::set_object_field(_jenv, _jresult, "typeCollectionImplicitPoints",
        "Ljava/util/List;", jtype_collection_implicit_points);
    auto jinterface_implicit_points = convert_to_jni(_jenv, _ninput.interface_implicit_points);
    genium::jni::set_object_field(_jenv, _jresult, "interfaceImplicitPoints",
        "Ljava/util/List;", jinterface_implicit_points);
    auto jstructs_instance = convert_to_jni(_jenv, _ninput.structs_instance);
    genium::jni::set_object_field(_jenv, _jresult, "structsInstance",
        "Lcom/example/smoke/StructsInstance;", jstructs_instance);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::fire::StructsQualifiedType::QualifiedType> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Point
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Point* dummy)
{
    ::smoke::Point _nout{};
    double n_x = genium::jni::get_double_field(_jenv, _jinput, "x");
    _nout.x = n_x;
    double n_y = genium::jni::get_double_field(_jenv, _jinput, "y");
    _nout.y = n_y;
    return _nout;
}
std::shared_ptr<::smoke::Point>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Point>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Point>(convert_from_jni(_jenv, _jinput, (::smoke::Point*)nullptr))
        : std::shared_ptr<::smoke::Point>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Point& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Point");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jx = _ninput.x;
    genium::jni::set_double_field(_jenv, _jresult, "x", jx);
    auto jy = _ninput.y;
    genium::jni::set_double_field(_jenv, _jresult, "y", jy);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Point> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Color
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Color* dummy)
{
    ::smoke::Color _nout{};
    uint8_t n_red = genium::jni::get_short_field(_jenv, _jinput, "red");
    _nout.red = n_red;
    uint8_t n_green = genium::jni::get_short_field(_jenv, _jinput, "green");
    _nout.green = n_green;
    uint8_t n_blue = genium::jni::get_short_field(_jenv, _jinput, "blue");
    _nout.blue = n_blue;
    return _nout;
}
std::shared_ptr<::smoke::Color>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Color>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Color>(convert_from_jni(_jenv, _jinput, (::smoke::Color*)nullptr))
        : std::shared_ptr<::smoke::Color>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Color& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Color");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jred = _ninput.red;
    genium::jni::set_short_field(_jenv, _jresult, "red", jred);
    auto jgreen = _ninput.green;
    genium::jni::set_short_field(_jenv, _jresult, "green", jgreen);
    auto jblue = _ninput.blue;
    genium::jni::set_short_field(_jenv, _jresult, "blue", jblue);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Color> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::Line
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::Line* dummy)
{
    ::smoke::Line _nout{};
    ::smoke::Point n_a = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "a",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.a = n_a;
    ::smoke::Point n_b = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "b",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.b = n_b;
    return _nout;
}
std::shared_ptr<::smoke::Line>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::Line>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::Line>(convert_from_jni(_jenv, _jinput, (::smoke::Line*)nullptr))
        : std::shared_ptr<::smoke::Line>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Line& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/Line");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto ja = convert_to_jni(_jenv, _ninput.a);
    genium::jni::set_object_field(_jenv, _jresult, "a",
        "Lcom/example/smoke/Point;", ja);
    auto jb = convert_to_jni(_jenv, _ninput.b);
    genium::jni::set_object_field(_jenv, _jresult, "b",
        "Lcom/example/smoke/Point;", jb);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::Line> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::ColoredLine
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ColoredLine* dummy)
{
    ::smoke::ColoredLine _nout{};
    ::smoke::Line n_line = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "line",
        "Lcom/example/smoke/Line;"),
        (::smoke::Line*)nullptr );
    _nout.line = n_line;
    ::smoke::Color n_color = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "color",
        "Lcom/example/smoke/Color;"),
        (::smoke::Color*)nullptr );
    _nout.color = n_color;
    return _nout;
}
std::shared_ptr<::smoke::ColoredLine>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::ColoredLine>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::ColoredLine>(convert_from_jni(_jenv, _jinput, (::smoke::ColoredLine*)nullptr))
        : std::shared_ptr<::smoke::ColoredLine>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::ColoredLine& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/ColoredLine");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jline = convert_to_jni(_jenv, _ninput.line);
    genium::jni::set_object_field(_jenv, _jresult, "line",
        "Lcom/example/smoke/Line;", jline);
    auto jcolor = convert_to_jni(_jenv, _ninput.color);
    genium::jni::set_object_field(_jenv, _jresult, "color",
        "Lcom/example/smoke/Color;", jcolor);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::ColoredLine> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
::smoke::AllTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::AllTypesStruct* dummy)
{
    ::smoke::AllTypesStruct _nout{};
    int8_t n_int8_field = genium::jni::get_byte_field(_jenv, _jinput, "int8Field");
    _nout.int8_field = n_int8_field;
    uint8_t n_uint8_field = genium::jni::get_short_field(_jenv, _jinput, "uint8Field");
    _nout.uint8_field = n_uint8_field;
    int16_t n_int16_field = genium::jni::get_short_field(_jenv, _jinput, "int16Field");
    _nout.int16_field = n_int16_field;
    uint16_t n_uint16_field = genium::jni::get_int_field(_jenv, _jinput, "uint16Field");
    _nout.uint16_field = n_uint16_field;
    int32_t n_int32_field = genium::jni::get_int_field(_jenv, _jinput, "int32Field");
    _nout.int32_field = n_int32_field;
    uint32_t n_uint32_field = genium::jni::get_long_field(_jenv, _jinput, "uint32Field");
    _nout.uint32_field = n_uint32_field;
    int64_t n_int64_field = genium::jni::get_long_field(_jenv, _jinput, "int64Field");
    _nout.int64_field = n_int64_field;
    uint64_t n_uint64_field = genium::jni::get_long_field(_jenv, _jinput, "uint64Field");
    _nout.uint64_field = n_uint64_field;
    float n_float_field = genium::jni::get_float_field(_jenv, _jinput, "floatField");
    _nout.float_field = n_float_field;
    double n_double_field = genium::jni::get_double_field(_jenv, _jinput, "doubleField");
    _nout.double_field = n_double_field;
    ::std::string n_string_field = genium::jni::get_string_field(_jenv, _jinput, "stringField");
    _nout.string_field = n_string_field;
    bool n_boolean_field = genium::jni::get_boolean_field(_jenv, _jinput, "booleanField");
    _nout.boolean_field = n_boolean_field;
    ::std::shared_ptr< ::std::vector< uint8_t > > n_bytes_field = genium::jni::get_byte_array_field(_jenv, _jinput, "bytesField");
    _nout.bytes_field = n_bytes_field;
    ::smoke::Point n_point_field = convert_from_jni(
        _jenv,
        genium::jni::get_object_field(
        _jenv,
        _jinput,
        "pointField",
        "Lcom/example/smoke/Point;"),
        (::smoke::Point*)nullptr );
    _nout.point_field = n_point_field;
    return _nout;
}
std::shared_ptr<::smoke::AllTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::shared_ptr<::smoke::AllTypesStruct>* dummy)
{
    return _jinput
        ? std::make_shared<::smoke::AllTypesStruct>(convert_from_jni(_jenv, _jinput, (::smoke::AllTypesStruct*)nullptr))
        : std::shared_ptr<::smoke::AllTypesStruct>{};
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::AllTypesStruct& _ninput)
{
    auto javaClass = find_class(_jenv, "com/example/smoke/AllTypesStruct");
    auto _jresult = genium::jni::create_object(_jenv, javaClass);
    auto jint8_field = _ninput.int8_field;
    genium::jni::set_byte_field(_jenv, _jresult, "int8Field", jint8_field);
    auto juint8_field = _ninput.uint8_field;
    genium::jni::set_short_field(_jenv, _jresult, "uint8Field", juint8_field);
    auto jint16_field = _ninput.int16_field;
    genium::jni::set_short_field(_jenv, _jresult, "int16Field", jint16_field);
    auto juint16_field = _ninput.uint16_field;
    genium::jni::set_int_field(_jenv, _jresult, "uint16Field", juint16_field);
    auto jint32_field = _ninput.int32_field;
    genium::jni::set_int_field(_jenv, _jresult, "int32Field", jint32_field);
    auto juint32_field = _ninput.uint32_field;
    genium::jni::set_long_field(_jenv, _jresult, "uint32Field", juint32_field);
    auto jint64_field = _ninput.int64_field;
    genium::jni::set_long_field(_jenv, _jresult, "int64Field", jint64_field);
    auto juint64_field = _ninput.uint64_field;
    genium::jni::set_long_field(_jenv, _jresult, "uint64Field", juint64_field);
    auto jfloat_field = _ninput.float_field;
    genium::jni::set_float_field(_jenv, _jresult, "floatField", jfloat_field);
    auto jdouble_field = _ninput.double_field;
    genium::jni::set_double_field(_jenv, _jresult, "doubleField", jdouble_field);
    auto jstring_field = _ninput.string_field;
    genium::jni::set_string_field(_jenv, _jresult, "stringField", jstring_field);
    auto jboolean_field = _ninput.boolean_field;
    genium::jni::set_boolean_field(_jenv, _jresult, "booleanField", jboolean_field);
    auto jbytes_field = _ninput.bytes_field;
    genium::jni::set_byte_array_field(_jenv, _jresult, "bytesField", jbytes_field);
    auto jpoint_field = convert_to_jni(_jenv, _ninput.point_field);
    genium::jni::set_object_field(_jenv, _jresult, "pointField",
        "Lcom/example/smoke/Point;", jpoint_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::AllTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
