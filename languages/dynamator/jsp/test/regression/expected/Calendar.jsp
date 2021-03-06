<%-- generated by Dynamator Sun Feb 15 17:32:58 CST 2004
--%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Dictionary" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DateFormatSymbols" %>
<%!
    private static final Dictionary dates = new Hashtable();
    static
    {
        // certainly not an exhaustive list, 
        // but at least one per month
        dates.put("1/27",  "Wolfgang Amadeus Mozart, 1756");
        dates.put("2/3",   "Felix Mendelssohn, 1809");
        dates.put("2/23",  "Georg Friedrich Handel, 1685");
        dates.put("3/21",  "Johann Sebastian Bach, 1685");
        dates.put("3/25",  "Bela Bartok, 1881");
        dates.put("3/31",  "Franz Joseph Haydn, 1732");
        dates.put("4/27",  "Sergei Prokofiev, 1891");
        dates.put("5/5",   "Johannes Brahms, 1833");
        dates.put("6/2",   "Sir Edward Elgar, 1857");
        dates.put("6/15",  "Edward Grieg, 1843");
        dates.put("7/3",   "Leos Janacek, 1854");
        dates.put("7/7",   "Gustav Mahler, 1860");
        dates.put("8/22",  "Claude Debussy, 1862");
        dates.put("9/4",   "Anton Bruckner, 1824");
        dates.put("9/8",   "Anton Dvorak, 1841");
        dates.put("9/26",  "George Gershwin, 1898");
        dates.put("10/20", "Charles Ives, 1874");
        dates.put("10/22", "Franz List, 1811");
        dates.put("11/18", "Carl Weber, 1786");
        dates.put("12/10", "Cesar Franck, 1822");
        dates.put("12/15", "Ludwig van Beethoven, 1770");
        dates.put("12/30", "Dmitri Kabalevsky, 1904");
    }
%>
<%
    Locale locale = Locale.getDefault();
    String event;

    Calendar calendar = Calendar.getInstance(locale);
    int firstDayOfWeek = calendar.getFirstDayOfWeek();

    DateFormatSymbols dateFormatSymbols = new DateFormatSymbols(locale);
    // weekday names is one-based; [0] is empty
    String[] dayNames;
    {
        String[] originalDayNames =  dateFormatSymbols.getShortWeekdays();
        dayNames = new String[originalDayNames.length-1];
        System.arraycopy(
            originalDayNames, firstDayOfWeek, 
            dayNames, 0, dayNames.length-(firstDayOfWeek-1));
        if ( firstDayOfWeek != 1 )
        {
            System.arraycopy(
                originalDayNames, 1,
                dayNames, dayNames.length-(firstDayOfWeek-1), firstDayOfWeek-1);
        }
    }
    String[] monthNames = dateFormatSymbols.getMonths();
    
    // get info about today
    int thisDay = calendar.get(Calendar.DAY_OF_MONTH);
    int thisMonth = calendar.get(Calendar.MONTH);
    int thisYear = calendar.get(Calendar.YEAR);

    // get requested month/year
    int calendarMonth;
    int calendarYear;
    String sMonth = request.getParameter("month");
    String sYear  = request.getParameter("year");
    if ( sMonth != null && sMonth.length() > 0 )
    {
        calendarMonth = Integer.parseInt(sMonth);
    }
    else
    {
        calendarMonth = thisMonth;
    }
    if ( sYear != null && sYear.length() > 0 )
    {
        calendarYear = Integer.parseInt(sYear);
    }
    else
    {
        calendarYear = thisYear;
    }
    String monthName = monthNames[calendarMonth];

    calendar.set(Calendar.DAY_OF_MONTH, 1);
    calendar.set(Calendar.MONTH, calendarMonth);
    calendar.set(Calendar.YEAR, calendarYear);

    // what weekday is the first day of the month?
    int firstWeekdayOfMonth = calendar.get(Calendar.DAY_OF_WEEK);

    // calendarDay contains the day of the month.  It is initialized to
    // a negative value and incremented for each cell in the calendar
    // so that its value is 1 on the cell for the first day of the month.
    int calendarDay = 1 + firstDayOfWeek - firstWeekdayOfMonth;

    // what's the last day of the month?
    calendar.add(Calendar.MONTH, 1);
    calendar.add(Calendar.DAY_OF_MONTH, -1);
    int lastDayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);
    int lastWeekOfMonth = calendar.get(Calendar.WEEK_OF_MONTH);

    // set up the links
    int maxMonth = calendar.getMaximum(Calendar.MONTH);
    int prevMonth = calendarMonth - 1;
    int prevYear  = calendarYear;
    if ( prevMonth < 0 )
    {
        prevMonth = maxMonth;
        --prevYear;
    }

    int nextMonth = calendarMonth + 1;
    int nextYear  = calendarYear;
    if ( nextMonth > maxMonth )
    {
        nextMonth = 0;
        ++nextYear;
    }
