{%- set js_vendors = {} %}
{%- set js_defer_vendors = {} %}
{%- set js_vendors.jquery = 'jquery/index.js?v=3.4.1' %}

{%- if theme.pjax %}
  {%- set js_vendors.pjax = 'pjax/pjax.min.js?v=0.2.8' %}
{%- endif %}

{%- if theme.fancybox %}
  {%- set js_vendors.fancybox = 'fancybox/source/jquery.fancybox.pack.js' %}
{%- endif %}

{%- if theme.mediumzoom %}
  {%- set js_vendors.mediumzoom = 'mediumzoom/medium-zoom.min.js' %}
{%- endif %}

{%- if theme.lazyload %}
  {%- set js_vendors.lazyload = 'lazyload/lozad.min.js?v=1.10.0' %}
{%- endif %}

{%- if theme.pangu %}
  {%- set js_vendors.pangu = 'pangu/dist/pangu.min.js?v=4.0.7' %}
{%- endif %}

{%- if theme.motion.enable %}
  {%- set js_vendors.velocity = 'velocity/velocity.min.js?v=1.2.1' %}
  {%- set js_vendors.velocity_ui = 'velocity/velocity.ui.min.js?v=1.2.1' %}
{%- endif %}

{%- if theme.three.enable and not theme.three.delay %}
  {%- if theme.three.three_waves %}
    {%- set js_defer_vendors.three = 'three/three.min.js' %}
    {%- set js_defer_vendors.three_waves = 'three/three-waves.min.js' %}
  {%- endif %}
  {%- if theme.three.canvas_lines %}
    {%- set js_defer_vendors.three = 'three/three.min.js' %}
    {%- set js_defer_vendors.canvas_lines = 'three/canvas_lines.min.js' %}
  {%- endif %}
  {%- if theme.three.canvas_sphere %}
    {%- set js_defer_vendors.three = 'three/three.min.js' %}
    {%- set js_defer_vendors.canvas_sphere = 'three/canvas_sphere.min.js' %}
  {%- endif %}
{%- endif %}

{%- if theme.canvas_nest.enable %}
  {%- if theme.canvas_nest.onmobile %}
    {%- set canvas_nest_uri = theme.vendors.canvas_nest | default(url_for(theme.vendors._internal + '/canvas-nest/canvas-nest.min.js')) %}
  {% else %}
    {%- set canvas_nest_uri = theme.vendors.canvas_nest_nomobile | default(url_for(theme.vendors._internal + '/canvas-nest/canvas-nest-nomobile.min.js')) %}
  {%- endif %}
  <script color='{{ theme.canvas_nest.color }}' opacity='{{ theme.canvas_nest.opacity }}' zIndex='{{ theme.canvas_nest.zIndex }}' count='{{ theme.canvas_nest.count }}' src="{{ canvas_nest_uri }}"></script>
{%- endif %}

{%- if theme.canvas_ribbon.enable %}
  {%- set canvas_ribbon_uri = theme.vendors.canvas_ribbon | default(url_for(theme.vendors._internal + '/canvas-ribbon/canvas-ribbon.js')) %}
  <script size="{{ theme.canvas_ribbon.size }}" alpha="{{ theme.canvas_ribbon.alpha }}" zIndex="{{theme.canvas_ribbon.zIndex }}" src="{{ canvas_ribbon_uri }}"></script>
{%- endif %}

{%- for name, internal in js_vendors %}
  {%- set internal_script = url_for(theme.vendors._internal + '/' + internal) %}
  <script src="{{ theme.vendors[name] | default(internal_script) }}"></script>
{%- endfor %}

{%- for name, internal in js_defer_vendors %}
  {%- set internal_script = url_for(theme.vendors._internal + '/' + internal) %}
  <script defer src="{{ theme.vendors[name] | default(internal_script) }}"></script>
{%- endfor %}
