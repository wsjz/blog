<!DOCTYPE html>

{# NexT version #}
{%- set version = next_env('version') %}

{# Language & Config #}
{%- set title = __('title') !== 'title' && __('title') || config.title %}
{%- set subtitle = __('subtitle') !== 'subtitle' && __('subtitle') || config.subtitle %}
{%- set author = __('author') !== 'author' && __('author') || config.author %}
{%- set description = __('description') !== 'description' && __('description') || config.description %}

{%- if theme.pjax %}
  {%- set pjax = ' pjax' %}
{%- endif %}

{%- set html_class = 'theme-next ' + theme.scheme %}
{%- if theme.motion.enable %}
  {%- set html_class = html_class + ' use-motion' %}
{%- endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  {{- next_inject('head') }}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">

  {%- set container_class = 'container' %}
  {%- if theme.sidebar.position %}
    {%- set container_class = container_class + ' sidebar-position-' + theme.sidebar.position %}
  {%- endif %}

  <div class="{{ container_class }}">
    <div class="headband"></div>
  <!--   <a href="https://github.com/wsjz" class="github-corner" aria-label="View source on GitHub"><svg width="80" height="80" viewBox="0 0 250 250" style="fill:#151513; color:#fff; position: absolute; top: 0; border: 0; right: 0;" aria-hidden="true"><path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"></path><path d="M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2" fill="currentColor" style="transform-origin: 130px 106px;" class="octo-arm"></path><path d="M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z" fill="currentColor" class="octo-body"></path></svg></a>
    <style>.github-corner:hover .octo-arm{animation:octocat-wave 560ms ease-in-out}@keyframes octocat-wave{0%,100%{transform:rotate(0)}20%,60%{transform:rotate(-25deg)}40%,80%{transform:rotate(10deg)}}@media (max-width:500px){.github-corner:hover .octo-arm{animation:none}.github-corner .octo-arm{animation:octocat-wave 560ms ease-in-out}}</style> -->

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner">{% include '_partials/header/index.swig' %}</div>
    </header>

    {{ partial('_partials/github-banner.swig', {}, {cache: theme.cache.enable}) }}

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          {%- if theme.scheme === 'Pisces' || theme.scheme === 'Gemini' %}
            {% include '_partials/header/sub-menu.swig' %}
          {%- endif %}
          <div id="content" class="content {% block page_class %}{% endblock %}">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
        {%- if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {%- endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-inner">
        {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
        {{ partial('_partials/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {%- if theme.back2top.enable and not theme.back2top.sidebar %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {%- if theme.back2top.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {%- endif %}
      </div>
    {%- endif %}

    {%- if theme.reading_progress.enable %}
      <div class="reading-progress-bar"></div>
    {%- endif %}

    {{ partial('_partials/share/index.swig', {}, {cache: theme.cache.enable}) }}
  </div>

  {{ partial('_scripts/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_third-party/index.swig', {}, {cache: theme.cache.enable}) }}

  {%- if theme.pjax %}
    <div id="pjax">
  {%- endif %}

  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/quicklink.swig' %}
  {% include '_third-party/vkontakte-api.swig' %}

  {% block script_extra %}{% endblock %}

  {{- next_inject('bodyEnd') }}

  {%- if theme.pjax %}
    </div>
    {% include '_partials/pjax.swig' %}
  {%- endif %}
  <div class="bg_content">
    <canvas id="canvas"></canvas>
  </div>
</body>
</html>
  <!-- 页面点击小红心 -->
{% if theme.clicklove %}
      <script type="text/javascript" src="/js/clicklove.js"></script>
{% endif %}

<!--崩溃欺骗-->
<script type="text/javascript" src="/js/crash_cheat.js"></script>

<!-- <script src="/live2d-widget/autoload.js"></script> -->

<script type="text/javascript" src="/js/dynamic_bg.js"></script>
