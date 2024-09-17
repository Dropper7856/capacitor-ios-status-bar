import { WebPlugin } from '@capacitor/core';

import type { IOSStatusBarPlugin } from './definitions';

export class IOSStatusBarWeb extends WebPlugin implements IOSStatusBarPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
