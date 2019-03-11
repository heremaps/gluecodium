/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldMaps;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

class MapEntry {

  Integer key;
  String value;

  MapEntry(Integer key, String value) {
    this.key = key;
    this.value = value;
  }
}

class MapAdapter extends ArrayAdapter<MapEntry> {
  Fragment fragment;
  int resource;

  MapAdapter(Fragment fragment, int resource, ArrayList<MapEntry> data) {
    super(fragment.getActivity(), resource, data);

    this.fragment = fragment;
    this.resource = resource;
  }

  @Override
  public View getView(int position, View convertView, ViewGroup parent) {
    TextView entryView;

    if (convertView == null) {
      LayoutInflater inflater = fragment.getLayoutInflater();
      convertView = inflater.inflate(resource, parent, false);

      entryView = convertView.findViewById(R.id.map_entry_view);
      ImageButton deleteButton = convertView.findViewById(R.id.delete_entry_btn);
      deleteButton.setTag(position);
      deleteButton.setOnClickListener(
          (View v) -> {
            int p = (Integer) v.getTag();
            MapEntry entry = getItem(p);
            remove(entry);
          });

      convertView.setTag(entryView);
    } else {
      entryView = (TextView) convertView.getTag();
    }

    MapEntry entry = getItem(position);
    entryView.setText(String.format(Locale.getDefault(), "%12d => %s", entry.key, entry.value));

    return convertView;
  }
}

public class MapsFragment extends Fragment {

  private ImageButton addEntryBtn;
  private EditText entryKey;
  private EditText entryValue;
  private ListView inputMap;
  private Button processButton;
  private AlertDialog resultDialog;

  public MapsFragment() {}

  @Override
  public View onCreateView(
      LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_maps, container, false);

    inputMap = rootView.findViewById(R.id.input_map);
    MapAdapter adapter = new MapAdapter(this, R.layout.map_fragment_list_entry, new ArrayList<>());
    inputMap.setAdapter(adapter);

    entryKey = rootView.findViewById(R.id.map_entry_key);
    entryKey.requestFocus();
    entryValue = rootView.findViewById(R.id.map_entry_value);
    addEntryBtn = rootView.findViewById(R.id.add_entry_btn);
    addEntryBtn.setOnClickListener(
        (View v) -> {
          try {
            Integer key = Integer.valueOf(entryKey.getText().toString());
            String value = entryValue.getText().toString();
            adapter.add(new MapEntry(key, value));
          } catch (NumberFormatException e) {
          }
          entryKey.setText("");
          entryValue.setText("");
          entryKey.requestFocus();
        });

    resultDialog = new AlertDialog.Builder(getContext()).create();
    processButton = rootView.findViewById(R.id.process_map_btn);
    processButton.setOnClickListener(
        (View v) -> {
          @SuppressLint("UseSparseArrays")
          Map<Integer, String> map = new HashMap<>();
          for (int i = 0; i < adapter.getCount(); ++i) {
            MapEntry entry = adapter.getItem(i);
            map.put(entry.key, entry.value);
          }

          Map<Integer, String> resultMap = HelloWorldMaps.methodWithMap(map);

          StringBuilder builder = new StringBuilder("Resulting map from C++:\n{\n");
          for (Map.Entry<Integer, String> entry : resultMap.entrySet()) {
            builder.append(
                String.format(
                    Locale.getDefault(), "  %d => %s\n", entry.getKey(), entry.getValue()));
          }
          builder.append("}");

          resultDialog.setMessage(builder.toString());
          resultDialog.show();
        });

    return rootView;
  }
}
