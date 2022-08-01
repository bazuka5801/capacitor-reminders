export interface CapacitorReminder {
  id: string
  title: string
  dueDate?: string
  notes?: string
  isComplete: boolean
  completionDate?: string
}

export interface RemindersPlugin {
  requestPermissions(): Promise<void>;
  checkPermissions(): Promise<{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'}>;
  readAll(): Promise<{ reminders: CapacitorReminder[] }>;
  write({ reminder }: { reminder: CapacitorReminder}): Promise<void>
  write({ id }: { id: string}): Promise<void>
}
