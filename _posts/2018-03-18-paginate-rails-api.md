---
layout: post
title: Paginate Your API
date: 2018-03-18
published: false
categories:
---
# Um, Why?

I recently had the opportunity to create an API as well as a frontend with a table to display the records it returned. The wrinkle was that the database would contain one-million-plus records, each with associations to other records. While I've created APIs before, this kind of volume was new to me. 

The obvious approach was to paginate, but I had questions about how this might work on both the back- and frontends. This is a walkthrough of the answers I found.

## Technical Details

I used Rails to set up the backend and created the frontend in React. The following assumes a basic familiarity with these frameworks, but I think the same principles, and likely similar gem/package/other-helper-things exist across languages.

## Backend 

Our app will have two simple models. The first is a Twin Peaks character with one attribute of 'name.' The second is a Twin Peaks location this is the character's favorite vacation spot. It also has one attribute of 'name.' Each character belongs_to a location and each location has_many characters. 
