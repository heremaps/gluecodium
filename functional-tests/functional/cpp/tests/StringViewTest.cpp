// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2026 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

#include "lorem_ipsum/test/StringView.h"

#include <gmock/gmock.h>

#include <array>
#include <cstddef>
#include <iterator>

using namespace ::testing;

using ::lorem_ipsum::test::string_view;

#define APPEND( A, B ) APPEND_( A, B )
#define APPEND_( A, B ) A##B
#define TEST_NAME APPEND( StringViewTest, TEST_CPP_VERSION )

namespace test
{

TEST( TEST_NAME, default_constructor_yields_empty_view )
{
    // When default constructing string view.
    constexpr string_view some_sv{};

    // Then it is empty.
    EXPECT_EQ(0u, some_sv.size());
    EXPECT_EQ(0u, some_sv.length());

    EXPECT_EQ(nullptr, some_sv.data());
    EXPECT_TRUE(some_sv.empty());
}

TEST( TEST_NAME, copy_construction_from_empty_view_yields_another_empty_view )
{
    // Given empty string view.
    constexpr string_view some_empty_sv{};

    // When copy constructing new view from it.
    constexpr string_view some_sv{some_empty_sv};

    // Then resulting view is also empty.
    EXPECT_EQ(0u, some_sv.size());
    EXPECT_EQ(0u, some_sv.length());

    EXPECT_EQ(nullptr, some_sv.data());
    EXPECT_TRUE(some_sv.empty());
}

TEST( TEST_NAME, ptr_and_size_constructor_yields_valid_view )
{
    // Given the predefined string.
    const char some_cstring[] = "Nice sentence!";

    // When creating view for the first word (Nice).
    string_view nice_sv{&some_cstring[0], 4u};

    // Then size and pointer is valid.
    EXPECT_EQ(4u, nice_sv.size());
    EXPECT_EQ(4u, nice_sv.length());

    EXPECT_EQ(&some_cstring[0], nice_sv.data());
    EXPECT_FALSE(nice_sv.empty());

    // When creating view for the second work (sentence).
    string_view sentence_sv{&some_cstring[5], 8u};

    // Then size and pointer is valid.
    EXPECT_EQ(8u, sentence_sv.size());
    EXPECT_EQ(8u, sentence_sv.length());

    EXPECT_EQ(&some_cstring[5], sentence_sv.data());
    EXPECT_FALSE(sentence_sv.empty());
}

TEST( TEST_NAME, copy_construction_from_nonempty_view_yields_another_nonempty_view )
{
    // Given the predefined string.
    const char some_cstring[] = "This is a long sentence!";

    // When creating view for the fourth word (long).
    string_view long_sv{&some_cstring[10], 4u};

    // When copy constructing new view from it.
    string_view some_sv{long_sv};

    // Then resulting view is identical.
    EXPECT_EQ(4u, some_sv.size());
    EXPECT_EQ(4u, some_sv.length());

    EXPECT_EQ(&some_cstring[10], some_sv.data());
    EXPECT_FALSE(some_sv.empty());
}

TEST( TEST_NAME, nullterminated_cstring_constructor_yields_valid_view )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium is cool";

    // When creating view for the whole c-string.
    string_view some_sv{some_cstring};

    // Then size does not contain null-terminator and pointer is valid.
    EXPECT_EQ(18u, some_sv.size());
    EXPECT_EQ(18u, some_sv.length());

    EXPECT_EQ(&some_cstring[0], some_sv.data());
    EXPECT_FALSE(some_sv.empty());
}

TEST( TEST_NAME, range_for_works_fine_for_non_empty_string_view )
{
    // Given the predefined string.
    const char some_cstring[] = "This is a great sentence!";

    // When creating view for the fourth word (great).
    string_view great_sv{&some_cstring[10], 5u};

    // And when iterating via range for (using begin / end).
    std::size_t offset = 0;
    for (char c : great_sv)
    {
        // Then each iteration gets correct character.
        const char expected_c = some_cstring[10 + offset];
        EXPECT_EQ(expected_c, c) << "Failed for offset = " << offset;

        ++offset;
    }

    // Then number of iterations is equal to size.
    EXPECT_EQ(offset, great_sv.size());
}

TEST( TEST_NAME, range_for_does_not_iterate_over_empty_view )
{
    // Given empty view.
    constexpr string_view empty_sv{};

    // When iterating via range for (using begin / end).
    std::size_t offset = 0;
    for (char c : empty_sv)
    {
        ++offset;
    }

    // Then no iteration is executed. The view is empty.
    EXPECT_EQ(0, offset);
}

TEST( TEST_NAME, can_iterate_in_reverse_order_for_non_empty_string_view )
{
    // Given the predefined string.
    const char some_cstring[] = "This is a great sentence!";

    // When creating view for the fourth word (great).
    string_view great_sv{&some_cstring[10], 5u};

    // And when iterating in reverse order.
    std::size_t offset = 0;
    for (auto it = great_sv.rbegin(); it != great_sv.rend(); ++it)
    {
        // Then each iteration gets correct character.
        const char c = *it;
        const char expected_c = some_cstring[14 - offset];
        EXPECT_EQ(expected_c, c) << "Failed for offset = " << offset;

        ++offset;
    }

    // Then number of iterations is equal to size.
    EXPECT_EQ(offset, great_sv.size());
}

TEST( TEST_NAME, reverse_order_does_not_iterate_over_empty_view )
{
    // Given empty view.
    constexpr string_view empty_sv{};

    // And when iterating in reverse order.
    std::size_t offset = 0;
    for (auto it = empty_sv.rbegin(); it != empty_sv.rend(); ++it)
    {
        ++offset;
    }

    // Then no iteration is executed. The view is empty.
    EXPECT_EQ(0, offset);
}

TEST( TEST_NAME, std_distance_is_calculated_correctly_for_non_empty_string_view )
{
    // Given the predefined string.
    const char some_cstring[] = "This is a great sentence!";

    // When creating view for the fourth word (great).
    string_view great_sv{&some_cstring[10], 5u};

    // Then number of iterations is equal to size.
    EXPECT_EQ(std::distance(great_sv.begin(), great_sv.end()), great_sv.size());
    EXPECT_EQ(std::distance(great_sv.cbegin(), great_sv.cend()), great_sv.size());
    EXPECT_EQ(std::distance(great_sv.rbegin(), great_sv.rend()), great_sv.size());
    EXPECT_EQ(std::distance(great_sv.crbegin(), great_sv.crend()), great_sv.size());
}

TEST( TEST_NAME, access_operator_works_correctly_for_non_empty_string_view )
{
    // Given the predefined string.
    const char some_cstring[] = "This is a great sentence!";

    // When creating view for the fourth word (great).
    string_view great_sv{&some_cstring[10], 5u};

    // Then accessing valid indices return proper values.
    EXPECT_EQ('g', great_sv[0]);
    EXPECT_EQ('r', great_sv[1]);
    EXPECT_EQ('e', great_sv[2]);
    EXPECT_EQ('a', great_sv[3]);
    EXPECT_EQ('t', great_sv[4]);
}

TEST( TEST_NAME, at_function_works_correctly_for_non_empty_string_view )
{
    // Given the predefined string.
    const char some_cstring[] = "This is a great sentence!";

    // When creating view for the fourth word (great).
    string_view great_sv{&some_cstring[10], 5u};

    // Then accessing valid indices return proper values.
    EXPECT_EQ('g', great_sv.at(0));
    EXPECT_EQ('r', great_sv.at(1));
    EXPECT_EQ('e', great_sv.at(2));
    EXPECT_EQ('a', great_sv.at(3));
    EXPECT_EQ('t', great_sv.at(4));

    // And accessing invalid indices throws out of range.
    EXPECT_THROW(great_sv.at(5), std::out_of_range);
    EXPECT_THROW(great_sv.at(10), std::out_of_range);
    EXPECT_THROW(great_sv.at(999), std::out_of_range);
}

