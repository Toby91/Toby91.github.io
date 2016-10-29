---
layout: default
title: Jan Tobola Blog
description: I am Jan Tobola and this is my personal blog about programming and interesting things from programming world I've had to deal with...
---

<div class="home" id="home">
  <h1 class="pageTitle">Recent Posts</h1>
  <ul class="posts noList">
    {% if paginator.posts.size > 0 %}
      {% for post in paginator.posts %}
        <li>
          <span class="date">{{ post.date | date: '%B %d, %Y' }}</span>
          <h3><a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h3>
          <p class="description">{% if post.description %}{{ post.description | strip_html | strip_newlines | truncate: 250 }}{% else %}{{ post.content | strip_html | strip_newlines | truncate: 250 }}{% endif %}</p>
        </li>
      {% endfor %}
    {% else %}
      <h3 class="primary-color">No posts yet :(</h3>
    {% endif %}
  </ul>
  <!-- Pagination links -->
  <div class="pagination">
    {% if paginator.previous_page %}
      <a href="{{ paginator.previous_page_path | prepend: site.baseurl }}" class="previous button__outline">Newer Posts</a> 
    {% endif %}
    {% if paginator.next_page %}
      <a href="{{ paginator.next_page_path | prepend: site.baseurl }}" class="next button__outline">Older Posts</a>
    {% endif %}
  </div>
</div>
