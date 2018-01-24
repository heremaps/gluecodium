/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldStaticLogger;
import com.here.android.hello.InheritanceHelper;
import com.here.android.hello.Shape;
import java.util.LinkedList;
import java.util.List;

public class InheritanceFragment extends Fragment {

  private Shape javaImplCircle;
  private Shape nativeImplCircle;
  private Shape nativeImplRectangle;
  private Shape parentJavaImplRectangle;
  private Shape childJavaImplRectangle;
  private Shape nativeImplSquare;

  private Button submitButton;
  private TextView result;
  private Spinner spinner;
  private TextView description;
  private String[] descriptionsText;

  public InheritanceFragment() {}

  @Override
  public View onCreateView(
      LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_inheritance, container, false);

    spinner = rootView.findViewById(R.id.inheritance_spinner);
    description = rootView.findViewById(R.id.inheritance_description);
    submitButton = rootView.findViewById(R.id.inheritance_submit_button);
    result = rootView.findViewById(R.id.inheritance_result);
    descriptionsText = getResources().getStringArray(R.array.inheritance_methods_description);

    javaImplCircle = new JavaImplCircle();
    nativeImplCircle = InheritanceHelper.createCircle();
    nativeImplRectangle = InheritanceHelper.createRectangle();
    parentJavaImplRectangle = new ParentJavaImplRectangle();
    childJavaImplRectangle = new ChildJavaImplRectangle();
    nativeImplSquare = InheritanceHelper.createSquare();

    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);

    spinner.setOnItemSelectedListener(
        new AdapterView.OnItemSelectedListener() {
          @Override
          public void onItemSelected(
              AdapterView<?> parentView, View selectedItemView, int position, long id) {
            description.setText(descriptionsText[position]);
            result.setText("");
          }

          @Override
          public void onNothingSelected(AdapterView<?> parentView) {
            description.setText("");
            result.setText("");
          }
        });

    submitButton.setOnClickListener((View v) -> handleSelected(spinner.getSelectedItemPosition()));
  }

  private static String inheritanceCheckResult(Class<?> c, Class<?> d) {
    return d.getSimpleName()
        + " is "
        + (c.isAssignableFrom(d) ? "a" : "not a")
        + " "
        + c.getSimpleName()
        + "\n";
  }

  private void handleSelected(int selectedItem) {
    switch (selectedItem) {
      case 0:
        {
          StringBuilder builder = new StringBuilder();

          Class<?> classes[] = {
            com.here.android.hello.Shape.class,
            com.here.android.hello.Circle.class,
            com.here.android.hello.Rectangle.class,
            com.here.android.hello.Square.class
          };

          for (int i = 0; i < classes.length; ++i) {
            for (int j = i + 1; j < classes.length; ++j) {
              builder.append(inheritanceCheckResult(classes[i], classes[j]));
            }
          }

          result.setText(builder.toString());
        }
        break;

      case 1:
        {
          HelloWorldStaticLogger.clearLog();

          List<Shape> shapes = new LinkedList<>();

          shapes.add(javaImplCircle);
          shapes.add(nativeImplCircle);
          shapes.add(nativeImplRectangle);
          shapes.add(parentJavaImplRectangle);
          shapes.add(childJavaImplRectangle);
          shapes.add(nativeImplSquare);

          InheritanceHelper.applyScaleOn(2.0, shapes);

          String log = HelloWorldStaticLogger.getLog();

          result.setText(log);
        }
        break;
    }
  }
}
