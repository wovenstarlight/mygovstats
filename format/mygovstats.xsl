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
			<xsl:apply-templates select="statistics/block[@blocktype='general']"/>
		</section>

		<p>Last updated on <xsl:value-of select="statistics/updatedOn" /></p>
    </main>
	</body>
	</html>
</xsl:template>

<!-- SECTION: General. genBlocks get styled individually -->
<xsl:template match="note">
	<p><xsl:value-of select="."/></p>
</xsl:template>

<xsl:template match="block[@idname='apis']">
	<div id="apis">
		<table>
			<xsl:for-each select="field">
				<tr>
					<td><xsl:value-of select="label"/></td>
					<td><xsl:value-of select="content"/></td>
				</tr>
			</xsl:for-each>
		</table>
		<xsl:apply-templates select="note"/>
	</div>
</xsl:template>

<xsl:template match="block[@idname='members']">
	<div id="members">
		<p><xsl:value-of select="field/label"/></p>
		<p><xsl:value-of select="field/content"/></p>
	</div>
</xsl:template>

<xsl:template match="block[@idname='sso']">
	<div id="sso">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="block[@idname='apps']">
	<div id="apps">
		<p><xsl:value-of select="field/label"/></p>
		<ul>
			<xsl:for-each select="field/content">
				<li><xsl:value-of select="."/></li>
			</xsl:for-each>
		</ul>
	</div>
</xsl:template>

<!-- General statsblock content here -->
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