---
layout: post
title: "Do You Even Lift, Bro?"
date: 2016-12-07
categories: code, sinatra
---

![screenshot](http://i.imgur.com/kzBvtGz.png)

## Overview

For my Sinatra project, I made a webapp that folks can use to track and define their inside jokes, memes, callbacks — a kind rudimentary Urban Dictionary. I called it [DYEL](https://github.com/adamfriedl/our-memes) because I think that phrase is so awesomely silly in itself, and Obama reading this [mean tweet](http://www.rawstory.com/2016/10/bro-do-you-even-lift-president-obama-hilariously-reads-mean-tweets-on-jimmy-kimmel-show/) is one of the funniest things ever.

## Use Details

All of the views are protected, so users must create an account to see any info. Once signed up, they are automatically logged in and presented with a list of memes that have been created and defined. Each meme also shows the number of definitions it currently has. Clicking a meme takes you to its individual page, where all its definitions are listed. Each definition also shows the use who created it and, if that user was you, you're presented with the options to edit or delete it. You can also view a list of users and click on any to see the definitions they've created.

Creating (or editing a definition) consists of choosing the meme it belongs to via radio buttons for the existing memes. Alternatively, you can create a new meme for the definition.

## Build Details

The build process went relatively smoothly — I think I learned a fair amount from the CLI project in terms of staying organized and doing one thing at a time. I also tried to be mindful of committing code more frequently. Building and editing objects from form inputs improved my understanding how to use the params hash, which I don't think I fully grasped before.

The front end uses Google's [Material Design Light](https://getmdl.io/). As looks wasn't necessarily a goal for this project, I didn't spend a ton of time on it and some aspects could certainly use tweaks. But I think a nice interface makes it generally more fun to play around with.

## Some potential improvements

Setting aside the front-end (@radditude had a great post about creating her Sinatra project that noted how your aesthetic ambitions doesn't always match the time available for realizing them), a near the top of my list of refinements would be making site navigation a little more intuitive. For example, one could make links or buttons to create a new definition from any view, or provide more contextual information to explain why you're in the current view (e.g., you entered an incorrect password and so are back at the login screen).

Best of luck on your projects! It's Rails time for me!
