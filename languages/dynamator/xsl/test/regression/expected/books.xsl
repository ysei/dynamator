<?xml version="1.0"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0" >

<xsl:template match="/">
<!-- Modified from Michael Kay's XSLT Programmer's Reference --><html>
  <head>
    <title>A list of books</title>
  </head>
  <body>
    <h1>A list of books</h1>
    <table border="2">
      <xsl:for-each select="//book">
        <tr class="book">
          <td class="author"><xsl:value-of select="author"/></td>
          <td class="title"><xsl:value-of select="title"/></td>
          <td class="category"><xsl:value-of select="@category"/></td>
          <td class="price"><xsl:value-of select="price"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
</html>

</xsl:template>
</xsl:stylesheet>
<!-- generated by Dynamator Mon Mar 29 22:38:41 CST 2004 -->