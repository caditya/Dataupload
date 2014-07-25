
<!DOCTYPE html>
<html>
<!--
   This is a jQuery Tools standalone demo. Feel free to copy/paste.
   http://flowplayer.org/tools/demos/

   Do *not* reference CSS files and images from flowplayer.org when in
   production Enjoy!
-->
<head>
  <title>Follett Apps</title>

    <!-- include the Tools -->
  <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
  
  <!-- standalone page styling (can be removed) -->
  <link rel="shortcut icon" href="http://jquerytools.org/media/img/favicon.ico">
  <link rel="stylesheet" type="text/css"
        href="http://jquerytools.org/media/css/standalone.css"/>

  <link rel="stylesheet" type="text/css"
      href="http://jquerytools.org/media/css/tabs-flowplayer-v2.css"/>
<style>
  #flowtabs li {
  list-style-image:none !important;
  list-style-type:none !important;
  margin:0 !important;
  }
  #content div.skin2 div h2 {
  margin-top:0px;
  color:#ddd;
  }
</style>

</head>
<body><!-- tabs -->
<div>

</div>
<ul id="flowtabs">
  <li><a id="t1" href="#player_tab">Utilities</a></li>
  <li><a id="t2" href="#plugins_tab">SQL Queries</a></li>
  <li><a id="t3" href="#streaming_tab">Dashboard</a></li>
  <li><a id="t3" href="#streaming_tab">About </a></li>
</ul>

<!-- panes -->
<div id="flowpanes">

  <!-- remove the space between tabs and panes -->
  <br clear="all" />

  <div>
    

    <img src="http://jquerytools.org/media/img/title/screens.png" alt="Flying screens"
         style="float:left;margin:0 30px 200px 0" />

    <p style="font-weight:bold">
      <a href="/connector/file"> Upload data </a>
    </p>
   
  
  </div>

  <div>
    <img src="http://www.follett.com/images/home_logo.gif" alt="Follett Apps" />

      
  </div>

  <div>
    

    

    <img src="http://www.follett.com/images/home_logo.gif" alt="Follett Apps" />

  </div>

  <div>
    <img src="http://www.follett.com/images/home_logo.gif" alt="Follett Apps" />
	
    
  </div>
</div>

<script>
  $(function() {
      $("#flowtabs").tabs("#flowpanes > div");
    });
</script>

</body>
</html>