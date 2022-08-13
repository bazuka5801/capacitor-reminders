# capacitor-reminders

Read / Write iOS Reminders

## Install

```bash
npm install capacitor-reminders
npx cap sync
```

## IMPORTANT (iOS)

Add `NSRemindersUsageDescription` into your `Info.plist`

## API

<docgen-index>

* [`requestPermissions()`](#requestpermissions)
* [`checkPermissions()`](#checkpermissions)
* [`readAll()`](#readall)
* [`write(...)`](#write)
* [`write(...)`](#write)
* [Interfaces](#interfaces)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### requestPermissions()

```typescript
requestPermissions() => Promise<void>
```

--------------------


### checkPermissions()

```typescript
checkPermissions() => Promise<{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'; }>
```

**Returns:** <code>Promise&lt;{ permission: 'notDetermined' | 'restricted' | 'denied' | 'authorized'; }&gt;</code>

--------------------


### readAll()

```typescript
readAll() => Promise<{ reminders: CapacitorReminder[]; }>
```

**Returns:** <code>Promise&lt;{ reminders: CapacitorReminder[]; }&gt;</code>

--------------------


### write(...)

```typescript
write({ reminder }: { reminder: CapacitorReminder; }) => Promise<void>
```

| Param     | Type                                                                           |
| --------- | ------------------------------------------------------------------------------ |
| **`__0`** | <code>{ reminder: <a href="#capacitorreminder">CapacitorReminder</a>; }</code> |

--------------------


### write(...)

```typescript
write({ id }: { id: string; }) => Promise<void>
```

| Param     | Type                         |
| --------- | ---------------------------- |
| **`__0`** | <code>{ id: string; }</code> |

--------------------


### Interfaces


#### CapacitorReminder

| Prop                     | Type                          |
| ------------------------ | ----------------------------- |
| **`id`**                 | <code>string</code>           |
| **`title`**              | <code>string</code>           |
| **`dueDate`**            | <code>string</code>           |
| **`notes`**              | <code>string</code>           |
| **`isComplete`**         | <code>boolean</code>          |
| **`completionDate`**     | <code>string</code>           |
| **`hasRecurrenceRules`** | <code>boolean</code>          |
| **`recurrenceRules`**    | <code>RecurrenceRule[]</code> |


#### RecurrenceRule

| Prop                  | Type                                                                        |
| --------------------- | --------------------------------------------------------------------------- |
| **`frequency`**       | <code><a href="#recurrencerulefrequency">RecurrenceRuleFrequency</a></code> |
| **`interval`**        | <code>number</code>                                                         |
| **`dateEnd`**         | <code>string</code>                                                         |
| **`daysOfTheWeek`**   | <code>RecurrenceRuleDayOfWeek[]</code>                                      |
| **`daysOfTheMonth`**  | <code>number[]</code>                                                       |
| **`daysOfTheYear`**   | <code>number[]</code>                                                       |
| **`weeksOfTheYear`**  | <code>number[]</code>                                                       |
| **`monthsOfTheYear`** | <code>number[]</code>                                                       |


#### RecurrenceRuleDayOfWeek

| Prop               | Type                                                  |
| ------------------ | ----------------------------------------------------- |
| **`dayOfTheWeek`** | <code><a href="#dayoftheweek">DayOfTheWeek</a></code> |
| **`weekNumber`**   | <code>number</code>                                   |


### Enums


#### RecurrenceRuleFrequency

| Members         |
| --------------- |
| **`'daily'`**   |
| **`'weekly'`**  |
| **`'monthly'`** |
| **`'yearly'`**  |


#### DayOfTheWeek

| Members           |
| ----------------- |
| **`'sunday'`**    |
| **`'monday'`**    |
| **`'tuesday'`**   |
| **`'wednesday'`** |
| **`'thursday'`**  |
| **`'friday'`**    |
| **`'saturday'`**  |

</docgen-api>
