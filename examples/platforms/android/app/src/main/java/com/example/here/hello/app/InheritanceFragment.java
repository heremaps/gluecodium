/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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
package com.example.here.hello.app;

import static android.graphics.Color.BLACK;
import static android.graphics.Color.GREEN;
import static android.graphics.Color.RED;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldStaticLogger;
import com.here.android.hello.InheritanceHelper;
import com.here.android.hello.Shape;
import java.util.ArrayList;
import java.util.Arrays;
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
  private LinearLayout headers;
  private ListView inheritanceTable;

  private static final String CORRECT = "\u2714";
  private static final String INCORRECT = "\u2715";
  private static final String UNKNOWN = "\uFF1F";

  public InheritanceFragment() {}

  private static class InheritanceCheckData {
    String instance;
    String shapeCheckResult;
    String circleCheckResult;
    String rectangleCheckResult;
    String squareCheckResult;

    InheritanceCheckData(String instance) {
      this.instance = instance;
      shapeCheckResult = UNKNOWN;
      circleCheckResult = UNKNOWN;
      rectangleCheckResult = UNKNOWN;
      squareCheckResult = UNKNOWN;
    }

    InheritanceCheckData(
        String instance,
        String shapeCheckResult,
        String circleCheckResult,
        String rectangleCheckResult,
        String squareCheckResult) {
      this.instance = instance;
      this.shapeCheckResult = shapeCheckResult;
      this.circleCheckResult = circleCheckResult;
      this.rectangleCheckResult = rectangleCheckResult;
      this.squareCheckResult = squareCheckResult;
    }
  }

  private static class InheritanceAdapter extends ArrayAdapter<InheritanceCheckData> {
    Fragment fragment;
    int resource;

    InheritanceAdapter(Fragment fragment, int resource, ArrayList<InheritanceCheckData> data) {
      super(fragment.getActivity(), resource, data);

      this.fragment = fragment;
      this.resource = resource;
    }

    private static void colorifyTextView(TextView textView, String text) {
      textView.setText(text);
      if (text.equals(CORRECT)) {
        textView.setTextColor(GREEN);
      } else if (text.equals(INCORRECT)) {
        textView.setTextColor(RED);
      } else {
        textView.setTextColor(BLACK);
      }
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
      if (convertView == null) {
        LayoutInflater inflater = fragment.getLayoutInflater();
        convertView = inflater.inflate(resource, parent, false);
      }

      TextView instance = convertView.findViewById(R.id.instance_type);
      InheritanceCheckData data = getItem(position);
      instance.setText(data.instance);

      colorifyTextView(convertView.findViewById(R.id.check1), data.shapeCheckResult);
      colorifyTextView(convertView.findViewById(R.id.check2), data.circleCheckResult);
      colorifyTextView(convertView.findViewById(R.id.check3), data.rectangleCheckResult);
      colorifyTextView(convertView.findViewById(R.id.check4), data.squareCheckResult);

      return convertView;
    }
  }

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

    headers = rootView.findViewById(R.id.headers);
    inheritanceTable = rootView.findViewById(R.id.inheritance_table);
    InheritanceAdapter adapter =
        new InheritanceAdapter(this, R.layout.inheritance_row, new ArrayList<>());
    String[] instances =
        new String[] {
          "javaCircle",
          "nativeImplCircle",
          "nativeImplRectangle",
          "parentJavaImplRectangle",
          "childJavaImplRectangle",
          "nativeImplSquare"
        };

    for (String instance : instances) {
      adapter.add(new InheritanceCheckData(instance));
    }
    inheritanceTable.setAdapter(adapter);

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

            if (position == 0) {
              description.setText(descriptionsText[position]);
              headers.setVisibility(View.VISIBLE);
              inheritanceTable.setVisibility(View.VISIBLE);
              result.setVisibility(View.GONE);
            } else {
              description.setText("");
              headers.setVisibility(View.GONE);
              inheritanceTable.setVisibility(View.GONE);
              result.setVisibility(View.VISIBLE);
              result.setText(descriptionsText[position]);
            }
          }

          @Override
          public void onNothingSelected(AdapterView<?> parentView) {
            description.setText("");
            result.setText("");
          }
        });

    submitButton.setOnClickListener((View v) -> handleSelected(spinner.getSelectedItemPosition()));
  }

  private static String inheritanceCheckResult(Class<?> parent, Class<?> child) {
    return parent.isAssignableFrom(child) ? CORRECT : INCORRECT;
  }

  private InheritanceCheckData createInheritanceCheckData(String type, Object instance) {
    return new InheritanceCheckData(
        type,
        inheritanceCheckResult(com.here.android.hello.Shape.class, instance.getClass()),
        inheritanceCheckResult(com.here.android.hello.Circle.class, instance.getClass()),
        inheritanceCheckResult(com.here.android.hello.Rectangle.class, instance.getClass()),
        inheritanceCheckResult(com.here.android.hello.Square.class, instance.getClass()));
  }

  private void handleSelected(int selectedItem) {
    switch (selectedItem) {
      case 0:
        {
          InheritanceAdapter adapter = (InheritanceAdapter) inheritanceTable.getAdapter();

          adapter.clear();

          adapter.add(createInheritanceCheckData("javaCircle", javaImplCircle));
          adapter.add(createInheritanceCheckData("nativeImplCircle", nativeImplCircle));
          adapter.add(createInheritanceCheckData("nativeImplRectangle", nativeImplRectangle));
          adapter.add(
              createInheritanceCheckData("parentJavaImplRectangle", parentJavaImplRectangle));
          adapter.add(createInheritanceCheckData("childJavaImplRectangle", childJavaImplRectangle));
          adapter.add(createInheritanceCheckData("nativeImplSquare", nativeImplSquare));
        }
        break;

      case 1:
        {
          HelloWorldStaticLogger.clearLog();

          List<Shape> shapes =
              Arrays.asList(
                  javaImplCircle,
                  nativeImplCircle,
                  nativeImplRectangle,
                  parentJavaImplRectangle,
                  childJavaImplRectangle,
                  nativeImplSquare);

          InheritanceHelper.applyScaleOn(2.0, shapes);

          String log = HelloWorldStaticLogger.getLog();

          result.setText(log);
        }
        break;
    }
  }
}
