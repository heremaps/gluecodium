/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import android.support.annotation.NonNull;

public class ColoredLine {
    @NonNull
    public Line line;
    @NonNull
    public Color color;
    public ColoredLine() {
        this(new Line(), new Color());
    }
    public ColoredLine(Line line, Color color) {
        this.line = line;
        this.color = color;
    }
}