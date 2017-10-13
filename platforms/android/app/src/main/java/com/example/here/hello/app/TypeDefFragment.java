package com.example.here.hello.app;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.example.here.hello.R;
import com.here.android.hello.HelloWorldTypedefs;
import java.util.Locale;

public final class TypeDefFragment extends Fragment {

  private static final String METHOD_DETAILS_TEXT = "%1$s:\n\n"
      + "struct SomeStruct { String text }\n"
      + "typedef RenamedStruct is SomeStruct\n"
      + "typedef RenamedTwiceStruct is RenamedStruct\n\n"
      + "method methodWithTypeDef {\n"
      + "\t\tin { RenamedTwiceStruct input }\n"
      + "\t\tout { RenamedTwiceStruct output }\n"
      + "}";
  private Button submitButton;
  private EditText result;
  private EditText input;
  private TextView description;
  private TextView methodDetails;

  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {
    View rootView = inflater.inflate(R.layout.fragment_typedef, container, false);
    description = rootView.findViewById(R.id.typedef_description);
    input = rootView.findViewById(R.id.typedef_edit);
    result = rootView.findViewById(R.id.typedef_result);
    submitButton = rootView.findViewById(R.id.typedef_submit_button);
    methodDetails = rootView.findViewById(R.id.typedef_method_details);
    return rootView;
  }

  @Override
  public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
    super.onViewCreated(view, savedInstanceState);
    methodDetails.setText(
          String.format(Locale.getDefault(),
          METHOD_DETAILS_TEXT,
          getResources().getString(R.string.typedef_method_details)));
    description.setText(R.string.typedef_method_description);
    submitButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
          HelloWorldTypedefs.SomeStruct inputStruct = new HelloWorldTypedefs.SomeStruct();
          inputStruct.text = input.getText().toString();

          HelloWorldTypedefs.SomeStruct outputStruct
              = HelloWorldTypedefs.methodWithTypeDef(inputStruct);

          result.setText(outputStruct.text);
      }
    });
    input.setOnEditorActionListener(new EditText.OnEditorActionListener() {
      @Override
      public boolean onEditorAction(TextView textView, int actionId, KeyEvent event) {
        if (actionId == EditorInfo.IME_ACTION_DONE) {
          submitButton.performClick();
          return true;
        }
        return false;
      }
    });
  }
}
