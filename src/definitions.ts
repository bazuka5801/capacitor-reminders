export enum DayOfTheWeek {
  'sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday',
}
export enum RecurrenceRuleFrequency {
  'daily', 'weekly', 'monthly', 'yearly'
}

export interface RecurrenceRuleDayOfWeek {
  dayOfTheWeek: DayOfTheWeek,
  weekNumber: number
}

export interface RecurrenceRule {
  frequency: RecurrenceRuleFrequency,
  interval: number,
  dateEnd: string,
  daysOfTheWeek: RecurrenceRuleDayOfWeek[],
  daysOfTheMonth: number[],
  daysOfTheYear: number[],
  weeksOfTheYear: number[],
  monthsOfTheYear: number[],
}

export interface CapacitorReminder {
  id: string
  title: string
  dueDate?: string
  notes?: string
  isComplete: boolean
  completionDate?: string
  hasRecurrenceRules: boolean
  recurrenceRules: RecurrenceRule[]
}

export interface RemindersPlugin {
  requestPermissions(): Promise<void>;
  checkPermissions(): Promise<{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'}>;
  readAll(): Promise<{ reminders: CapacitorReminder[] }>;
  write({ reminder }: { reminder: CapacitorReminder}): Promise<void>
  write({ id }: { id: string}): Promise<void>
}