TEST( TEST_NAME, at_function_throws_for_empty_string_view )
{
    // Given empty view.
    constexpr string_view empty_sv{};

    // Then accessing invalid indices throws out of range.
    EXPECT_THROW(empty_sv.at(0), std::out_of_range);
    EXPECT_THROW(empty_sv.at(4), std::out_of_range);
}

TEST( TEST_NAME, front_function_works_correctly_for_non_empty_string_view )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium";

    // When creating view.
    string_view some_view{some_cstring};

    // Then front() returns the first letter.
    EXPECT_EQ('G', some_view.front());
}

TEST( TEST_NAME, back_function_works_correctly_for_non_empty_string_view )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium";

    // When creating view.
    string_view some_view{some_cstring};

    // Then back() returns the last letter.
    EXPECT_EQ('m', some_view.back());
}

TEST( TEST_NAME, prefix_is_correctly_removed_non_empty_string_view )
{
    // Given the predefined string.
    const char* some_cstring = "This is a great sentence!";

    // And view for it.
    string_view some_sv{some_cstring};

    // When removing prefix related to the first word.
    const auto size_before_first_removal = some_sv.size();
    some_sv.remove_prefix(5);

    // Then first letters are `is`
    EXPECT_EQ('i', some_sv[0]);
    EXPECT_EQ('s', some_sv[1]);

    // And size is reduced by dropped prefix size.
    EXPECT_EQ(size_before_first_removal - 5u, some_sv.size());

    // When removing prefix related to two first words.
    const auto size_before_second_removal = some_sv.size();
    some_sv.remove_prefix(5);

    // Then first letters are `great`
    EXPECT_EQ('g', some_sv[0]);
    EXPECT_EQ('r', some_sv[1]);
    EXPECT_EQ('e', some_sv[2]);
    EXPECT_EQ('a', some_sv[3]);
    EXPECT_EQ('t', some_sv[4]);
}

TEST( TEST_NAME, remove_prefix_zero_is_no_op_operation_even_on_empty_string_view )
{
    // Given empty string view.
    string_view empty_sv{};

    // Then removing prefix with n=0 is a valid no-op and does not crash.
    empty_sv.remove_prefix(0);
}

TEST( TEST_NAME, suffix_is_correctly_removed_non_empty_string_view )
{
    // Given the predefined string.
    const char* some_cstring = "This is a great sentence!";

    // And view for it.
    string_view some_sv{some_cstring};

    // When removing prefix related to the last word.
    const auto size_before_first_removal = some_sv.size();
    some_sv.remove_suffix(9u);

    // The beginning of view is not changed.
    EXPECT_EQ(&some_cstring[0], some_sv.data());

    // And size is reduced by dropped suffix size.
    EXPECT_EQ(size_before_first_removal - 9u, some_sv.size());
}

TEST( TEST_NAME, swapping_two_non_empty_views_work_as_expected )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium generates nice code!";

    // And two valid views.
    string_view first_view{&some_cstring[0], 10}; // "Gluecodium"
    string_view second_view{&some_cstring[11]}; // "generates nice code!"

    ASSERT_EQ(&some_cstring[0], first_view.data());
    ASSERT_EQ(10, first_view.size());

    ASSERT_EQ(&some_cstring[11], second_view.data());
    ASSERT_EQ(20, second_view.size());

    // When swapping them via member function.
    first_view.swap(second_view);

    // Then content of views is swapped.
    EXPECT_EQ(&some_cstring[11], first_view.data());
    EXPECT_EQ(20, first_view.size());

    EXPECT_EQ(&some_cstring[0], second_view.data());
    EXPECT_EQ(10, second_view.size());

    // When swapping them via free-function.
    swap(first_view, second_view);

    // Then content of views is swapped.
    EXPECT_EQ(&some_cstring[0], first_view.data());
    EXPECT_EQ(10, first_view.size());

    EXPECT_EQ(&some_cstring[11], second_view.data());
    EXPECT_EQ(20, second_view.size());
}

TEST( TEST_NAME, swapping_empty_with_non_empty_view_works_as_expected )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium";

    // And two valid views: empty and non-empty.
    string_view first_view{some_cstring};
    string_view second_view{};

    ASSERT_EQ(&some_cstring[0], first_view.data());
    ASSERT_EQ(10, first_view.size());

    ASSERT_EQ(nullptr, second_view.data());
    ASSERT_EQ(0u, second_view.size());

    // When swapping them via member function.
    first_view.swap(second_view);

    // Then content of views is swapped.
    EXPECT_EQ(nullptr, first_view.data());
    EXPECT_EQ(0, first_view.size());

    EXPECT_EQ(&some_cstring[0], second_view.data());
    EXPECT_EQ(10, second_view.size());

    // When swapping them via free-function.
    swap(first_view, second_view);

    // Then content of views is swapped.
    EXPECT_EQ(&some_cstring[0], first_view.data());
    EXPECT_EQ(10, first_view.size());

    EXPECT_EQ(nullptr, second_view.data());
    EXPECT_EQ(0u, second_view.size());
}

TEST( TEST_NAME, substr_throws_exception_when_invalid_start_index_used )
{
    // Given the predefined string.
    const char* some_cstring = "Dummy c-string";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // Then getting substr with too big start_index throws exception.
    EXPECT_THROW(some_sv.substr(30, 1), std::out_of_range);
    EXPECT_THROW(some_sv.substr(100, 2), std::out_of_range);
    EXPECT_THROW(some_sv.substr(1000, 3), std::out_of_range);
}

TEST( TEST_NAME, substr_without_count_takes_from_start_index_to_end_of_view )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium is cool!";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // When getting sub-view with valid start and npos-count.
    const auto start_index = 11u;
    auto shorter_view = some_sv.substr(start_index); // "is cool!"

    // Then obtained sub-view is valid.
    EXPECT_EQ(&some_cstring[11], shorter_view.data());
    EXPECT_EQ(8u, shorter_view.size());
}

TEST( TEST_NAME, substr_with_valid_start_and_count_returns_substr )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium generates nice code!";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // When getting sub-view with valid start and count.
    const auto start_index = 11u;
    const auto count = 9;

    auto shorter_view = some_sv.substr(start_index, count); // "generates"

    // Then obtained sub-view is valid.
    EXPECT_EQ(&some_cstring[11], shorter_view.data());
    EXPECT_EQ(9u, shorter_view.size());
}

TEST( TEST_NAME, substr_with_start_index_equals_size_returns_empty_view )
{
    // Given the predefined string.
    const char* some_cstring = "Gluecodium generates nice code!";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // When getting sub-view with start index equals size.
    auto shorter_view = some_sv.substr(some_sv.size());

    // Then obtained view is empty.
    EXPECT_TRUE(shorter_view.empty());
    EXPECT_EQ(0, shorter_view.size());
}

TEST( TEST_NAME, substr_with_length_zero_from_empty_view_returns_empty_view )
{
    // Given empty string view.
    string_view empty_sv{};

    // When trying to get substr using index 0.
    EXPECT_TRUE(empty_sv.substr(0u).empty());

    // When trying to get substr using index 1 then exception is raised.
    EXPECT_THROW(empty_sv.substr(1u), std::out_of_range);
}

TEST( TEST_NAME, copy_throws_exception_when_start_index_is_invalid )
{
    // Given the predefined string.
    const char* some_cstring = "Dummy c-string";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // Then invoking copy with too big start_index throws exception.
    const auto count = 5u;
    const auto start_index = 300;
    std::array<char, 128> buffer = {};

    EXPECT_THROW(some_sv.copy(buffer.data(), count, start_index), std::out_of_range);
}

