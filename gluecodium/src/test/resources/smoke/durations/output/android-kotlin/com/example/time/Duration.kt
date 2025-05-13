/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.example.time

/**
 * Represents duration in time (both positive and negative).
 *
 * The duration is represented as number of seconds (see [Duration.getSeconds])
 * and number of nanoseconds in a second (see [Duration.getNano]).
 *
 * Duration can be created from various units of time by calling on of
 * `of*` methods. The `to*` family of methods convert duration
 * to a value expressed in desired unit of time.
 */
public class Duration private constructor(private var mSeconds: Long, private var mNanos: Int) : Comparable<Duration> {

    /**
     *
     * @return The nanoseconds component of this duration.
     */
    public fun getNano(): Int {
        return mNanos;
    }

    /**
     *
     * @return The seconds component of this duration.
     */
    public fun getSeconds(): Long {
        return mSeconds;
    }

    /**
     * Converts this duration to nanoseconds.
     *
     * @return Total number of nanoseconds in this duration.
     * @throws ArithmeticException if the resulting value cannot be represented
     *                             by `long` type.
     */
    @Throws(ArithmeticException::class)
    public fun toNanos(): Long {
        return exactAdd(exactMultiply(mSeconds, NANOS_PER_SECOND), mNanos.toLong());
    }

    /**
     * Gets the nanoseconds part of this duration. Equals to [Duration.getNano].
     *
     * @return The nanoseconds part of this duration, value from 0 to 999999999.
     */
    public fun toNanosPart(): Int {
        return mNanos;
    }

    /**
     * Converts this duration to milliseconds. Any data past milliseconds precision is
     * simply discarded. There is no mathematical rounding, so a duration
     * of 999999 nanoseconds will still be converted to 0 milliseconds.
     *
     * @return Total number of milliseconds in this duration.
     * @throws ArithmeticException if the resulting value cannot be represented
     *                             by `long` type.
     */
    @Throws(ArithmeticException::class)
    public fun toMillis(): Long {
        return exactAdd(exactMultiply(mSeconds, MILLIS_PER_SECOND), (mNanos / NANOS_PER_MILLIS).toLong());
    }

    /**
     * Gets the milliseconds part of this duration.
     *
     * @return The milliseconds part of this duration.
     */
    public fun toMillisPart(): Int {
        return mNanos / NANOS_PER_MILLIS;
    }

    /**
     * Converts this duration to seconds. Any data past seconds precision is
     * simply discarded. There is no mathematical rounding, so a duration
     * of 999 milliseconds will still be converted to 0 seconds.
     *
     * @return Total number of seconds in this duration.
     */
    public fun toSeconds(): Long {
        return mSeconds;
    }

    /**
     * Gets the seconds part of this duration.
     *
     * @return The seconds part of this duration, value from 0 to 59.
     */
    public fun toSecondsPart(): Int {
        return (mSeconds % 60).toInt();
    }

    /**
     * Converts this duration to minutes. Any data past minute precision is
     * simply discarded. There is no mathematical rounding, so a duration
     * of 59 seconds and 999 milliseconds will still be converted to 0 minutes.
     *
     * @return Total number of minutes in this duration.
     */
    public fun toMinutes(): Long {
        return mSeconds / 60;
    }

    /**
     * Gets the minutes part of this duration.
     *
     * @return The minutes part of this duration, value from 0 to 59.
     */
    public fun toMinutesPart(): Int {
        return (toMinutes() % 60).toInt();
    }

    /**
     *
     * Converts this duration to hours. Any data past hour precision is
     * simply discarded. There is no mathematical rounding, so a duration
     * of 59 minutes and 59 seconds will still be converted to 0 hours.
     *
     * @return The number of full hours in this duration.
     */
    public fun toHours(): Long {
        return toMinutes() / 60;
    }

    /**
     * Gets the hours part of this duration.
     *
     * @return The hours part of this duration, value from 0 to 23.
     */
    public fun toHoursPart(): Int {
        return (toHours() % 24).toInt();
    }

    /**
     * Converts this duration to days. Any data past day precision is
     * simply discarded. There is no mathematical rounding, so a duration
     * of 23 hours 59 minutes and 59 seconds will still be converted to 0 days.
     * Day is always assumed to be 24 hours.
     *
     * @return The number of full days in this duration.
     */
    public fun toDays(): Long {
        return toHours() / 24;
    }

    /**
     * Same as [Duration.toDays].
     *
     * @return The number of full days in this duration.
     */
    public fun toDaysPart(): Long {
        return toDays();
    }

    public override fun compareTo(other: Duration): Int {
        var result: Int = 0;
        if (mSeconds < other.mSeconds) {
            result = -1;
        } else if (mSeconds > other.mSeconds) {
            result = 1;
        }
        if (result == 0) {
            if (mNanos < other.mNanos) {
                result = -1;
            } else if (mNanos > other.mNanos) {
                result = 1;
            }
        }
        return result;
    }

    public override fun equals(other: Any?): Boolean {
        if (this === other) {
            return true
        }

        if (other === null || (this::class != other::class)) {
            return false
        }

        var duration: Duration = other as Duration
        return mSeconds == duration.mSeconds && mNanos == duration.mNanos;
    }

    override public fun hashCode(): Int {
        return java.util.Objects.hash(mSeconds, mNanos);
    }

