---
layout: default
title: About Me
---

{% assign currentYear = site.time | date: '%Y' %}

<div class="post">
	<h1 class="pageTitle">About Me</h1>
	<p class="intro">
    {{ currentYear | minus: 2012 }}+ years’ experience with development of large systems written in Java.
    Good sense of clean code and object oriented design. 
  </p>
	<p markdown="1">
    Download my [curriculum vitae][1]{:target="_blank"} or visit my Linkedin [profile][2]{:target="_blank"}
  </p>
</div>

[1]: {{ '/assets/files/Jan_Tobola_CV_en.pdf' | prepend: site.baseurl }}
[2]: https://linkedin.com/in/jan-tobola-30335761