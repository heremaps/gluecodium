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
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        // Set up view pager
        ViewPager viewPager = (ViewPager) findViewById(R.id.pager);
        viewPager.setAdapter(new MainFragmentPagerAdapter(this, getSupportFragmentManager()));

        // Set up tab layout
        TabLayout tabLayout = (TabLayout) findViewById(R.id.tab_layout);
        tabLayout.setTabMode(TabLayout.MODE_FIXED);
        tabLayout.setupWithViewPager(viewPager);

    }

    private static final class MainFragmentPagerAdapter extends FragmentPagerAdapter {
        private final String[] pageTitles;

        MainFragmentPagerAdapter(final Context context, final FragmentManager fragmentManager) {
            super(fragmentManager);
            pageTitles = new String[] {
                    context.getString(R.string.fragment_base_title),
                    context.getString(R.string.fragment_builtin_title),
                    context.getString(R.string.fragment_plain_old_data_title)
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
                default:
                    return null;
            }
        }

        @Override
        public int getCount() {
            return 3;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return pageTitles[position];
        }
    }
}