%>
<!--
    Calendar
    
    Calendar months have varying numbers of weeks and varying
    patterns of days (starting and ending on different days of the
    week).  Therefore the HTML markup for this example uses the notion
    of "prototypes".  This HTML demo page shows a single, real month.
    Out of the five weeks in the month, one week is selected as the
    prototype week.  Out of the 7 days in that week, one is selected as
    the prototype day.  This day shows all possible data that might be
    displayed for any given day.
    
    Each prototype is given an id.  The programmer instructs Dynamator
    to remove all non-prototype weeks and days, and uses the prototype
    ones to build the calendar at runtime.
--><html>
  <head>
    <title><%= 
    monthName + " " + calendarYear
   %></title>
    <style type="text/css">
      a
      {
          text-decoration: none;
          color: #f9f9ee;
          font-weight: bold;
      }
      td
      {
          font-size: 10pt;
          font-family: sans-serif;
      }
      .month-header
      {
          background-color: #666666;
          color: #f9f9ee;
      }
      #month-title
      {
          background-color: #666666;
          color: #f9f9ee;
      }
      .day-header
      {
          background-color: #778899;
          color: #f9f9ee;
          text-align: center;
      }
      .weekday-name
      {
          background-color: #778899;
          color: #f9f9ee;
          text-align: center;
      }
      .other-month
      {
          background-color: #f9f9ee;
          width: 75px;
          height: 75px;
          vertical-align: top;
      }
      .this-month
      {
          background-color: #f0f0cc;
          width: 75px;
          height: 75px;
          vertical-align: top;
      }
      #today
      {
          background-color: #ffff99;
          height: 75px;
          vertical-align: top;
      }
      .event
      {
          font-size: 8pt;
      }
    </style>
  </head>
  <body>
    <table align="center" border="1" cellpadding="1" cellspacing="0">
      <tr class="month-header">
        <td colspan="7">
          <table border="0" width="100%">
            <tr>
              <td align="left"><a id="prev" href="<%= 
      response.encodeURL(request.getRequestURI() 
        + "?month=" + prevMonth 
        + "&year="  + prevYear)
     %>">&#171;</a></td>
              <td id="month-title" align="center"><%= 
    monthName + " " + calendarYear
   %></td>
              <td align="right"><a id="next" href="<%= 
      response.encodeURL(request.getRequestURI() 
        + "?month=" + nextMonth 
        + "&year="  + nextYear)
     %>">&#187;</a></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr class="day-header">
<%
          {
            String[] $dayNames = dayNames;
            int lim$dayNames = $dayNames.length;
            String dayName;
            for ( int i$dayNames = 0; i$dayNames < lim$dayNames; ++i$dayNames )
            {
              dayName = $dayNames[i$dayNames];
        %><td class="weekday-name"><%= 
    dayName
   %></td><%
            }
          }
        %>
      </tr>
<%
        for ( int weekOfMonth = 0; weekOfMonth < lastWeekOfMonth; ++weekOfMonth )
        {
      %><tr class="week">
<%
              for ( int dayOfWeek = 0; dayOfWeek < dayNames.length; ++dayOfWeek, ++calendarDay )
              {
            %><td<%
                  if ( calendarDay == thisDay && calendarMonth == thisMonth && calendarYear == thisYear ) 
                  {
                    %> id="today"<%
                  }
                %> class="<%= 
      1 <= calendarDay && calendarDay <= lastDayOfMonth
      ? "this-month"
      : "other-month"
     %>" height="75" width="75"><%= 
      1 <= calendarDay && calendarDay <= lastDayOfMonth
      ? String.valueOf(calendarDay)
      : "&nbsp;"
   %>
<%
                    if ( null != (event = (String) dates.get(String.valueOf(calendarMonth+1) + "/" + String.valueOf(calendarDay))) ) 
                    {
                      %><p class="event"><%= 
    event
   %></p><%
                    }
                  %>
                </td><%
              }  // for
            %>
          </tr><%
        }  // for
      %>
    </table>
  </body>
</html>
