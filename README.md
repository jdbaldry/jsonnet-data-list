---
permalink: /
---

# package data-list

```jsonnet
local data-list = import "github.com/jdbaldry/jsonnet-data-list/main.libsonnet"
```

`data-list` provides functions that imitate the Haskell Data.List library for Jsonnet arrays

## Index

* [`fn head(a)`](#fn-head)
* [`fn init(a)`](#fn-init)
* [`fn intercalate(a, b)`](#fn-intercalate)
* [`fn intersperse(e, a)`](#fn-intersperse)
* [`fn last(a)`](#fn-last)
* [`fn reverse(a)`](#fn-reverse)
* [`fn tail(a)`](#fn-tail)

## Fields

### fn head

```ts
head(a)
```

Extract the first element of an array, which must be non-empty.

### fn init

```ts
init(a)
```

Return all the elements of an array except the last one. The array must be non-empty.

### fn intercalate

```ts
intercalate(a, b)
```

Inserts the array `a` between the elements of the array `b` and concatenates the result.

### fn intersperse

```ts
intersperse(e, a)
```

Takes an element and an array and 'intersperses' that element between the elements of the list.

### fn last

```ts
last(a)
```

Extract the last element of an array, which must be finite and non-empty.

### fn reverse

```ts
reverse(a)
```

Returns the elements of an array in reverse order. The array must be finite.

### fn tail

```ts
tail(a)
```

Extract the elements after the head of a array, which must be non-empty.