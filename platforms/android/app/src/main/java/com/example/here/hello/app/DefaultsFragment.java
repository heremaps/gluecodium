package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.here.hello.R;
import com.example.here.hello.utils.InputMethodHelper;
import com.here.android.hello.HelloWorldDefaults;

public final class DefaultsFragment extends Fragment {

  private Spinner spinner;
  private TextView result;
  private Button submitButton;

  @Override
  public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_defaults, container, false);
    spinner = rootView.findViewById(R.id.defaults_spinner);
    result = rootView.findViewById(R.id.defaults_text);
    submitButton = rootView.findViewById(R.id.defaults_submit);
    return rootView;
  }

  @Override
  public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);
    submitButton.setOnClickListener(v -> {

      HelloWorldDefaults.StructWithDefaults resultStruct = spinner.getSelectedItemPosition() == 0
          ? new HelloWorldDefaults.StructWithDefaults()
          : HelloWorldDefaults.getStructWithDefaults();

      String prefix = getResources().getString(R.string.defaults_retrieval_message) + getResources()
          .getStringArray(R.array.defaults_source)[spinner.getSelectedItemPosition()];
      result.setText(prefix + "\n\n" + generateStructString(resultStruct));

      // hide virtual keyboard
      InputMethodHelper.hideSoftKeyboard(getContext(), result.getWindowToken());
    });
  }

  private static String generateStructString(final HelloWorldDefaults.StructWithDefaults struct) {
    return "StructWithDefaults {\n" +
        "intField=" + struct.intField + "\n" +
        "floatField=" + struct.floatField + "\n" +
        "boolField=" + struct.boolField + "\n" +
        "stringField= \"" + struct.stringField + "\"\n" +
        "enumField=" + struct.enumField + "\n" +
        "}";
  }
}
