# generated by Dynamator Thu Oct 10 17:18:09 CDT 2002
print <<EOF;
<html>
  <head>
    <title>Font sizes</title>
  </head>
  <body>

EOF
for ( $i = 1; $i <= 7; ++$i ) {
  print <<EOF;
        <p><font size="$i">This is font size $i.</font></p>

EOF
}
print <<EOF;
    </body>
</html>

EOF