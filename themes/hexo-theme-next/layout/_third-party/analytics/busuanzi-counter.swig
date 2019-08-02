{% if theme.busuanzi_count.enable %}
<script async src="/js/src/busuanzi.pure.mini.js">
<div class="busuanzi-count">
<<<<<<< HEAD
  {% if theme.busuanzi_count.site_uv %}
    <span class="site-uv">
      {{ theme.busuanzi_count.site_uv_header }}
       <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
=======
  <script async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {% if theme.busuanzi_count.site_uv %}
    <span class="site-uv">
      {{ theme.busuanzi_count.site_uv_header }}
      访客数:<span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
>>>>>>> d7111a907807eff1842740c2a6f418671fdc2669
      {{ theme.busuanzi_count.site_uv_footer }}
    </span>
  {% endif %}

  {% if theme.busuanzi_count.site_pv %}
    <span class="site-pv">
	  {{ theme.busuanzi_count.site_pv_footer }}	
      {{ theme.busuanzi_count.site_pv_header }}
<<<<<<< HEAD
       <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
	  {{ theme.busuanzi_count.site_pv_footer }}	
=======
      总访问量:<span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
>>>>>>> d7111a907807eff1842740c2a6f418671fdc2669
    </span>
  {% endif %}
</div>
{% endif %}