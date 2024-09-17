import { WebPlugin } from '@capacitor/core';

import type { IOSStatusBarPlugin } from './definitions';

export class IOSStatusBarWeb extends WebPlugin implements IOSStatusBarPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async setStatusBarColor(options: { color: string }): Promise<void> {
    console.log('Setting status bar color to"', options.color);
  }
  async setBottomBarColor(options: { color: string }): Promise<void> {
    console.log('Setting bottom bar color to:', options.color);
  }
}
