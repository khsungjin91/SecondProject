<!DOCTYPE html>
<HTML LANG="en">
<HEAD>
<META http-equiv="content-type" content="text/html; charset=utf-8">
<META name="robots" content="nofollow">
<LINK rel="stylesheet" type="text/css" href="/style/fresh.css" />
<link rel="stylesheet" type="text/css" href="/fresh/highlight.css" />
<TITLE>bootstrap-3.3.6.tar.gz: .../ie10-viewport-bug-workaround.js | Fossies</TITLE>
</HEAD>
<BODY>
<H2><IMG SRC="/warix/forest1.gif" WIDTH="45" HEIGHT="29" ALT=""> "<A HREF="/">Fossies</A>" - the Fresh Open Source Software Archive <IMG SRC="/warix/forest2.gif" WIDTH="48" HEIGHT="30" ALT=""></H2>
<H3>Member "bootstrap-3.3.6/docs/assets/js/ie10-viewport-bug-workaround.js" (24 Nov 2015, 641 Bytes) of archive <A HREF="/" TITLE="Fossies homepage">/</A><A HREF="/linux/" TITLE="Listing of all main folders within the Fossies basic folder /linux/">linux</A>/<A HREF="/linux/www/" TITLE="Listing of all packages within the Fossies folder /linux/www/">www</A>/<A HREF="/linux/www/bootstrap-3.3.6.tar.gz/" TITLE="Contents listing, member browsing, download with different compression formats, Doxygen generated source code documentation &amp; more ...">bootstrap-3.3.6.tar.gz</A>:</H3>
<HR>
<DIV class="fresh_info">
As a special service "Fossies" has tried to format the requested source page into HTML format using  source code syntax highlighting with prefixed line numbers and <A HREF="/features.html#members_hl">code folding</A> option.
Alternatively you can here <A HREF="/linux/www/bootstrap-3.3.6.tar.gz/bootstrap-3.3.6/docs/assets/js/ie10-viewport-bug-workaround.js?m=t">view</A> or <A HREF="/linux/www/bootstrap-3.3.6.tar.gz/bootstrap-3.3.6/docs/assets/js/ie10-viewport-bug-workaround.js?m=b">download</A> the uninterpreted source code file.
A member file download can also be achieved by clicking within a package contents listing on the according byte size field. For more information about "ie10-viewport-bug-workaround.js" see the <span class="fresh_info_amo"><A HREF="/dox/" TITLE="Fossies doxygen-generated source code documentation (main page)" REL="nofollow">Fossies "Dox"</A></span> <a href="/dox/bootstrap-3.3.6/ie10-viewport-bug-workaround_8js.html" TITLE="&quot;ie10-viewport-bug-workaround.js&quot;: Doxygen-generated file reference page with documentation of  functions.">file reference</a> documentation and the last <span class="fresh_info_amo"><A HREF="/diffs/" TITLE="Fossies source code differences reports (main page)" REL="nofollow">Fossies "Diffs"</A></span> side-by-side code changes report: <A HREF="/diffs/bootstrap/3.3.4_vs_3.3.5/docs/assets/js/ie10-viewport-bug-workaround.js-diff.html" TITLE="&quot;ie10-viewport-bug-workaround.js&quot; file currently unchanged, last changes on Fossies in a previous release report." STYLE="white-space: nowrap;"><IMG SRC="/delta_answer_10.png" WIDTH="13" HEIGHT="13"> 3.3.4_vs_3.3.5</A>.
</DIV>
<HR>
<script type="text/javascript" src="/scripts/highlight_cf_h.js">
</script>
<pre class="hl"><span id="l_1" class="hl fld"><span class="hl lin">    1 </span><span class="hl com">/*!</span></span>
<span id="l_2" class="hl fld"><span class="hl lin">    2 </span><span class="hl com"> * IE10 viewport hack for Surface/desktop Windows 8 bug</span></span>
<span id="l_3" class="hl fld"><span class="hl lin">    3 </span><span class="hl com"> * Copyright 2014-2015 Twitter, Inc.</span></span>
<span id="l_4" class="hl fld"><span class="hl lin">    4 </span><span class="hl com"> * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)</span></span>
<span id="l_5" class="hl fld"><span class="hl lin">    5 </span><span class="hl com"> */</span></span>
<span id="l_6" class="hl fld"><span class="hl lin">    6 </span></span>
<span id="l_7" class="hl fld"><span class="hl lin">    7 </span><span class="hl slc">// See the Getting Started docs for more information:</span></span>
<span id="l_8" class="hl fld"><span class="hl lin">    8 </span><span class="hl slc">// http://getbootstrap.com/getting-started/#support-ie10-width</span></span>
<span id="l_9" class="hl fld"><span class="hl lin">    9 </span></span>
<span id="l_10" class="hl fld"><span class="hl lin">   10 </span><span class="hl opt">(</span><span class="hl kwa">function</span> <span class="hl opt">() <script>hlOpen(10,1);</script>{</span></span>
<span id="l_11" class="hl fld"><span class="hl lin">   11 </span>  <span class="hl str">'use strict'</span><span class="hl opt">;</span></span>
<span id="l_12" class="hl fld"><span class="hl lin">   12 </span></span>
<span id="l_13" class="hl fld"><span class="hl lin">   13 </span>  <span class="hl kwa">if</span> <span class="hl opt">(</span>navigator<span class="hl opt">.</span>userAgent<span class="hl opt">.</span><span class="hl kwd">match</span><span class="hl opt">(</span><span class="hl kwc">/IEMobile\/10\.0/</span><span class="hl opt">)) <script>hlOpen(13,2);</script>{</span></span>
<span id="l_14" class="hl fld"><span class="hl lin">   14 </span>    <span class="hl kwa">var</span> msViewportStyle <span class="hl opt">=</span> document<span class="hl opt">.</span><span class="hl kwd">createElement</span><span class="hl opt">(</span><span class="hl str">'style'</span><span class="hl opt">)</span></span>
<span id="l_15" class="hl fld"><span class="hl lin">   15 </span>    msViewportStyle<span class="hl opt">.</span><span class="hl kwd">appendChild</span><span class="hl opt">(</span></span>
<span id="l_16" class="hl fld"><span class="hl lin">   16 </span>      document<span class="hl opt">.</span><span class="hl kwd">createTextNode</span><span class="hl opt">(</span></span>
<span id="l_17" class="hl fld"><span class="hl lin">   17 </span>        <span class="hl str">'&#64;-ms-viewport{width:auto!important}'</span></span>
<span id="l_18" class="hl fld"><span class="hl lin">   18 </span>      <span class="hl opt">)</span></span>
<span id="l_19" class="hl fld"><span class="hl lin">   19 </span>    <span class="hl opt">)</span></span>
<span id="l_20" class="hl fld"><span class="hl lin">   20 </span>    document<span class="hl opt">.</span><span class="hl kwd">querySelector</span><span class="hl opt">(</span><span class="hl str">'head'</span><span class="hl opt">).</span><span class="hl kwd">appendChild</span><span class="hl opt">(</span>msViewportStyle<span class="hl opt">)</span></span>
<span id="l_21" class="hl fld"><span class="hl lin">   21 </span>  <span class="hl opt"><script>hlClose(2, 21);</script>}</span></span>
<span id="l_22" class="hl fld"><span class="hl lin">   22 </span></span>
<span id="l_23" class="hl fld"><span class="hl lin">   23 </span><span class="hl opt"><script>hlClose(1, 23);</script>})();</span></span>
</pre>
<script type="text/javascript" src="/scripts/highlight_cf_f.js">
</script>
  </BODY></HTML><!--HTML generated by highlight, http://www.andre-simon.de/-->
