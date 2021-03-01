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
* [`fn nonEmptySubsequences(a)`](#fn-nonemptysubsequences)
* [`fn reverse(a)`](#fn-reverse)
* [`fn subsequences(a)`](#fn-subsequences)
* [`fn tail(a)`](#fn-tail)
* [`fn transpose(a)`](#fn-transpose)

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

Inserts the array `a` between the elements of the array of arrays `b` and concatenates the result.

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

### fn nonEmptySubsequences

```ts
nonEmptySubsequences(a)
```

Return an array of non-empty subsequences of array `a`

### fn reverse

```ts
reverse(a)
```

Returns the elements of an array in reverse order. The array must be finite.

### fn subsequences

```ts
subsequences(a)
```

Returns an array of all subsequences of array `a`

### fn tail

```ts
tail(a)
```

Extract the elements after the head of a array, which must be non-empty.

### fn transpose

```ts
transpose(a)
```

Transposes the rows and columns of its arguments. If some rows are shorter than the following rows, their elements are skipped.