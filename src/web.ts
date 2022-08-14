/* eslint-disable @typescript-eslint/no-unused-vars */
import { WebPlugin } from '@capacitor/core';

import type { CapacitorReminder, RemindersPlugin } from './definitions';

export class RemindersWeb extends WebPlugin implements RemindersPlugin {
  requestPermissions(): Promise<{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'}> {
    throw new Error('Method not implemented.');
  }
  checkPermissions(): Promise<{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'; }> {
    throw new Error('Method not implemented.');
  }
  readAll(): Promise<{ reminders: CapacitorReminder[]; }> {
    throw new Error('Method not implemented.');
  }
  write(_: { reminder: CapacitorReminder; }): Promise<void> {
    throw new Error('Method not implemented.');
  };
  delete(_: { id: string; }): Promise<void> {
    throw new Error('Method not implemented.');
  };
}
