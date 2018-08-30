char    html_code[] = "\HTTP/1.1 200 OK\nConnection: close\nContent-type: text/html\n\n\
<HTML><HEAD>\
<link rel=\"icon\" type=\"image/png\" href=\"https://png.icons8.com/ios/50/000000/facebook.png\">\
<TITLE>PME Clock</TITLE>\
</HEAD><BODY>\
<style>body {background-color: #ddffcc;}</style>\
<center>\
<h2>PME Clock</h2>\
<h3>Time | <a href=/2>SNTP</a> | <a href=/3>Network</a> | <a href=/4>System</a> | <a href=/admin>ADMIN</a></h3>\
<table border=1 style=\"font-size:20px ;font-family: terminal ;\" width=500>\
<tr><td>Date and Time</td><td align=right><script>document.write(\"Cao\")</script></td></tr>\
<tr><td>Unix Epoch</td><td align=right><script>document.write(\"EPOCH\")</script></td></tr>\
<tr><td>Julian Day</td><td align=right><script>document.write(\"EPOCH / 24 / 3600 + 2440587.5\")</script></td></tr>\
<tr><td>Last sync</td><td align=right><script>document.write(\"LAST\")</script></td></tr>\
<HTML><HEAD>\
</table>\
<br>\
Pogledajte ceo proizvodni program na <a href=http://www.pme.rs target=_blank>www.pme.rs</a>\
</center>\
</BODY></HTML>" ;