TEST( TEST_NAME, start_index_defaults_to_zero_when_unspecified_and_copies_given_count )
{
    // Given the predefined string.
    const char* some_cstring = "Dummy c-string";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // When copying without specified start index.
    std::array<char, 128> buffer = {};
    auto copied_count = some_sv.copy(buffer.data(), 5);

    // Then first 5 letters are copied.
    EXPECT_EQ(5, copied_count);

    EXPECT_EQ('D', buffer[0]);
    EXPECT_EQ('u', buffer[1]);
    EXPECT_EQ('m', buffer[2]);
    EXPECT_EQ('m', buffer[3]);
    EXPECT_EQ('y', buffer[4]);
}

TEST( TEST_NAME, copy_starts_from_start_index_and_clamps_length )
{
    // Given the predefined string.
    const char* some_cstring = "Dummy c-string";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // When trying to copy 128 characters starting from index of `c-string`.
    std::array<char, 128> buffer = {};
    auto copied_count = some_sv.copy(buffer.data(), buffer.size(), 6u);

    // Then length is clamped and only available letters are copied.
    EXPECT_EQ(8, copied_count);

    EXPECT_EQ('c', buffer[0]);
    EXPECT_EQ('-', buffer[1]);
    EXPECT_EQ('s', buffer[2]);
    EXPECT_EQ('t', buffer[3]);
    EXPECT_EQ('r', buffer[4]);
    EXPECT_EQ('i', buffer[5]);
    EXPECT_EQ('n', buffer[6]);
    EXPECT_EQ('g', buffer[7]);
}

TEST( TEST_NAME, copy_is_not_performed_when_count_is_zero )
{
    // Given the predefined string.
    const char* some_cstring = "Dummy c-string";

    // And valid string view for whole sentence.
    string_view some_sv{some_cstring};

    // When trying to copy 0 characters starting from index of `c-string`.
    std::array<char, 128> buffer = {};
    auto copied_count = some_sv.copy(buffer.data(), 0, 6u);

    // Then no copy is performed.
    EXPECT_EQ(0u, copied_count);
    EXPECT_EQ('\0', buffer[0]);
}

TEST( TEST_NAME, copy_of_zero_bytes_from_empty_view_returns_zero )
{
    // Given empty string view.
    string_view empty_sv{};

    // When trying to copy 0 characters starting from 0 index.
    std::array<char, 128> buffer = {};
    auto copied_count = empty_sv.copy(buffer.data(), 0, 0);

    // Then no copy is performed.
    EXPECT_EQ(0u, copied_count);
}

TEST( TEST_NAME, compare_returns_zero_for_same_content )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Dummy c-string";
    const char some_cstring2[] = "Dummy c-string";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    // Then compare yields equality (0 indicates equal c-strings).
    EXPECT_EQ(0, first_sv.compare(second_sv));
    EXPECT_EQ(0, second_sv.compare(first_sv));
}

TEST( TEST_NAME, compare_returns_zero_for_self_comparison )
{
    // Given the predefined string.
    const char some_cstring[] = "Dummy c-string";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring[0]};

    // Then compare yields self-equality (0 indicates equal c-strings).
    EXPECT_EQ(0, first_sv.compare(first_sv));
}

TEST( TEST_NAME, compare_returns_lexicographical_comparison_result )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Dummy c-string";
    const char some_cstring2[] = "Another";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    // Then compare yields lexicographical comparison result
    EXPECT_GE(first_sv.compare(second_sv), 1);
    EXPECT_LE(second_sv.compare(first_sv), -1);
}

TEST( TEST_NAME, compare_works_properly_when_length_is_different_and_compared_content_same )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Another";
    const char some_cstring2[] = "Another day";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    // Then compare yields lexicographical comparison result and internally checks size.
    // Note: the compared content is identical (both c-strings have `Another` prefix) -- thus,
    // the function must compare size.
    EXPECT_LE(first_sv.compare(second_sv), -1);
    EXPECT_GE(second_sv.compare(first_sv), 1);
}

TEST( TEST_NAME, compare_empty_view_is_smaller_than_nonempty )
{
    // Given the predefined string.
    const char some_cstring[] = "123456789";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring[0]};

    // And empty string view.
    string_view second_sv{};

    // Then empty view is smaller than non-empty view.
    EXPECT_GE(first_sv.compare(second_sv), 1);
    EXPECT_LE(second_sv.compare(first_sv), -1);
}

TEST( TEST_NAME, compare_via_cstring_overload_returns_lexicographical_comparison_result )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Dummy c-string";
    const char some_cstring2[] = "Another";

    // And one valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};

    // Then compare yields lexicographical comparison result
    EXPECT_GE(first_sv.compare(some_cstring2), 1);
}

TEST( TEST_NAME, compare_pos_count_overload_yields_correct_result )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Another day";
    const char some_cstring2[] = "Another";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    // Then compare yields lexicographical comparison result equals 0.
    // Compare is executed for sub-view:
    //  - start_index = 0
    //  - count = 7
    EXPECT_EQ(first_sv.compare(0, 7, second_sv), 0);
}

TEST( TEST_NAME, compare_double_pos_count_overload_yields_correct_result )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Another day";
    const char some_cstring2[] = "Another";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    // Then compare yields lexicographical comparison result equals 0.
    // The overload for two sub-views is used.
    //
    // Compare is executed for sub-views ('not'):
    //  - start_index = 1
    //  - count = 3
    EXPECT_EQ(first_sv.compare(1, 3, second_sv, 1, 3), 0);
}

TEST( TEST_NAME, compare_sub_view_with_cstr_overload_yields_correct_result )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Another day";
    const char some_cstring2[] = "Another";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};

    // Then compare yields lexicographical comparison -- sub-view has same content but is shorter.
    // So, sub-view is smaller.
    //
    // The overload for sub-view vs c-string is used.
    EXPECT_LE(first_sv.compare(0, 3, &some_cstring2[0]), -1);
}

TEST( TEST_NAME, compare_sub_view_with_limiteD_cstr_overload_yields_correct_result )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Another day";
    const char some_cstring2[] = "Another";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};

    // Then compare yields lexicographical comparison -- sub-view has same content that limited c-str.
    //
    // The overload for sub-view vs limited c-string is used.
    // "Ano" vs "Ano"
    EXPECT_EQ(first_sv.compare(0, 3, &some_cstring2[0], 3), 0);
}

TEST( TEST_NAME, comparison_operators_yield_correct_results_for_same_value )
{
    // Given two valid string view with the same content.
    string_view first{"Hello"};
    string_view second{"Hello"};

    // Then comparison operators yield correct value.
    EXPECT_TRUE(first == second);
    EXPECT_TRUE(first <= second);
    EXPECT_TRUE(first >= second);

    EXPECT_FALSE(first != second);
    EXPECT_FALSE(first < second);
    EXPECT_FALSE(first > second);
}

TEST( TEST_NAME, self_comparison_using_equality_operators_yields_correct_value )
{
    // Given valid string view object.
    string_view some_sv = "Hello";

    // Then comparison operators (self-comparison) yield correct value.
    EXPECT_TRUE(some_sv == some_sv);
    EXPECT_TRUE(some_sv <= some_sv);
    EXPECT_TRUE(some_sv >= some_sv);

    EXPECT_FALSE(some_sv != some_sv);
    EXPECT_FALSE(some_sv < some_sv);
    EXPECT_FALSE(some_sv > some_sv);
}

TEST( TEST_NAME, comparison_operators_yield_correct_results_for_same_value_from_different_buffers )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Dummy c-string";
    const char some_cstring2[] = "Dummy c-string";

    // And valid string view for whole sentence.
    // Views point to different buffers.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    ASSERT_NE(first_sv.data(), second_sv.data());

    // Then comparison operators yield correct value.
    EXPECT_TRUE(first_sv == second_sv);
    EXPECT_TRUE(first_sv <= second_sv);
    EXPECT_TRUE(first_sv >= second_sv);

    EXPECT_FALSE(first_sv != second_sv);
    EXPECT_FALSE(first_sv < second_sv);
    EXPECT_FALSE(first_sv > second_sv);
}

