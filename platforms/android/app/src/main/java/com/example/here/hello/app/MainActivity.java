/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
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
            pageTitles = new String[] {
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
                    context.getString(R.string.fragment_defaults_title)

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
