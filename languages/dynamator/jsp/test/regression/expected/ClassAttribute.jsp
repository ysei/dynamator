<%-- generated by Dynamator Sun Feb 15 17:32:58 CST 2004
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
    <title>Dynamator class example</title>
  </head>
  <body>
    <h1 class="DynamicText"><%= getGreeting() %></h1>
    <p class="DynamicText"><%= getGreeting() %></p>
  </body>
</html>