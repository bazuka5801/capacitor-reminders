import { WebPlugin } from '@capacitor/core';

import type { RemindersPlugin } from './definitions';

export class RemindersWeb extends WebPlugin implements RemindersPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
