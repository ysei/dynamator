<% ' generated by Dynamator Thu Oct 10 16:46:38 CDT 2002
%>
    <%@ Language=VBScript %>
  <html>
  <head>
    <title>Font sizes</title>
  </head>
  <body>
    
    <%
      For i = 1 to 7
    %>
      <p><font size="<%= i %>">This is font size <%= i %>.</font></p>
    <%
      Next
    %>
  </body>
</html>