TEST( TEST_NAME, comparison_operators_yield_correct_results_for_different_value_from_different_buffers_different_size )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Dummy c-string";
    const char some_cstring2[] = "Another dummy c-string";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    // Then comparison operators yield correct value.
    EXPECT_FALSE(first_sv == second_sv);
    EXPECT_FALSE(first_sv <= second_sv);
    EXPECT_TRUE(first_sv >= second_sv);

    EXPECT_TRUE(first_sv != second_sv);
    EXPECT_FALSE(first_sv < second_sv);
    EXPECT_TRUE(first_sv > second_sv);
}

TEST( TEST_NAME, comparison_operators_for_empty_view )
{
    // Given two views: empty and non-empty.
    string_view empty_view;
    string_view another_view{"x"};

    // Then comparison operators yield correct values.
    // Empty is "lower" than non-empty.
    EXPECT_FALSE(empty_view == another_view);
    EXPECT_TRUE(empty_view != another_view);

    EXPECT_TRUE(empty_view < another_view);
    EXPECT_TRUE(empty_view <= another_view);
    EXPECT_FALSE(empty_view > another_view);
    EXPECT_FALSE(empty_view >= another_view);

    EXPECT_FALSE(another_view < empty_view);
    EXPECT_FALSE(another_view <= empty_view);
    EXPECT_TRUE(another_view > empty_view);
    EXPECT_TRUE(another_view >= empty_view);
}

TEST( TEST_NAME, comparison_treats_shorter_common_cstr_as_smaller )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Another";
    const char some_cstring2[] = "Another day";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};
    string_view second_sv{&some_cstring2[0]};

    // Then compare yields lexicographical comparison result and internally checks size.
    // Shorter is considered smaller if both have common content.
    EXPECT_FALSE(first_sv == second_sv);
    EXPECT_TRUE(first_sv != second_sv);

    EXPECT_TRUE(first_sv < second_sv);
    EXPECT_TRUE(first_sv <= second_sv);
    EXPECT_FALSE(first_sv > second_sv);
    EXPECT_FALSE(first_sv >= second_sv);

    EXPECT_FALSE(second_sv < first_sv);
    EXPECT_FALSE(second_sv <= first_sv);
    EXPECT_TRUE(second_sv > first_sv);
    EXPECT_TRUE(second_sv >= first_sv);
}

TEST( TEST_NAME, string_view_can_be_compared_with_cstr )
{
    // Given two predefined strings.
    const char some_cstring1[] = "Another";
    const char* some_cstring2 = "Another day";

    // And valid string view for whole sentence.
    string_view first_sv{&some_cstring1[0]};

    // Then compare yields lexicographical comparison result and internally checks size.
    // Shorter is considered smaller if both have common content.
    // C-String can be directly compared with string_view.
    EXPECT_FALSE(first_sv == some_cstring2);
    EXPECT_TRUE(first_sv != some_cstring2);

    EXPECT_TRUE(first_sv < some_cstring2);
    EXPECT_TRUE(first_sv <= some_cstring2);
    EXPECT_FALSE(first_sv > some_cstring2);
    EXPECT_FALSE(first_sv >= some_cstring2);

    EXPECT_FALSE(some_cstring2 < first_sv);
    EXPECT_FALSE(some_cstring2 <= first_sv);
    EXPECT_TRUE(some_cstring2 > first_sv);
    EXPECT_TRUE(some_cstring2 >= first_sv);
}

TEST( TEST_NAME, basic_find_functionality )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // Then find properly returns indices of needles that are present.
    EXPECT_EQ(0u, some_sv.find(string_view{"Gluecodium"}));
    EXPECT_EQ(17u, some_sv.find(string_view{"interesting"}));
    EXPECT_EQ(some_sv.size() - 3u, some_sv.find(string_view{":-)"}));

    // And starts searching at given position.
    // Note: "is" is skipped by position -- thus we return "i" from "interesting".
    EXPECT_EQ(17u, some_sv.find(string_view{"i"}, 14));
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find(string_view{")"}, some_sv.size() - 1u));

    // And returns npos for needle that does not exist in the input text.
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{"This text does not exist..."}));

    // And starts searching at given position.
    // Npos returned -> "Gluecodium" is available only at the beginning.
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{"Gluecodium"}, 3));
}

TEST( TEST_NAME, find_function_when_whole_string_matches_needle_then_zero_is_returned )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching for whole string returns 0.
    EXPECT_EQ(0u, some_sv.find(string_view{"Gluecodium"}));
}

TEST( TEST_NAME, find_function_when_pos_grater_than_size_then_returns_npos )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching starting from invalid pos returns npos.
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{"Gluecodium"}, 50));
}

TEST( TEST_NAME, find_function_empty_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching for empty needle yields starting position.
    EXPECT_EQ(0u, some_sv.find(string_view{}));
    EXPECT_EQ(5u, some_sv.find(string_view{}, 5u));

    // But only if that position is smaller than or equal to size.
    EXPECT_EQ(some_sv.size(), some_sv.find(string_view{}, some_sv.size()));

    // In other cases npos is returned.
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{}, some_sv.size() + 1u));
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{}, some_sv.size() + 100u));
}

TEST( TEST_NAME, find_function_pos_equals_to_size_results_in_empty_input_range )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching for needle starting in size() results in npos.
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{"abc"}, some_sv.size()));
}

TEST( TEST_NAME, find_function_almost_matching_at_the_end_yields_npos )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching for needle starting in size()-2 results in npos.
    // Last two letters are "um" and we look for "ium".
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{"ium"}, some_sv.size() - 2));
}

TEST( TEST_NAME, find_function_almost_matching_with_longer_needle_yields_npos )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching for needle almost matching, but longer than input yields npos.
    EXPECT_EQ(string_view::npos, some_sv.find(string_view{"Gluecodium-Gradle"}));
}

TEST( TEST_NAME, find_function_finding_empty_needle_in_empty_input_yields_zero )
{
    // Given empty string view.
    string_view empty_sv{};

    // Then searching for empty needle yields zero.
    EXPECT_EQ(0, empty_sv.find(string_view{}));
}

TEST( TEST_NAME, find_function_finding_nonempty_needle_in_empty_input_yields_npos )
{
    // Given empty string view.
    string_view empty_sv{};

    // Then searching for non-empty needle yields npos.
    EXPECT_EQ(string_view::npos, empty_sv.find(string_view{"foo-bar"}));
}

TEST( TEST_NAME, find_function_single_char_can_be_searched )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching single characters is possible.
    EXPECT_EQ(0, some_sv.find('G'));
    EXPECT_EQ(2, some_sv.find('u'));

    // And start index can be set as parameter.
    EXPECT_EQ(8, some_sv.find('u', 3));
}

TEST( TEST_NAME, find_function_cstring_can_be_searched )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching c-strings directly is possible.
    EXPECT_EQ(0, some_sv.find("Glue"));
    EXPECT_EQ(2, some_sv.find("u"));

    // And start index can be set as parameter.
    EXPECT_EQ(8, some_sv.find("u", 3));
}

TEST( TEST_NAME, find_function_sub_cstring_can_be_searched )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then searching c-strings directly is possible.
    // Search starting at position 0, look for "Glue" (count = 4)
    EXPECT_EQ(0, some_sv.find("GlueXXX", 0, 4));

    // Search starting at position 0, look for "u" (count = 1)
    EXPECT_EQ(2, some_sv.find("uXYZ", 0, 1));

    // Search starting at position 0, look for "u" (count = 1)
    EXPECT_EQ(8, some_sv.find("u", 3, 1));
}

