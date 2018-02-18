---
layout: post
title: "Hoist with his own JS Petard"
date: 2017-12-12
categories: code, javascript
---

In JavaScript, _hoisting_ refers to the idea that declarations — of both variables and functions — are automatically moved to the top of their scope. Note that this doesn't mean they are _physically moved in your file_. Rather, it's shorthand for explaining a key aspect of [execution context](http://davidshariff.com/blog/what-is-the-execution-context-in-javascript/) — specifically, the order in which the JavaScript interpreter, well, interprets the information in any given scope. We'll illustrate with some examples in a minute, but, first, an important question: what does "hoist" even mean?

## Liberal Arts Interlude

_Hoist_ is a mid 15th-century English word [derived](http://www.etymonline.com/index.php?term=hoist) from similar words in other Germanic languages (e.g., Dutch and Low German) meaning "to lift up" or "to raise." Its most famous use in English is undoubtedly by our friend Shakespeare, in _Hamlet_. Hamlet, realizing that his supposed friends are actually carrying a letter with Hamlet's death warrant, secretly alters the letter so that they will be killed instead, and remarks "_For 'tis the sport to have the enginer / Hoist with his own petar'._" A [petard](https://en.wikipedia.org/wiki/Petard) was a small bomb used by military engineers, raised onto gates or obstacles to blow them up when breaching a fortification, and, so, to _hoist with his own petard_ became an English idiom meaning "to blow oneself up with his own bomb" or "to fall into one's own trap." A bit like what can happen to the software engineer who doesn't take _hoisting_ into account when putting together JS code.

## Code Examples

So, back to it. The JS interpreter in the browser works as a single thread, meaning only one thing can happen at a time. Every time it considers a new scope, it does these several things in the same order. Among them are _looking through the entire scope for function and variable declarations_ and _executing functions and assigning values to variables_ — the former always before the latter. The practical effect is to interpret the code as if all declarations were _hoisted_ to the top of their respective scopes, while assignments stay in their original places. For example:

```js
badDude = 'Kylo Ren';
var badDude;
console.log(badDude); // prints 'Kylo Ren'
```

Even though we never assigned a value to `badDude` after declaring it as a variable, it still logs 'Kylo Ren' because the declaration was hoisted to the top of the scope before the code was executed, as if we had written:

```js
var badDude;
badDude = 'Kylo Ren';
console.log(badDude); // prints 'Kylo Ren'
```

Note that this is the case for variable _and_ function declarations. In fact, function declarations are hoisted first.

```js
goat(); // prints "Messi is the greatest of all time!"

function goat() {
  console.log('Messi is the greatest of all time!');
}
```

Here we declare the function in the global scope, the same scope in which `goat()` is called, and thus the function declaration was hoisted to the top of the global scope, _above_ the function call.

Note that this is not the case, however, when a function is the assigned value of a variable. If we modified our example so that it read:

```js
goat(); // undefined

var goat = () => {
  console.log('Messi is the greatest of all time!');
};
```

`var goat` is hoisted to the top, but the expression assigned to it stays in place — below the function call — so that `goat()` prints `undefined`.

## Remember the Scope!

Declarations are hoisted to the top of their _scope_, not necessarily to the top of the file. For example:

```javascript
var leadSinger = 'Diamond Dave';

(function vanHalen() {
  console.log('First lead singer was ' + leadSinger); // prints undefined

  var leadSinger = 'Sammy Hagar';
  console.log('Second lead singer was ' + leadSinger); // prints "Sammy Hagar"
})();
```

How anyone might not know that David Lee Roth was the first (and only true) lead singer of Van Halen is beyond me, but that's JavaScript for you. Here, the _re_-declaration of leadSinger variable jumps to the top of its scope (in this case, the local or function scope), while its assignment stays in place. It overwrites the assignment made in the global scope and is thus undefined when we arrive at the first `console.log()`. If we wanted to to give Diamond Dave his due, we could simply not re-declare `leadSinger`, but just reassign it.

```javascript
var leadSinger = 'Diamond Dave';

(function vanHalen() {
  console.log('First lead singer was ' + leadSinger); // prints "Diamond Dave"

  leadSinger = 'Sammy Hagar';
  console.log('Second lead singer was ' + leadSinger); // prints "Sammy Hagar"
})();
```
