---
layout: page
title: Projects
permalink: /projects/
---

{% for project in site.data.projects %}
{% include project_block.html %}
{% endfor %}