TEST( TEST_NAME, basic_find_first_of_functionality )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence from set is found.
    EXPECT_EQ(0u, some_sv.find_first_of(string_view{"G"})); // 'G' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_first_of(string_view{"xyzl"})); // 'l' in "Gluecodium"
    EXPECT_EQ(5u, some_sv.find_first_of(string_view{"oxyz"})); // 'o' in "Gluecodium"
    EXPECT_EQ(12u, some_sv.find_first_of(string_view{"s"})); // 's' in "is"

    // When looking for the set that does not contain any character from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{"XYZ"}));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(7u, some_sv.find_first_of(string_view{"ABCiXYZ"})); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_first_of(string_view{"ABCiXYZ"}, 8)); // 'i' in "is"
    EXPECT_EQ(17u, some_sv.find_first_of(string_view{"ABCiXYZ"}, 12)); // 'i' in "interesting"
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{"ABCiXYZ"}, 30));
}

TEST( TEST_NAME, find_first_of_uses_needle_view_as_set )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for the same set in different order.
    // Then both yield the same value.
    EXPECT_EQ(1u, some_sv.find_first_of(string_view{"xylz"})); // 'l' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_first_of(string_view{"lyzx"})); // 'l' in "Gluecodium"
}

TEST( TEST_NAME, find_first_of_can_have_duplicated_characters_in_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for needle that have multiple occurrences of the same letter then returns correct value.
    EXPECT_EQ(1u, some_sv.find_first_of(string_view{"lll"})); // 'l' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_first_of(string_view{"aaaallllllllaaaa"})); // 'l' in "Gluecodium"
}

TEST( TEST_NAME, find_first_of_last_valid_search_start_index )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for needle starting from size() - 1.
    const auto last_pos = some_sv.size() - 1u;
    EXPECT_EQ(last_pos, some_sv.find_first_of(string_view{"abc:de-f)"}, last_pos)); // ')' in ":-)"
}

TEST( TEST_NAME, find_first_of_invalid_start_index )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for needle starting from index greater equal to size() then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{"Glue :-)"}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{"Glue :-)"}, some_sv.size() + 10));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{"Glue :-)"}, some_sv.size() + 1000));
}

TEST( TEST_NAME, find_first_of_empty_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for empty needle then npos is always returned.
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{}));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{}, 5));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_first_of_empty_input )
{
    // Given empty string view.
    string_view some_sv{};

    // When looking for needle then npos is always returned.
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{}));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{"abc"}));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{"xyz"}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_first_of(string_view{":-)"}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_first_of_usage_of_null_terminator_in_ranges )
{
    // Given valid string view.
    char some_cstring[] = "Gluecodium\0is\0an\0interesting\0project\0:-)";
    string_view some_sv{&some_cstring[0], sizeof(some_cstring)};

    // When looking from the beginning then first occurrence from set is found.
    EXPECT_EQ(10u, some_sv.find_first_of(string_view{"X\0Y", 3})); // First occurrence of '\0'
    EXPECT_EQ(13u, some_sv.find_first_of(string_view{"X\0Y", 3}, 11u)); // Second occurrence of '\0'
    EXPECT_EQ(0, some_sv.find_first_of(string_view{"X\0G", 3})); // 'G' in "Gluecodium"
}

TEST( TEST_NAME, find_first_of_single_char_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence is found.
    EXPECT_EQ(0u, some_sv.find_first_of('G')); // 'G' in "Gluecodium"
    EXPECT_EQ(12u, some_sv.find_first_of('s')); // 's' in "is"

    // When looking for the letter that is not present in input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_first_of('X'));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(7u, some_sv.find_first_of('i')); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_first_of('i', 8)); // 'i' in "is"
    EXPECT_EQ(17u, some_sv.find_first_of('i', 12)); // 'i' in "interesting"
    EXPECT_EQ(string_view::npos, some_sv.find_first_of('i', 30));
}

TEST( TEST_NAME, find_first_of_cstring_pos_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence is found.
    EXPECT_EQ(0u, some_sv.find_first_of("G")); // 'G' in "Gluecodium"
    EXPECT_EQ(12u, some_sv.find_first_of("s")); // 's' in "is"

    // When looking for the letter that is not present in input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_first_of("X"));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(7u, some_sv.find_first_of("i")); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_first_of("i", 8)); // 'i' in "is"
    EXPECT_EQ(17u, some_sv.find_first_of("i", 12)); // 'i' in "interesting"
    EXPECT_EQ(string_view::npos, some_sv.find_first_of("i", 30));
}

TEST( TEST_NAME, find_first_of_cstring_pos_count_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence is found.
    // Pos = 0, count = 1.
    EXPECT_EQ(0u, some_sv.find_first_of("G", 0, 1)); // 'G' in "Gluecodium"
    EXPECT_EQ(12u, some_sv.find_first_of("s", 0, 1)); // 's' in "is"

    // When looking for the letter that is not present in input then npos returned.
    // Pos = 0, count = 1.
    EXPECT_EQ(string_view::npos, some_sv.find_first_of("X", 0, 1));

    // When looking for the same set with different starting position, then start index matters.
    // Pos = P, count = C (to include 'i').
    EXPECT_EQ(7u, some_sv.find_first_of("XiZ", 0, 2)); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_first_of("ZiX", 8, 2)); // 'i' in "is"
    EXPECT_EQ(17u, some_sv.find_first_of("QHi", 12, 3)); // 'i' in "interesting"
    EXPECT_EQ(string_view::npos, some_sv.find_first_of("iZQ", 30, 1));
}

TEST( TEST_NAME, find_vs_rfind_repeated_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project. Gluecodium is cool!"};

    // Then find searches from left and rfind from right.
    EXPECT_EQ(0u, some_sv.find(string_view{"Gluecodium"})); // (searching from left to right)
    EXPECT_EQ(38u, some_sv.rfind(string_view{"Gluecodium"})); // (searching from right to left)
}

TEST( TEST_NAME, basic_rfind_functionality )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project. Gluecodium is cool!"};

    // Then rfind properly returns indices of needles that are present.
    // When 'pos' not specified, then default of 'npos' is used -- meaning searching whole input.
    EXPECT_EQ(38u, some_sv.rfind(string_view{"Gluecodium"})); // (searching from right to left)
    EXPECT_EQ(17u, some_sv.rfind(string_view{"interesting"}));
    EXPECT_EQ(some_sv.size() - 5u, some_sv.rfind(string_view{"cool!"}));
    EXPECT_EQ(some_sv.size() - 1u, some_sv.rfind(string_view{"!"}));

    // And starts searching at given position when pos specified.
    // Note: "interesting" is skipped by position -- thus we return "i" from "is".
    // Note: second "Gluecodium" is skipped by position.
    EXPECT_EQ(11u, some_sv.rfind(string_view{"i"}, 16));
    EXPECT_EQ(0u, some_sv.rfind(string_view{"Gluecodium"}, 30u));

    // And returns npos for needle that does not exist in the input text.
    EXPECT_EQ(string_view::npos, some_sv.rfind(string_view{"This text does not exist..."}));
}

TEST( TEST_NAME, rfind_full_match_returns_zero )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // Then full match returns 0.
    EXPECT_EQ(0u, some_sv.rfind(string_view{"Gluecodium"}));
}

TEST( TEST_NAME, rfind_when_substr_occurrence_starts_at_pos_then_it_is_found )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is cool!"};

    // Then "cool" is matched, even though position points to 'c'.
    // Note: we search from right to left, but in reality the searched range indicates start
    // of the sub-view. Thus internal implementation should check pos + the size of needle and
    // clamp the max search region to avoid out-of-bound access.
    EXPECT_EQ(14u, some_sv.rfind(string_view{"cool"}, 14u));

    // Then "cool" is matched, even though position points to '!'. Check for out of bound and clamping.
    EXPECT_EQ(14u, some_sv.rfind(string_view{"cool"}, some_sv.size() - 1u));

    // Then "Gluecodium" is matched, even though position points to 'G'.
    EXPECT_EQ(0u, some_sv.rfind(string_view{"Gluecodium"}, 0u));
}

