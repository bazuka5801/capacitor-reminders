import { WebPlugin } from '@capacitor/core';

import type { CapacitorReminder, RemindersPlugin } from './definitions';

export class RemindersWeb extends WebPlugin implements RemindersPlugin {
  requestPermissions(): Promise<void> {
    throw new Error('Method not implemented.');
  }
  checkPermissions(): Promise<{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'; }> {
    throw new Error('Method not implemented.');
  }
  readAll(): Promise<{ reminders: CapacitorReminder[]; }> {
    throw new Error('Method not implemented.');
  }
  write({ reminder }: { reminder: CapacitorReminder; }): Promise<void>;
  write({ id }: { id: string; }): Promise<void>;
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  write(__0: unknown): Promise<void> {
    throw new Error('Method not implemented.');
  }
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
