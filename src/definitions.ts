export interface CapacitorReminder {
  id: string
  title: string
  dueDate?: string
  notes?: string
  isComplete: boolean
  completionDate?: string
  hasRecurrenceRules: boolean
  recurrenceRules: [{
    frequency: 'daily' | 'weekly' | 'monthly' | 'yearly',
    interval: number,
    dateEnd: string,
    daysOfTheWeek: [{
      dayOfTheWeek: 'sunday' | 'monday' | 'tuesday' | 'wednesday' | 'thursday' | 'friday' | 'saturday',
      weekNumber: number
    }],
    daysOfTheMonth: [number],
    daysOfTheYear: [number],
    weeksOfTheYear: [number],
    monthsOfTheYear: [number],
  }]
}

export interface RemindersPlugin {
  requestPermissions(): Promise<void>;
  checkPermissions(): Promise<{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'}>;
  readAll(): Promise<{ reminders: CapacitorReminder[] }>;
  write({ reminder }: { reminder: CapacitorReminder}): Promise<void>
  write({ id }: { id: string}): Promise<void>
}
