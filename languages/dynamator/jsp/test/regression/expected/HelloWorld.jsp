<%-- generated by Dynamator Sat Jul 26 15:26:54 CDT 2003
--%>
    <%@ page session="false" %>
    <%!
        private String getGreeting()
        {
            return "Hello World, says Dynamator!";
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