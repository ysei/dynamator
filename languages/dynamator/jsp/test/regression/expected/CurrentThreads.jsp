<%-- generated by Dynamator Sun Feb 15 17:35:43 CST 2004
--%>
    <%@ page session="false" %>
    <%
        ThreadGroup tg = Thread.currentThread().getThreadGroup();

        Thread[] threads = new Thread[tg.activeCount()];
        int n = tg.enumerate(threads);

        if ( n < threads.length )
        {
            Thread[] newThreads = new Thread[n];
            System.arraycopy(threads, 0, newThreads, 0, n);
            threads = newThreads;
        }
    %>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Currently Executing Threads</title>
  </head>
  <body>
    <table border="1">
      <tr align="center">
        <td>Name</td>
        <td>Priority</td>
        <td>Daemon?</td>
        <td>Alive?</td>
        <td>Running?</td>
      </tr>
<%
        {
          Thread[] $threads = threads;
          int lim$threads = $threads.length;
          Thread thread;
          for ( int iThreads = 0; iThreads < lim$threads; ++iThreads )
          {
            thread = $threads[iThreads];
      %><tr align="center">
              <td id="name"><%= thread.getName() %></td>
              <td id="priority"><%= thread.getPriority() %></td>
              <td><%
                  if ( thread.isDaemon() ) 
                  {
                    %><span id="isDaemon">Y</span><%
                  }
                %> <%
                  if ( !thread.isDaemon() ) 
                  {
                    %><span id="isNotDaemon">&nbsp;</span><%
                  }
                %> </td>
              <td><%
                  if ( thread.isAlive() ) 
                  {
                    %><span id="isAlive">Y</span><%
                  }
                %> <%
                  if ( !thread.isAlive() ) 
                  {
                    %><span id="isNotAlive">&nbsp;</span><%
                  }
                %> </td>
              <td><%
                  if ( thread.isInterrupted() ) 
                  {
                    %><span id="isInterrupted">&nbsp;</span><%
                  }
                %> <%
                  if ( !thread.isInterrupted() ) 
                  {
                    %><span id="isNotInterrupted">Y</span><%
                  }
                %> </td>
            </tr><%
          }
        }
      %>
    </table>
  </body>
</html>
