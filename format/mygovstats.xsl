<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<head>
		<link rel="stylesheet" href="format/reset.css"/>
		<link rel="stylesheet" href="format/mygovstats.css"/>
	</head>
	
	<body>
		<header>
			<h1>MyGov Ecosystem and Its Open APIs</h1>
		</header>

		<main>
			<section class="general">
				<xsl:apply-templates select="statistics/block[@blocktype='general']" />
			</section>

			<div class="stats">
				<xsl:apply-templates select="statistics/block[@blocktype='stats']" />
			</div>

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

<!-- SECTION: Statistics -->
<!-- Solid-header statBlock formatting -->
<xsl:template match="block[@headertype='solid']">
	<xsl:variable name="idname" select="./@idname" />
	<section id="{$idname}" class="solid">
		<!-- Header -->
		<h2><xsl:value-of select="header" /></h2>

		<!-- Items: print image with label (and optional small label) -->
		<ul>
		<xsl:for-each select="item">
			<li>
				<xsl:apply-templates select="image" />
				<p>
					<xsl:value-of select="label" />
					<xsl:apply-templates select="labelSmall" />
				</p>
			</li>
		</xsl:for-each>
		</ul>
	</section>
</xsl:template>

<!-- Bar-header statBlock formatting -->
<xsl:template match="block[@headertype='bar']">
	<xsl:variable name="idname" select="./@idname" />
	<section id="{$idname}" class="bar">
		<!-- Header -->
		<h2><xsl:value-of select="header" /></h2>

		<!-- Items: print image with label, stats (and optional units) -->
		<ul>
		<xsl:for-each select="item">
			<li>
				<xsl:apply-templates select="image" />
				<p>
					<xsl:value-of select="label" />
					<xsl:apply-templates select="number" />
					<xsl:value-of select="units" />
				</p>
			</li>
		</xsl:for-each>
		</ul>
	</section>
</xsl:template>

<!-- Generate image -->
<xsl:template match="image">
	<!-- Store the value of the image tag itself -->
	<xsl:variable name="link" select="." />
	<!-- And use it as the link -->
	<img src="{$link}" />
</xsl:template>

<!-- Smaller text for statBlock.solid labels -->
<xsl:template match="labelSmall">
	<br /><small><xsl:value-of select="." /></small>
</xsl:template>

<!-- Print actual numbers for statBlock.bar statistics -->
<xsl:template match="number">
	<strong><xsl:value-of select="." /></strong>
</xsl:template>

</xsl:stylesheet>