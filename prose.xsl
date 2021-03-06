<?xml version="1.0" encoding="UTF-8"?>
<xslg:stylesheet version="1.0" xmlns:xslg="http://www.w3.org/1999/XSL/Transform" xmlns:pro="http://prose.foo/2016-02-19/1/" xmlns:xsl="urn-to-be-replaced" exclude-result-prefixes="">
  <xslg:output method="xml" encoding="UTF-8" indent="yes"/>
  <xslg:variable name="QUOT">&quot;</xslg:variable>
  <xslg:variable name="APOS">&apos;</xslg:variable>
  <!-- formatA-to-formatB -->
  <xslg:param name="source">formatA</xslg:param>
  <xslg:param name="result">formatB</xslg:param>
  <!-- formatA-to-formatC -->
  <!-- formatB-to-formatA -->
  <!-- formatB-to-formatC -->
  <!-- formatC-to-formatA -->
  <!-- formatC-to-formatB -->
  <xslg:template match="pro:prose">
    <xslg:comment> Generated by prose ;-) </xslg:comment>
    <xslg:comment>
      <xslg:text>   Remove &lt;&lt; xmlns:pro="http://prose.foo/2016-02-19/1/" &gt;&gt;;   </xslg:text>
    </xslg:comment>
    <xslg:comment>
      <xslg:text>   Replace "urn-to-be-replaced" by "http://www.w3.org/1999/XSL/Transform"; and </xslg:text>
    </xslg:comment>
    <xslg:comment>
      <xslg:text>   Save as </xslg:text>
      <xslg:text>&quot;generated.</xslg:text>
      <xslg:value-of select="$source"/>
      <xslg:text>-to-</xslg:text>
      <xslg:value-of select="$result"/>
      <xslg:text>.xsl</xslg:text>
      <xslg:text>&quot;</xslg:text>
      <xslg:text> </xslg:text>
    </xslg:comment>
    <!-- It starts here! -->
    <xsl:stylesheet version="1.0">
      <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
      <xslg:variable name="result_prose" select="pro:commitments/pro:commitment[@of=$result]/pro:meaning[1]/pro:prose"/>
      <xslg:variable name="result_fragXSL" select="pro:commitments/pro:commitment[@of=$result]/pro:meaning[1]/pro:fragXSL"/>
      <xslg:variable name="source_XPath" select="translate(pro:commitments/pro:commitment[@of=$source]/pro:meaning[pro:prose = $result_prose]/pro:XPath, $QUOT, $APOS)"/>
      <xsl:template match="{$source_XPath}">
        <xsl:comment>
          <xsl:text> Save as </xsl:text>
          <xsl:text>&quot;</xsl:text>
          <xsl:text>
            <xslg:value-of select="$result"/>
          </xsl:text>
          <xsl:text>.instance.mapped-from-</xsl:text>
          <xsl:text>
            <xslg:value-of select="$source"/>
          </xsl:text>
          <xsl:text>.xml" </xsl:text>
        </xsl:comment>
        <xslg:copy-of select="$result_fragXSL/*"/>
      </xsl:template>
    </xsl:stylesheet>
  </xslg:template>
</xslg:stylesheet>
