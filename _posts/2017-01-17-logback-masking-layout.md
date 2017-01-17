---
title: Java Logging - Logback masking layout
hidden: true
---

Hi, guys! This is my very first post and I would like to share with you how to mask sensitive data during the logging of Java application. I was thinking what topic would be interesting enough as a first post, but I have been collecting ideas for too long and today I said to myself, that the best solution will be to stop procrastinate and just write something. Today at work I was working on some custom Logback layout/encoder and the best topic is, of course, the one I already have in my head. So let's do this.

In applications of any kind, the logging is one of the most important and necessary things in general. In Java world, We have some choices how to add logging to our application. We can use ``java.util.logging``, which is a default [Java Logging API](http://docs.oracle.com/javase/7/docs/technotes/guides/logging/overview.html), or we can use some third party logging frameworks such as [Log4J](https://logging.apache.org/log4j/2.x/), [Logback](http://logback.qos.ch/), and [Apache Commons Logging](http://commons.apache.org/proper/commons-logging/). I am used to using [SLF4J](https://www.slf4j.org/) with Logback and I would recommend it to you as well. SLF4J is an abstraction for various logging frameworks and Logback is its native implementation. This is not a coincidence. Both projects and also Log4J have the same founder - [Ceki Gülcü](http://stackoverflow.com/users/100970/ceki).

Enough about boring theory and let's finally write some code!

What we will actually write? Imagine a situation when you log lots of information including sensitive data, e.g. client's email, phone number etc. Since this may be ok on some environments with testing data, you may don’t want to or even cannot expose such information in production logs for some reason. Probably the best solution here is to not log sensitive data in a first place. But some data may be captured using regular expressions and it would be handy to define those expressions and literally mask captured data on the fly by our logger. Even better would be to be able to define these things completely from ``logback.xml``. To make this happen, we have to write our own implementation of ``ch.qos.logback.core.Layout``, in fact we will extend existing ``ch.qos.logback.classic.PatternLayout`` and modify ``doLayout(ILoggingEvent event)`` method a little to handle masking.

First of all, add those two maven dependencies to our project.
<pre><code class="xml">
    &lt;dependency&gt;
        &lt;groupId&gt;org.slf4j&lt;/groupId&gt;
        &lt;artifactId&gt;slf4j-api&lt;/artifactId&gt;
        &lt;version&gt;1.7.22&lt;/version&gt;
    &lt;/dependency&gt;
    &lt;dependency&gt;
        &lt;groupId&gt;ch.qos.logback&lt;/groupId&gt;
        &lt;artifactId&gt;logback-classic&lt;/artifactId&gt;
        &lt;version&gt;1.1.8&lt;/version&gt;
    &lt;/dependency&gt;
</code></pre>



