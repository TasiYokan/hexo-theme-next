{% extends '_layout.swig' %}
{% import '_macro/about.swig' as about_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %}{{ page.title }} | {{ config.title }}{% endblock %}

{% block content %}

<div id="posts" class="posts-expand">
    {{ about_template.render(page) }}
</div>

{% endblock %}

{% block sidebar %}
{{ sidebar_template.render(true) }}
{% endblock %}

{% block sidebar %}
{{ sidebar_template.render(false) }}
{% endblock %}