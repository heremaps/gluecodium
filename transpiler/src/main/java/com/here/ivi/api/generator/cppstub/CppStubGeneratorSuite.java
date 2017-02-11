package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.common.*;
import com.here.ivi.api.generator.cppstub.templates.CppStubNameRules;
import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.CppStubSpec;

import java.util.List;
import java.util.stream.Collectors;


/**
 * This generator will build all the CppStubs that will have to be implemented on the client side @ref TODO-DOES-NOT-EXIST
 * as well as the data used by this stubs @ref CppTypeCollectionGenerator.
 *
 * It is the underlying generator, that all others depend on, as they will invoke the actual implementation through
 * the Stub interfaces.
 *
 * @startuml
 *
 *   title Generators
 *
 *   rectangle "Legacy Generator" {
 *
 *   rectangle PC #FFE [
 *   Public APIs
 *
 *   (.h)
 *   ]
 *   rectangle PrC [
 *   Public Impl
 *
 *   (.cpp)
 *   ]
 *   rectangle PIMPL [
 *   Private Impl
 *
 *   (.h, .cpp)
 *   ]
 *
 *   PC -down-> PrC : calls
 *   PrC -down-> PIMPL : calls
 *   }
 *
 *   rectangle "iOS Generator" {
 *
 *   rectangle Swift #FFE [
 *   Public APIs
 *
 *   (.swift)
 *   ]
 *   rectangle ObjectiveC [
 *   ObjectiveC
 *
 *   (.h, .mm)
 *   ]
 *
 *   Swift -down-> ObjectiveC : calls
 *   }
 *
 *   rectangle "Android Generator" {
 *
 *   rectangle Java #FFE [
 *   Public APIs
 *
 *   (.java)
 *   ]
 *   rectangle JNI [
 *   JNI
 *
 *   (.h, .cpp)
 *   ]
 *
 *   Java -down-> JNI : calls
 *   }
 *
 *   rectangle "CppStub Generator" {
 *   rectangle CS [
 *   Cpp Stub
 *
 *   (.h)
 *   ]
 *
 *   rectangle CT #FFE [
 *   Cpp Types
 *
 *   (.h)
 *   ]
 *   }
 *
 *   rectangle "Manual Implementation" {
 *   rectangle CTI #4CE [
 *   Cpp Types Implementation
 *
 *   (.incl)
 *   ]
 *
 *   rectangle CSI #4CE [
 *   Cpp Stub Implementation
 *
 *   (.cpp)
 *   ]
 *   }
 *   rectangle "Implementation Stack" {
 *   rectangle Legacy #2AC [
 *   Legacy
 *   ]
 *   }
 *
 *   CT .down.> CTI : uses
 *   CS .right.> CT  : uses
 *   CSI -up-|> CS : implements
 *
 *   CSI -down-> Legacy : calls
 *
 *   JNI -> CS : calls
 *   JNI ..> CT : uses
 *
 *   PIMPL --> CS : calls
 *   PC --|> CT : contains
 *
 *   ObjectiveC -> CS : calls
 *
 * @enduml
 */
public class CppStubGeneratorSuite
        implements GeneratorSuite<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor>
{
    private final Transpiler tool;

    public CppStubGeneratorSuite(Transpiler tp) {
        this.tool = tp;
    }

    @Override
    public List<GeneratedFile> generate(
            FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> model) {

        // every interface gets its own file
        //   ? without struct tag it is mapped to class, to a struct otherwise
        // generate one file for each type collection, containing all the typedefs, enums, etc.

        CppStubNameRules rules = new CppStubNameRules();
        
        return model.typeCollections.parallelStream()
                .map(tc -> {
                    CppTypeCollectionGenerator generator = new CppTypeCollectionGenerator(this, model, rules, tc);
                    return generator.generate();
                }).collect(Collectors.toList());
    }

    @Override
    public Transpiler getTool() {
        return tool;
    }

    @Override
    public Version getVersion() {
        return new Version(0, 0, 1);
    }

    @Override
    public String getName() {
        return "com.here.CppStubGenerator";
    }

}
