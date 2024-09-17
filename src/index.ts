import { registerPlugin } from '@capacitor/core';

import type { IOSStatusBarPlugin } from './definitions';

const IOSStatusBar = registerPlugin<IOSStatusBarPlugin>('IOSStatusBar', {
  web: () => import('./web').then(m => new m.IOSStatusBarWeb())
});

export * from './definitions';
export { IOSStatusBar };
