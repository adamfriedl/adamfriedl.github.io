---
layout: post
title: "Recipe Box on Rails"
date: 2016-12-26
categories: code, ruby, rails
---

When I was growing up, my mom kept her kitchen recipes on index cards in a small, grey, plastic box on the counter. She wasn't a gourmet chef, but that box had a wealth of unfussy midwestern dishes that still make me think of home today. Most of them had come from her parents and various other family. Sadly, I don't know what ever happened to that box. When my kiddo grows up, I'd like her parents' recipe box to have regular backups.

Recipe Box is my attempt to make my mom's little grey box digitial with Rails. It uses Devise to manage user authentication and provides Omniauth support for Facebook. As always, there are a number of other features I would've like to incorporate, but I'm striving to stick to the [Minimum Viable Product](https://en.wikipedia.org/wiki/Minimum_viable_product) ethos as I build more and more new things.

## The Build Experience

Although it's a fairly straightforward Rails app, Recipe Box is is undoubtedly the most complex application I've built so far. I learned a ton, which I appreciate now that I'm done, but I also banged my head against a few walls. Particularly challenging was getting the recipe to accept and persist nested attributes for ingredient names and quantities. While name is a simple attribute of the `Ingredient` model, quantity is an attribute of the `RecipeIngredient` join model. This, along with a custom writer for `ingredient_attributes` in the `Recipe` model, allows for ingredients (e.g., chicken) not to be be duplicated every time it's included in a new recipe. But I spent probably too long trying every way I could imagine to get these stars to line up in the Recipe `create` method until I finally asked for help.

In addition firming up my understanding of some key Rails concepts (e.g., scopes (basically class methods by another name) or the aforementioned nested attributes), the biggest lessons I took away were about process. Stay organized. Try to build (and think) modularly, rather than balance a bunch of related things all at once. Use bindings and the console to watch how things fail and to test assumptions about what data is flowing where. The number of times that doing this gave me a new insight was more than I can count. Often I was subsequently disappointed to find that said insight didn't actually resolve the problem, but it did help me to understand the issue in a more nuanced way. That seems like one of those things I can just hear Avi saying in pretty much every Flatiron video I've watched. :)

## Up Next

Before I started at Flatiron, the small amount of technical knowledge I had about web development was all html and css. It's been a trip to start understanding core concepts on the backend. Next up is JavaScript and, wow... I think I'm actually going to be a developer.
