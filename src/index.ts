import { registerPlugin } from '@capacitor/core';

import type { RemindersPlugin } from './definitions';

const Reminders = registerPlugin<RemindersPlugin>('Reminders', {
  web: () => import('./web').then(m => new m.RemindersWeb()),
});

export * from './definitions';
export { Reminders };
