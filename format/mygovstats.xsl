<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	</html>
</xsl:template>

<!-- Generate block[@blocktype='stats'] -->
<xsl:template match="block[@blocktype='stats']">
	<xsl:variable name="idname" select="./@idname" />
	<xsl:variable name="sectionstyle" select="./@headertype" />
	<section id="{$idname}" class="${sectionstyle}">
	[other stuff here...]
	</section>
</xsl:template>

<!-- Generate image -->
<xsl:template match="image">
	<!-- Store the value of the image tag itself -->
	<xsl:variable name="link" select="." />
	<!-- And use it as the link -->
	<img src="${link}" />
</xsl:template>

</xsl:stylesheet>