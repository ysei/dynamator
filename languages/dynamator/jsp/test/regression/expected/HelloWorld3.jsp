<%-- generated by Dynamator Sun Jan 06 22:35:11 CST 2002
--%>
    <%@ page session="false" %>
    <%!
        private String getGreeting()
        {
            return "<Hello&World>, says Dynamator!";
        }
    %>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Hello World</title>
  </head>
  <body>
    <p id="DynamicText"><%= getGreeting() %></p>
  </body>
</html>