TEST( TEST_NAME, rfind_pos_greater_than_size_means_whole_string_search )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is cool or even cooler!"};

    // When passing pos that is bigger than size().
    // Then the occurrence of 'cool' in 'cooler' is found (first from right).
    EXPECT_EQ(27u, some_sv.rfind(string_view{"cool"}, some_sv.size() + 10000u));
}

TEST( TEST_NAME, rfind_empty_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is cool or even cooler!"};

    // When looking for empty view.
    EXPECT_EQ(some_sv.size(), some_sv.rfind(string_view{}));
    EXPECT_EQ(2u, some_sv.rfind(string_view{}, 2));
    EXPECT_EQ(0u, some_sv.rfind(string_view{}, 0));
}

TEST( TEST_NAME, rfind_empty_input )
{
    // Given empty string view.
    string_view some_sv{};

    // When looking for non-empty view then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.rfind(string_view{"NEEDLE"}));
}

TEST( TEST_NAME, rfind_empty_needle_and_empty_input )
{
    // Given empty string view.
    string_view empty_sv{};

    // When looking for empty view.
    // Then size() is returned --> 0.
    EXPECT_EQ(0u, empty_sv.size());
    EXPECT_EQ(empty_sv.size(), empty_sv.rfind(string_view{}));
}

TEST( TEST_NAME, rfind_needle_longer_than_sentence )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium"};

    // When looking for longer needle: "Gluecodium_ver_15" then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.rfind(string_view{"Gluecodium_ver_15"}));
}

TEST( TEST_NAME, rfind_usage_of_null_terminator_in_ranges )
{
    // Given valid string view.
    char some_cstring[] = "Gluecodium\0is\0an\0interesting\0project\0:-)";
    string_view some_sv{&some_cstring[0], sizeof(some_cstring)};

    // When searching from right to left.
    EXPECT_EQ(28u, some_sv.rfind(string_view{"\0p", 2}));
    EXPECT_EQ(11u, some_sv.find_first_of(string_view{"\0is", 3}, 11u));
}

TEST( TEST_NAME, rfind_single_character_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project. Gluecodium is cool!"};

    // Then rfind properly returns indices of needles that are present.
    // When 'pos' not specified, then default of 'npos' is used -- meaning searching whole input.
    EXPECT_EQ(38u, some_sv.rfind('G')); // (searching from right to left)
    EXPECT_EQ(some_sv.size() - 5u, some_sv.rfind('c'));
    EXPECT_EQ(some_sv.size() - 1u, some_sv.rfind('!'));

    // And starts searching at given position when pos specified.
    // Note: second "Gluecodium" is skipped by position.
    EXPECT_EQ(0u, some_sv.rfind('G', 30u));

    // And returns npos for needle that does not exist in the input text.
    EXPECT_EQ(string_view::npos, some_sv.rfind('Z'));
}

TEST( TEST_NAME, rfind_cstring_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project. Gluecodium is cool!"};

    // Then rfind properly returns indices of needles that are present.
    // When 'pos' not specified, then default of 'npos' is used -- meaning searching whole input.
    EXPECT_EQ(38u, some_sv.rfind("Gluecodium")); // (searching from right to left)
    EXPECT_EQ(17u, some_sv.rfind("interesting"));
    EXPECT_EQ(some_sv.size() - 5u, some_sv.rfind("cool!"));
    EXPECT_EQ(some_sv.size() - 1u, some_sv.rfind("!"));

    // And starts searching at given position when pos specified.
    // Note: "interesting" is skipped by position -- thus we return "i" from "is".
    // Note: second "Gluecodium" is skipped by position.
    EXPECT_EQ(11u, some_sv.rfind("i", 16));
    EXPECT_EQ(0u, some_sv.rfind("Gluecodium", 30u));

    // And returns npos for needle that does not exist in the input text.
    EXPECT_EQ(string_view::npos, some_sv.rfind("This text does not exist..."));
}

TEST( TEST_NAME, rfind_cstring_pos_count_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project. Gluecodium is cool!"};

    // Then rfind properly returns indices of needles that are present.
    EXPECT_EQ(38u, some_sv.rfind("Glue123", some_sv.size(), 4)); // (searching from right to left for "Glue")
    EXPECT_EQ(17u, some_sv.rfind("interesting", some_sv.size(), 3)); // looking for "int"

    // And starts searching at given position when pos specified.
    // Note: "interesting" is skipped by position -- thus we return "i" from "is".
    // Note: second "Gluecodium" is skipped by position.
    EXPECT_EQ(11u, some_sv.rfind("iABCDEFGH", 16, 1)); // single "i"

    // And returns npos for needle that does not exist in the input text.
    EXPECT_EQ(string_view::npos, some_sv.rfind("This text does not exist...", some_sv.size(), 4)); // "This"
}

TEST( TEST_NAME, basic_find_last_of_functionality )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the end then first occurrence from set is found.
    EXPECT_EQ(0u, some_sv.find_last_of(string_view{"G"})); // 'G' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_last_of(string_view{"xyzl"})); // 'l' in "Gluecodium"
    EXPECT_EQ(31u, some_sv.find_last_of(string_view{"oxyz"})); // 'o' in "project"
    EXPECT_EQ(23u, some_sv.find_last_of(string_view{"s"})); // 's' in "interesting"
    EXPECT_EQ(23u, some_sv.find_last_of(string_view{"s"}, some_sv.size() + 100u)); // 's' in "interesting"
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_of(string_view{")"})); // ')' in ":-)"

    // When looking for the set that does not contain any character from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{"XYZ"}));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(25u, some_sv.find_last_of(string_view{"ABCiXYZ"})); // Second 'i' in "interesting"
    EXPECT_EQ(7u, some_sv.find_last_of(string_view{"ABCiXYZ"}, 7)); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_last_of(string_view{"ABCiXYZ"}, 13)); // 'i' in "is"
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{"ABCiXYZ"}, 0));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_of(string_view{"Giz"}, 0));
}

TEST( TEST_NAME, find_last_of_can_have_duplicated_characters_in_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for needle that have multiple occurrences of the same letter then returns correct value.
    EXPECT_EQ(1u, some_sv.find_last_of(string_view{"lll"})); // 'l' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_last_of(string_view{"GGGllllllllGGG"})); // 'l' in "Gluecodium"
}

TEST( TEST_NAME, find_last_of_empty_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for empty needle then npos is always returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{}));
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{}, 5));
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_last_of_empty_input )
{
    // Given empty string view.
    string_view some_sv{};

    // When looking for needle then npos is always returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{}));
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{"abc"}));
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{"xyz"}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_last_of(string_view{":-)"}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_last_of_single_char_input )
{
    // Given valid string view.
    string_view some_sv{"Q"};

    // When looking for long needle that contains 'Q' (set) then index 0 returned.
    EXPECT_EQ(0u, some_sv.find_last_of(string_view{"abcQWERTY"}));
}

TEST( TEST_NAME, find_last_of_usage_of_null_terminator_in_ranges )
{
    // Given valid string view.
    // Note: the input string has null termination. Drop it by -1.
    char some_cstring[] = "Gluecodium\0is\0an\0interesting\0project\0:-)";
    string_view some_sv{&some_cstring[0], sizeof(some_cstring) - 1u};

    // When looking from the end then first occurrence from set is found.
    EXPECT_EQ(36, some_sv.find_last_of(string_view{"X\0Y", 3})); // Last occurrence of '\0'.
    EXPECT_EQ(13u, some_sv.find_last_of(string_view{"X\0Y", 3}, 15u)); // Second occurrence of '\0'
    EXPECT_EQ(0u, some_sv.find_last_of(string_view{"X\0G", 3}, 5)); // 'G' in "Gluecodium"
}

