    static void void_ref(  );
    static const bool& bool_ref(  );
    static const ::std::string& string_ref(  );
    static const ::smoke::CppRefReturnType::SomeStruct& struct_ref(  );
    /**
     *
     * \return @NotNull
     */
    static const ::std::shared_ptr< ::smoke::CppRefReturnType >& class_ref(  );
    static const ::gluecodium::optional< ::std::string >& nullable_ref(  );
    static ::std::error_code throwing_enum_with_void(  );
    static ::gluecodium::Return< const ::std::string&, ::std::error_code > throwing_enum_with_string(  );
    static ::gluecodium::Return< void, ::smoke::CppRefReturnType::SomeStruct > throwing_struct_with_void(  );
    static ::gluecodium::Return< const ::std::string&, ::smoke::CppRefReturnType::SomeStruct > throwing_struct_with_string(  );
    static const ::std::string& get_string_property(  );