    companion object {
        private val NANOS_PER_SECOND: Long = 1000000000;
        private val NANOS_PER_MILLIS: Int = 1000000;
        private val MILLIS_PER_SECOND: Long = 1000;

        @JvmStatic @Throws(ArithmeticException::class)
        private fun exactAdd(v1: Long, v2: Long): Long {
            if (v2 < 0 && v1 < (Long.MIN_VALUE - v2)) {
                throw ArithmeticException("Integer underflow");
            } else if (v2 > 0 && v1 > (Long.MAX_VALUE - v2)) {
                throw ArithmeticException("Integer overflow");
            }
            return v1 + v2;
        }

        @JvmStatic @Throws(ArithmeticException::class)
        private fun exactMultiply(v1: Long, v2: Long): Long {
            if ((v2 == -1L && v1 == Long.MIN_VALUE) || (v1 == -1L && v2 == Long.MIN_VALUE)) {
                throw ArithmeticException("Integer overflow");
            }
            if (v2 > 0 && v1 > (Long.MAX_VALUE / v2)) {
                throw ArithmeticException("Integer overflow");
            }
            if (v2 > 0 && v1 < (Long.MIN_VALUE / v2)) {
                throw ArithmeticException("Integer underflow");
            }
            if (v2 < -1 && v1 > (Long.MIN_VALUE / v2)) {
                throw ArithmeticException("Integer underflow");
            }
            if (v2 < -1 && v1 < (Long.MAX_VALUE / v2)) {
                throw ArithmeticException("Integer overflow");
            }
            return v1 * v2;
        }

        @JvmStatic
        private fun divFloor(x: Long, y: Long): Long {
            var result = x / y;
            if ((x xor y) < 0 && ((result * y) != x)) {
                result--;
            }
            return result;
        }

        @JvmStatic
        private fun modFloor(x: Long, y: Long): Long {
            var result = x % y;
            if ((x xor y) < 0 && result != 0L) {
                result += y;
            }
            return result;
        }

        /**
         * Creates a duration representing specified number of days.
         * A Day is assumed to always be 24 hours.
         *
         * @param days The number of days.
         * @return The Duration representing the specified number of days.
         * @throws ArithmeticException if the input is outside the range possible to
         *                             represent by a Duration
         */
        @JvmStatic @Throws(ArithmeticException::class)
        public fun ofDays(days: Long): Duration {
            return ofHours(exactMultiply(days, 24));
        }

        /**
         * Creates a duration representing specified number of hours.
         * An hour is assumed to always be 60 minutes.
         *
         * @param hours The number of hours.
         * @return The Duration representing the specified number of hours.
         * @throws ArithmeticException if the input is outside the range possible to
         *                             represent by a Duration
         */
        @JvmStatic @Throws(ArithmeticException::class)
        public fun ofHours(hours: Long): Duration {
            return ofMinutes(exactMultiply(hours, 60));
        }

        /**
         * Creates a duration representing specified number of hours.
         * A minute is assumed to always be 60 seconds.
         *
         * @param minutes The number of minutes.
         * @return The Duration representing the specified number of minutes.
         * @throws ArithmeticException if the input is outside the range possible to
         *                             represent by a Duration
         */
        @JvmStatic @Throws(ArithmeticException::class)
        public fun ofMinutes(minutes: Long): Duration {
            return ofSeconds(exactMultiply(minutes, 60));
        }

        /**
         * Creates a duration representing specified number of seconds.
         *
         * @param seconds The number of seconds.
         * @return The Duration representing the specified number of seconds.
         */
        @JvmStatic
        public fun ofSeconds(seconds: Long): Duration {
            return Duration(seconds, 0);
        }

        /**
         * Creates a duration representing specified number of seconds and an adjustment in nanoseconds.
         *
         * @param seconds The number of seconds.
         * @param nanoAdjustment The nanosecond adjustment to the number of seconds.
         * @return The Duration representing the specified number of seconds, adjusted.
         */
        @JvmStatic
        public fun ofSeconds(seconds: Long, nanoAdjustment: Long): Duration {
            var secs = exactAdd(seconds, divFloor(nanoAdjustment, NANOS_PER_SECOND));
            var nanos = modFloor(nanoAdjustment, NANOS_PER_SECOND).toInt();
            return Duration(secs, nanos);
        }

        /**
         * Creates a duration representing specified number of milliseconds.
         *
         * @param milliseconds The number of milliseconds.
         * @return The Duration representing the specified number of milliseconds.
         */
        @JvmStatic
        public fun ofMillis(milliseconds: Long): Duration {
            return ofNanos(milliseconds * NANOS_PER_MILLIS);
        }

        /**
         * Creates a duration representing specified number of nanoseconds.
         *
         * @param nanoseconds The number of nanoseconds.
         * @return The Duration representing the specified number of nanoseconds.
         */
        @JvmStatic
        public fun ofNanos(nanoseconds: Long): Duration {
            var secs = nanoseconds / NANOS_PER_SECOND;
            var nanos = (nanoseconds % NANOS_PER_SECOND).toInt();
            if (nanos < 0) {
                nanos += NANOS_PER_SECOND.toInt();
                secs--;
            }
            return Duration(secs, nanos);
        }
    }
}
