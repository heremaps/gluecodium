/*

 *
 */

@file:JvmName("CommentsLinksExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * The nested types like [com.example.smoke.CommentsLinks.randomMethod] don't need full name prefix, but it's
 * possible to references other interfaces like [com.example.smoke.CommentsInterface] or other members
 * [com.example.smoke.Comments.someMethodWithAllComments].
 *
 * Weblinks are not modified like this [example1], [example2](http://www.example.com/2) or <https://www.example.com/3>.
 *
 * [example1]: http://example.com/1
 */
class CommentsLinks : NativeBase {

    /**
     * Links also work in:
     */
    class RandomStruct {
        /**
         * Some random field [com.example.smoke.Comments.SomeStruct]
         */
        @JvmField var randomField: Comments.SomeStruct



        /**
         * constructor comments [com.example.smoke.Comments.SomeStruct]
         * @param randomField Some random field [com.example.smoke.Comments.SomeStruct]
         */
        constructor(randomField: Comments.SomeStruct) {
            this.randomField = randomField
        }





    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    /**
     * Link types:
     * * constant: [com.example.smoke.Comments.VERY_USEFUL]
     * * struct: [com.example.smoke.Comments.SomeStruct]
     * * struct field: [com.example.smoke.Comments.SomeStruct.someField]
     * * enum: [com.example.smoke.Comments.SomeEnum]
     * * enum item: [com.example.smoke.Comments.SomeEnum.USEFUL]
     * * property: [com.example.smoke.Comments.isSomeProperty]
     * * property setter: [com.example.smoke.Comments.isSomeProperty]
     * * property getter: [com.example.smoke.Comments.isSomeProperty]
     * * method: [com.example.smoke.Comments.someMethodWithAllComments]
     * * method with signature: [com.example.smoke.Comments.oneParameterCommentOnly]
     * * method with signature with no spaces: [com.example.smoke.Comments.oneParameterCommentOnly]
     * * parameter: [com.example.smoke.CommentsLinks.randomMethod.inputParameter]
     * * top level constant: [com.example.smoke.CommentsTypeCollection.TYPE_COLLECTION_CONSTANT]
     * * top level struct: [com.example.smoke.CommentsTypeCollection.TypeCollectionStruct]
     * * top level struct field: [com.example.smoke.CommentsTypeCollection.TypeCollectionStruct.field]
     * * top level enum: [com.example.smoke.CommentsTypeCollection.TypeCollectionEnum]
     * * top level enum item: [com.example.smoke.CommentsTypeCollection.TypeCollectionEnum.ITEM]
     * * error: [com.example.smoke.Comments.SomethingWrongException]
     * * lambda: [com.example.smoke.Comments.SomeLambda]
     * * type from aux sources, same package: [com.example.smoke.AuxClass]
     * * type from aux sources, different package: [com.example.fire.AuxStruct]
     *   * we can also have
     *   * nested lists
     *
     * Not working for Java:
     * * typedef: [com.example.smoke.Comments.Usefulness]
     * * top level typedef: [com.example.smoke.CommentsTypeCollection.TypeCollectionTypedef]
     *
     * Not working for Swift:
     * * named comment: [][com.example.smoke.Comments.VERY_USEFUL]
     * @param inputParameter Sometimes takes [com.example.smoke.Comments.SomeEnum.USEFUL]
     * @return Sometimes returns [com.example.smoke.Comments.SomeEnum.USEFUL]
     * @throws Comments.SomethingWrongException May or may not throw [com.example.smoke.Comments.SomethingWrongException]
     */
    @Throws(Comments.SomethingWrongException::class)
    external fun randomMethod(inputParameter: Comments.SomeEnum) : Comments.SomeEnum
    /**
     * Links to method overloads:
     * * other one: [com.example.smoke.CommentsLinks.randomMethod]
     * * this one: [com.example.smoke.CommentsLinks.randomMethod]
     * * ambiguous one: [com.example.smoke.CommentsLinks.randomMethod]
     * @param text
     * @param flag
     */

    external fun randomMethod(text: String, flag: Boolean) : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

