<div class="site-brand-wrapper">
  <div class="site-meta {% if theme.custom_logo.enabled %}custom-logo{% endif %}">
    {% if theme.custom_logo.image and theme.scheme === 'Muse' %}
      <div class="site-meta-headline">
        <a>
          <img class="custom-logo-image" src="{{ theme.custom_logo.image }}"
               alt="{{ config.title }}"/>
        </a>
      </div>
    {% endif %}

    <div class="custom-logo-site-title">
      <a href="{{ config.root }}"  class="brand" rel="start">
        <span class="logo-line-before"><i></i></span>
        <span class="site-title">{{ config.title }}</span>
        <span class="logo-line-after"><i></i></span>
      </a>
    </div>
      {% if theme.seo %}
        <h1 class="site-subtitle" itemprop="description">{{ config.subtitle }}</h1>
      {% else %}
        <p class="site-subtitle">{{ config.subtitle }}</p>
      {% endif %}
  </div>

  <div class="site-nav-toggle">
    <button>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
    </button>
  </div>
</div>

<nav class="site-nav">
  {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}

  {% if theme.menu %}
    <ul id="menu" class="menu">
      {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        {% if (itemName !== "archives") %}
        <li class="menu-item menu-item-{{ itemName }}">
          <a href="{{ url_for(path) }}" rel="section">
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-fw fa-{{theme.menu_icons[itemName] | default('question-circle') | lower }}"></i> <br />
            {% endif %}
            {{ __('menu.' + name) }}
          </a>
        </li>
        {% endif %}
      {% endfor %}
      <!-- {% set itemName = "home" %}
      <li class="menu-item menu-item-{{ itemName }}">
        <a href="{{ url_for("/") }}" rel="section">
          {% if theme.menu_icons.enable %}
            <i class="menu-item-icon fa fa-fw fa-{{theme.menu_icons[itemName] | default('question-circle') | lower }}"></i> <br />
          {% endif %}
          {{ __('menu.' + "home") }}
        </a>
      </li> -->

      {% if hasSearch %}
        <li class="menu-item menu-item-search">
          {% if theme.swiftype_key %}
            <a href="javascript:;" class="st-search-show-outputs">
          {% elseif theme.local_search.enable || theme.algolia_search.enable %}
            <a href="javascript:;" class="popup-trigger">
          {% endif %}
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />
            {% endif %}
            {{ __('menu.search') }}
          </a>
        </li>
      {% endif %}
    </ul>
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}

  
{% if true %}
  <div class="site-author" itemprop="author" itemscope itemtype="http://schema.org/Person">
    <img class="site-author-image" itemprop="image"
          src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"
          alt="{{ theme.author }}" />
    <p class="site-author-name" itemprop="name">{{ theme.author }}</p>
      {% if theme.seo %}
        <p class="site-description motion-element" itemprop="description">{{ theme.signature }}</p>
      {% else %}
        <p class="site-description motion-element" itemprop="description">{{ theme.description }}</p>
    {% endif %}
  </div>

  <nav class="site-state">
    {% if config.archive_dir != '/' %}
      <div class="site-state-item site-state-posts">
        <a href="{{ url_for(theme.menu.archives) }}">
          <span class="site-state-item-count">{{ site.posts.length }}</span>
          <span class="site-state-item-name">{{ __('state.posts') }}</span>
        </a>
      </div>
    {% endif %}

    {% if site.categories.length > 0 %}
      {% set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}
      {% set hasCategoriesPage = categoriesPageQuery.length > 0 %}
      <div class="site-state-item site-state-categories">
        {% if hasCategoriesPage %}<a href="{{ url_for(categoriesPageQuery[0].path) }}">{% endif %}
          <span class="site-state-item-count">{{ site.categories.length }}</span>
          <span class="site-state-item-name">{{ __('state.categories') }}</span>
        {% if hasCategoriesPage %}</a>{% endif %}
      </div>
    {% endif %}

    {% if site.tags.length > 0 %}
      {% set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}
      {% set hasTagsPage = tagsPageQuery.length > 0 %}
      <div class="site-state-item site-state-tags">
        {% if hasTagsPage %}<a href="{{ url_for(tagsPageQuery[0].path) }}">{% endif %}
          <span class="site-state-item-count">{{ site.tags.length }}</span>
          <span class="site-state-item-name">{{ __('state.tags') }}</span>
        {% if hasTagsPage %}</a>{% endif %}
      </div>
    {% endif %}
  </nav>
  </p>

  {% if theme.rss %}
  <div class="feed-link">
    <a href="{{ url_for(theme.rss) }}" rel="alternate">
      <i class="fa fa-rss"></i>
      RSS
    </a>
  </div>
  {% endif %}

  {% if theme.social %}
  <div class="links-of-author">
    <span class="site-author-name">
      <!-- <p>友情链接</p> -->
    </span>
    {% for name, link in theme.social %}
    <span class="links-of-author-item">
      <a href="{{ link }}" target="_blank" title="{{ name }}">
        {% if theme.social_icons.enable %}
        <i class="fa fa-fw fa-{{ theme.social_icons[name] | default('globe') | lower }}"></i>
        {% endif %}
        {{ name }}
      </a>
    </span>
    {% endfor %}
  </div>
  {% endif %}

{% endif %}
</nav>


{% include '../_custom/header.swig' %}
