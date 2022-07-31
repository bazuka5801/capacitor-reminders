export interface RemindersPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