TEST( TEST_NAME, find_last_of_single_char_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the end then first occurrence from set is found.
    EXPECT_EQ(0u, some_sv.find_last_of('G')); // 'G' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_last_of('l')); // 'l' in "Gluecodium"
    EXPECT_EQ(31u, some_sv.find_last_of('o')); // 'o' in "project"
    EXPECT_EQ(23u, some_sv.find_last_of('s')); // 's' in "interesting"
    EXPECT_EQ(23u, some_sv.find_last_of('s', some_sv.size() + 100u)); // 's' in "interesting"
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_of(')')); // ')' in ":-)"

    // When looking for the set that does not contain the character from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_of('X'));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(25u, some_sv.find_last_of('i')); // Second 'i' in "interesting"
    EXPECT_EQ(7u, some_sv.find_last_of('i', 7)); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_last_of('i', 13)); // 'i' in "is"
    EXPECT_EQ(string_view::npos, some_sv.find_last_of('i', 0));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_of('G', 0));
}

TEST( TEST_NAME, find_last_of_cstring_pos_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the end then first occurrence from set is found.
    EXPECT_EQ(0u, some_sv.find_last_of("G")); // 'G' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_last_of("xyzl")); // 'l' in "Gluecodium"
    EXPECT_EQ(31u, some_sv.find_last_of("oxyz")); // 'o' in "project"
    EXPECT_EQ(23u, some_sv.find_last_of("s")); // 's' in "interesting"
    EXPECT_EQ(23u, some_sv.find_last_of("s", some_sv.size() + 100u)); // 's' in "interesting"
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_of(")")); // ')' in ":-)"

    // When looking for the set that does not contain any character from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_of("XYZ"));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(25u, some_sv.find_last_of("ABCiXYZ")); // Second 'i' in "interesting"
    EXPECT_EQ(7u, some_sv.find_last_of("ABCiXYZ", 7)); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_last_of("ABCiXYZ", 13)); // 'i' in "is"
    EXPECT_EQ(string_view::npos, some_sv.find_last_of("ABCiXYZ", 0));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_of("Giz", 0));
}

TEST( TEST_NAME, find_last_of_cstring_pos_count_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the end then first occurrence from set is found.
    // pos = npos (to look whole string), count = C.
    EXPECT_EQ(0u, some_sv.find_last_of("G", string_view::npos, 1)); // 'G' in "Gluecodium"
    EXPECT_EQ(1u, some_sv.find_last_of("xlyz", string_view::npos, 2)); // 'l' in "Gluecodium"
    EXPECT_EQ(31u, some_sv.find_last_of("oxyz", string_view::npos, 3)); // 'o' in "project"
    EXPECT_EQ(23u, some_sv.find_last_of("s", string_view::npos, 1)); // 's' in "interesting"
    EXPECT_EQ(23u, some_sv.find_last_of("s", some_sv.size() + 100u, 1)); // 's' in "interesting"
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_of(")", string_view::npos, 1)); // ')' in ":-)"

    // When looking for the set that does not contain any character from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_of("XYZ", string_view::npos, 1));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(25u, some_sv.find_last_of("ABCiXYZ", string_view::npos, 4)); // Second 'i' in "interesting"
    EXPECT_EQ(7u, some_sv.find_last_of("iXYZ", 7, 1)); // 'i' in "Gluecodium"
    EXPECT_EQ(11u, some_sv.find_last_of("ABCiXYZ", 13, 4)); // 'i' in "is"
    EXPECT_EQ(string_view::npos, some_sv.find_last_of("ABCXYiZ", 0, 6));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_of("Giz", 0, 1));
}

TEST( TEST_NAME, basic_find_last_not_of_functionality )
{
    // Given valid string view.
    string_view some_sv{"G____G____G____G____ABC____G____G____G____G"};

    // When looking from the end then first occurrence not from the set is found.
    EXPECT_EQ(21u, some_sv.find_last_not_of(string_view{"G_C"})); // 'B'
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of(string_view{"ABC"})); // 'G'
    EXPECT_EQ(some_sv.size() - 2u, some_sv.find_last_not_of(string_view{"G"})); // '_'
    EXPECT_EQ(20u, some_sv.find_last_not_of(string_view{"BGC_"})); // 'A'
    EXPECT_EQ(20u, some_sv.find_last_not_of(string_view{"BGC_"}, some_sv.size() + 100u)); // 'A'

    // When looking for the set that contains all characters from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of(string_view{"BGC_A"}));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of(string_view{"_"}));
    EXPECT_EQ(some_sv.size() - 6u, some_sv.find_last_not_of(string_view{"_"}, some_sv.size() - 2u));
    EXPECT_EQ(some_sv.size() - 11u, some_sv.find_last_not_of(string_view{"_"}, some_sv.size() - 8u));

    // When looking into prefix and all characters present in set then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of(string_view{"G"}, 0));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_not_of(string_view{"_"}, 0));
}

TEST( TEST_NAME, find_last_not_of_empty_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for empty needle then position is returned.
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of(string_view{}));
    EXPECT_EQ(5u, some_sv.find_last_not_of(string_view{}, 5));
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of(string_view{}, some_sv.size()));
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of(string_view{}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_last_not_of_empty_input )
{
    // Given empty string view.
    string_view some_sv{};

    // When looking for needle then npos is always returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of(string_view{}));
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of(string_view{"abc"}));
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of(string_view{"xyz"}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of(string_view{":-)"}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_last_not_of_single_char_input )
{
    // Given valid string view.
    string_view some_sv{"Q"};

    // When looking for long needle that does not contain 'Q' then index 0 returned.
    EXPECT_EQ(0u, some_sv.find_last_not_of(string_view{"abc123"}));
}

TEST( TEST_NAME, find_last_not_of_can_have_duplicated_characters_in_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for needle that have multiple occurrences of the same letter then returns correct value.
    EXPECT_EQ(some_sv.size() - 3u, some_sv.find_last_not_of(string_view{")))---"}));
    EXPECT_EQ(some_sv.size() - 6u, some_sv.find_last_not_of(string_view{"   ----))))):::::ttt"}));
}

TEST( TEST_NAME, find_last_not_of_usage_of_null_terminator_in_ranges )
{
    // Given valid string view.
    // Note: the input string has null termination. Drop it by -1.
    char some_cstring[] = "Gluecodium\0is\0an\0interesting\0project\0:-)";
    string_view some_sv{&some_cstring[0], sizeof(some_cstring) - 1u};

    // When looking from the end then first occurrence from set is found.
    EXPECT_EQ(some_sv.size() - 8u, some_sv.find_last_not_of(string_view{")-\0:tce", 7}));
    EXPECT_EQ(12u, some_sv.find_last_not_of(string_view{"n\0a", 3}, 15u)); // "s" in "is"
    EXPECT_EQ(13u, some_sv.find_last_not_of(string_view{"naG", 3}, 15)); // nullterminator before "an"
}

TEST( TEST_NAME, find_last_not_of_single_char_overload )
{
    // Given valid string view.
    string_view some_sv{"G____G____G____G____ABC____G____G____G____GGGGG"};

    // When looking from the end then first occurrence not from the set is found.
    EXPECT_EQ(some_sv.size() - 6u, some_sv.find_last_not_of('G')); // '_'
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of('A')); // 'G'
    EXPECT_EQ(some_sv.size() - 6u, some_sv.find_last_not_of('G', some_sv.size() + 100u)); // '_'

    // When looking for the set that contains all characters from input then npos returned.
    string_view another_sv{"AAAAAAAAAA"};
    EXPECT_EQ(string_view::npos, another_sv.find_last_not_of('A'));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of('_'));
    EXPECT_EQ(some_sv.size() - 10u, some_sv.find_last_not_of('_', some_sv.size() - 6u));
    EXPECT_EQ(some_sv.size() - 15u, some_sv.find_last_not_of('_', some_sv.size() - 11u));

    // When looking into prefix and all characters present in set then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of('G', 0));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_not_of('_', 0));
}

