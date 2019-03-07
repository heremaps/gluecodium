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

import android.content.Context;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import com.example.here.hello.R;

public final class MainActivity extends AppCompatActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    // Set up toolbar
    Toolbar toolbar = findViewById(R.id.toolbar);
    setSupportActionBar(toolbar);

    // Set up view pager
    ViewPager viewPager = findViewById(R.id.pager);
    viewPager.setAdapter(new MainFragmentPagerAdapter(this, getSupportFragmentManager()));

    // Set up tab layout
    TabLayout tabLayout = findViewById(R.id.tab_layout);
    tabLayout.setTabMode(TabLayout.MODE_SCROLLABLE);
    tabLayout.setupWithViewPager(viewPager);
  }

  private static final class MainFragmentPagerAdapter extends FragmentPagerAdapter {
    private final String[] pageTitles;

    MainFragmentPagerAdapter(final Context context, final FragmentManager fragmentManager) {
      super(fragmentManager);
      pageTitles =
          new String[] {
            context.getString(R.string.fragment_base_title),
            context.getString(R.string.fragment_builtin_title),
            context.getString(R.string.fragment_plain_old_data_title),
            context.getString(R.string.fragment_instance_methods),
            context.getString(R.string.fragment_attributes),
            context.getString(R.string.fragment_typedef),
            context.getString(R.string.fragment_listeners_title),
            context.getString(R.string.fragment_enumerations_title),
            context.getString(R.string.fragment_arrays_title),
            context.getString(R.string.fragment_errors_title),
            context.getString(R.string.fragment_defaults_title),
            context.getString(R.string.fragment_inheritance_title),
            context.getString(R.string.fragment_parcelable_title),
            context.getString(R.string.fragment_maps_title),
            context.getString(R.string.fragment_equatable_title)
          };
    }

    @Override
    public Fragment getItem(int position) {
      switch (position) {
        case 0:
          return new BaseFragment();
        case 1:
          return new BuiltInFragment();
        case 2:
          return new PlainOldDataFragment();
        case 3:
          return new InstanceMethodsFragment();
        case 4:
          return new AttributesFragment();
        case 5:
          return new TypeDefFragment();
        case 6:
          return new ListenersFragment();
        case 7:
          return new EnumerationFragment();
        case 8:
          return new ArraysFragment();
        case 9:
          return new ErrorsFragment();
        case 10:
          return new DefaultsFragment();
        case 11:
          return new InheritanceFragment();
        case 12:
          return new ParcelableFragment();
        case 13:
          return new MapsFragment();
        case 14:
          return new EquatableFragment();
        default:
          return null;
      }
    }

    @Override
    public int getCount() {
      return pageTitles.length;
    }

    @Override
    public CharSequence getPageTitle(int position) {
      return pageTitles[position];
    }
  }
}
