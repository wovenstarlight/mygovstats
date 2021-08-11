<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<body>
    <header>
		<h1>MyGov Ecosystem and Its Open APIs</h1>
    </header>

    <main>
		<section class="general">
			<xsl:apply-templates select="statistics/block[@blocktype='general']" />
		</section>

		<p>Last updated on <xsl:value-of select="statistics/updatedOn" /></p>
    </main>
	</body>
	</html>
</xsl:template>

<!-- SECTION: General -->
<xsl:template match="block[@blocktype='general']">
	<xsl:variable name="idname" select="./@idname" />
	<div id="{$idname}">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="note">
	<p><xsl:value-of select="." /></p>
</xsl:template>

<xsl:template match="field">
	<p><xsl:value-of select="label" /></p>
	<ul>
		<xsl:for-each select="content">
			<li><xsl:value-of select="." /></li>
		</xsl:for-each>
	</ul>
</xsl:template>

<!-- General statsblock content here -->
<xsl:template match="block[@blocktype='stats']">
	<xsl:variable name="idname" select="./@idname" />
	<xsl:variable name="sectionstyle" select="./@headertype" />
	<section id="{$idname}" class="{$sectionstyle}">
	[other stuff here...]
	</section>
</xsl:template>

<!-- Generate image -->
<xsl:template match="image">
	<!-- Store the value of the image tag itself -->
	<xsl:variable name="link" select="." />
	<!-- And use it as the link -->
	<img src="{$link}" />
</xsl:template>

</xsl:stylesheet>