TEST( TEST_NAME, find_last_not_of_cstring_pos_overload )
{
    // Given valid string view.
    string_view some_sv{"G____G____G____G____ABC____G____G____G____G"};

    // When looking from the end then first occurrence not from the set is found.
    EXPECT_EQ(21u, some_sv.find_last_not_of("G_C")); // 'B'
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of("ABC")); // 'G'
    EXPECT_EQ(some_sv.size() - 2u, some_sv.find_last_not_of("G")); // '_'
    EXPECT_EQ(20u, some_sv.find_last_not_of("BGC_")); // 'A'
    EXPECT_EQ(20u, some_sv.find_last_not_of("BGC_", some_sv.size() + 100u)); // 'A'

    // When looking for the set that contains all characters from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of("BGC_A"));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of("_"));
    EXPECT_EQ(some_sv.size() - 6u, some_sv.find_last_not_of("_", some_sv.size() - 2u));
    EXPECT_EQ(some_sv.size() - 11u, some_sv.find_last_not_of("_", some_sv.size() - 8u));

    // When looking into prefix and all characters present in set then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of("G", 0));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_not_of("_", 0));
}

TEST( TEST_NAME, find_last_not_of_cstring_pos_count_overload )
{
    // Given valid string view.
    string_view some_sv{"G____G____G____G____ABC____G____G____G____G"};

    // When looking from the end then first occurrence not from the set is found.
    // Pos = npos, count = C.
    EXPECT_EQ(21u, some_sv.find_last_not_of("G_C", string_view::npos, 3)); // 'B'
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of("ABC", string_view::npos, 3)); // 'G'
    EXPECT_EQ(some_sv.size() - 2u, some_sv.find_last_not_of("G", string_view::npos, 1)); // '_'
    EXPECT_EQ(20u, some_sv.find_last_not_of("BGC_", string_view::npos, 4)); // 'A'
    EXPECT_EQ(20u, some_sv.find_last_not_of("BGC_", some_sv.size() + 100u, 4)); // 'A'

    // When looking for the set that contains all characters from input then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of("BGC_A", string_view::npos, 5));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(some_sv.size() - 1u, some_sv.find_last_not_of("_", string_view::npos, 1));
    EXPECT_EQ(some_sv.size() - 6u, some_sv.find_last_not_of("_", some_sv.size() - 2u, 1));
    EXPECT_EQ(some_sv.size() - 11u, some_sv.find_last_not_of("_", some_sv.size() - 8u, 1));

    // When looking into prefix and all characters present in set then npos returned.
    EXPECT_EQ(string_view::npos, some_sv.find_last_not_of("G", 0, 1));

    // When looking starting at the beginning then only first letter allowed.
    EXPECT_EQ(0u, some_sv.find_last_not_of("_", 0, 1));
}

TEST( TEST_NAME, basic_find_first_not_of_functionality )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence that is not in the set is returned.
    EXPECT_EQ(1u, some_sv.find_first_not_of(string_view{"G"})); // 'l' in "Gluecodium"
    EXPECT_EQ(4u, some_sv.find_first_not_of(string_view{"lGeu"})); // 'c' in "Gluecodium"
    EXPECT_EQ(10u, some_sv.find_first_not_of(string_view{"lGuedoiumc"})); // ' ' after "Gluecodium"

    // When looking for the set that contains all characters from input then npos returned.
    string_view another_sv{"XYZZYXXYZZYXXXXXXZZZZZYYYYYY"};
    EXPECT_EQ(string_view::npos, another_sv.find_first_not_of(string_view{"XYZ"}));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(7u, some_sv.find_first_not_of(string_view{"doclueG"})); // 'i' in "Gluecodium"
    EXPECT_EQ(9u, some_sv.find_first_not_of(string_view{"doclueG"}, 8)); // 'm' in "Gluecodium"
    EXPECT_EQ(21u, some_sv.find_first_not_of(string_view{"doclueG"}, 20)); // 'r' in "interesting"
}

TEST( TEST_NAME, find_first_not_of_empty_needle )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking for empty needle then position is returned.
    EXPECT_EQ(0, some_sv.find_first_not_of(string_view{}));
    EXPECT_EQ(5u, some_sv.find_first_not_of(string_view{}, 5));
    EXPECT_EQ(string_view::npos, some_sv.find_first_not_of(string_view{}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_first_not_of(string_view{}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_first_not_of_empty_input )
{
    // Given empty string view.
    string_view some_sv{};

    // When looking for needle then npos is always returned.
    EXPECT_EQ(string_view::npos, some_sv.find_first_not_of(string_view{}));
    EXPECT_EQ(string_view::npos, some_sv.find_first_not_of(string_view{"abc"}));
    EXPECT_EQ(string_view::npos, some_sv.find_first_not_of(string_view{"xyz"}, some_sv.size()));
    EXPECT_EQ(string_view::npos, some_sv.find_first_not_of(string_view{":-)"}, some_sv.size() + 5));
}

TEST( TEST_NAME, find_first_not_of_functionality_single_character_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence that is not in the set is returned.
    EXPECT_EQ(1u, some_sv.find_first_not_of('G')); // 'l' in "Gluecodium"
    EXPECT_EQ(2u, some_sv.find_first_not_of('G', 2u)); // 'u' in "Gluecodium"

    // When looking for the set that contains all characters from input then npos returned.
    string_view another_sv{"XXXXXXXXXXXX"};
    EXPECT_EQ(string_view::npos, another_sv.find_first_not_of('X'));
}

TEST( TEST_NAME, find_first_not_of_functionality_cstring_pos_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence that is not in the set is returned.
    EXPECT_EQ(1u, some_sv.find_first_not_of("G")); // 'l' in "Gluecodium"
    EXPECT_EQ(4u, some_sv.find_first_not_of("lGeu")); // 'c' in "Gluecodium"
    EXPECT_EQ(10u, some_sv.find_first_not_of("lGuedoiumc")); // ' ' after "Gluecodium"

    // When looking for the set that contains all characters from input then npos returned.
    string_view another_sv{"XYZZYXXYZZYXXXXXXZZZZZYYYYYY"};
    EXPECT_EQ(string_view::npos, another_sv.find_first_not_of("XYZ"));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(7u, some_sv.find_first_not_of("doclueG")); // 'i' in "Gluecodium"
    EXPECT_EQ(9u, some_sv.find_first_not_of("doclueG", 8)); // 'm' in "Gluecodium"
    EXPECT_EQ(21u, some_sv.find_first_not_of("doclueG", 20)); // 'r' in "interesting"
}

TEST( TEST_NAME, find_first_not_of_cstring_pos_count_overload )
{
    // Given valid string view.
    string_view some_sv{"Gluecodium is an interesting project :-)"};

    // When looking from the beginning then first occurrence that is not in the set is returned.
    EXPECT_EQ(1u, some_sv.find_first_not_of("G", 0, 1)); // 'l' in "Gluecodium"
    EXPECT_EQ(4u, some_sv.find_first_not_of("lGeu", 0, 4)); // 'c' in "Gluecodium"
    EXPECT_EQ(10u, some_sv.find_first_not_of("lGuedoiumc", 0, 10)); // ' ' after "Gluecodium"

    // When looking for the set that contains all characters from input then npos returned.
    string_view another_sv{"XYZZYXXYZZYXXXXXXZZZZZYYYYYY"};
    EXPECT_EQ(string_view::npos, another_sv.find_first_not_of("XYZ", 0, 3));

    // When looking for the same set with different starting position, then start index matters.
    EXPECT_EQ(7u, some_sv.find_first_not_of("doclueG", 0, 7)); // 'i' in "Gluecodium"
    EXPECT_EQ(9u, some_sv.find_first_not_of("doclueG", 8, 7)); // 'm' in "Gluecodium"
    EXPECT_EQ(21u, some_sv.find_first_not_of("doclueG", 20, 7)); // 'r' in "interesting"
}

} // namespace test
