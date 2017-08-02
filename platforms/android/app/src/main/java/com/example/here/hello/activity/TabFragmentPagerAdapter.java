package com.example.here.hello.activity;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

public class TabFragmentPagerAdapter extends FragmentStatePagerAdapter {
  private final int numberOfTabs;

  public TabFragmentPagerAdapter(FragmentManager fragmentManager, int numberOfTabs) {
    super(fragmentManager);
    this.numberOfTabs = numberOfTabs;
  }

  @Override
  public Fragment getItem(int position) {
    switch (position)
    {
      case 0:
        return new TabFragmentBase();
      case 1:
        return new TabFragmentBuiltIn();
      default:
        return null;
    }
  }

  @Override
  public int getCount() {
    return numberOfTabs;
  }
}
