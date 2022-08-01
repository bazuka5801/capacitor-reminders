# capacitor-reminders

Read / Write iOS Reminders

## Install

```bash
npm install capacitor-reminders
npx cap sync
```

## API

<docgen-index>

* [`requestPermissions()`](#requestpermissions)
* [`checkPermissions()`](#checkpermissions)
* [`readAll()`](#readall)
* [`write(...)`](#write)
* [`write(...)`](#write)
* [Interfaces](#interfaces)

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

| Prop                 | Type                 |
| -------------------- | -------------------- |
| **`id`**             | <code>string</code>  |
| **`title`**          | <code>string</code>  |
| **`dueDate`**        | <code>string</code>  |
| **`notes`**          | <code>string</code>  |
| **`isComplete`**     | <code>boolean</code> |
| **`completionDate`** | <code>string</code>  |

</docgen-api>
