<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <!-- Author: Ulrike Henny-Krahmer -->
    
    <xsl:import href="pub.xsl"/>
    <xsl:output method="xhtml" encoding="UTF-8" indent="no"/>
    
    <xsl:template match="text">
        <div class="text prose">
            <xsl:if test="@corresp">
                <xsl:attribute name="id" select="substring-after(@corresp,'#')"/>
            </xsl:if>
            <style type="text/css">
                .lg {margin: 15px 0;}
                h2.center {text-align: center;}
                div.poem {margin: 20px 0;}
                p.indent {display: inline-block; text-indent: 1em; margin: 0;}
                div.ab-right {text-align: right;}
                div.prose {padding-right: 20px;}
            </style>
            <xsl:apply-templates />
            <xsl:apply-templates select="//note[@type='summary']"/>
        </div>
    </xsl:template>
    
    
    <!-- notes that are comments on quotes, made by the editor -->
    <xsl:template match="quote[note[@type='comment'][@resp]]">
        <span class="quote tooltip">
            <xsl:apply-templates select="child::*[name() != 'note'] | text()"/>
            <span class="tooltiptext"><xsl:apply-templates select="note"/></span>
        </span>
    </xsl:template>
    
    <xsl:template match="note[@type='comment'][@resp]">
        <span class="note editor">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- notes that are part of the text (see the corresponding JavaScript in page/prosa.html) -->
    <xsl:template match="note[not(@type)]">
        <span class="note">
            <span class="label"><xsl:apply-templates select="label"/></span>
            <span class="text"><xsl:apply-templates select="child::*[name() != 'label'] | text()"/></span>
        </span>
    </xsl:template>
    
    <!-- Entities -->
    <xsl:template match="rs[@type = 'name']">
        <span class="name {@key}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="rs[@type = 'place']">
        <span class="place">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="rs[@type = 'periodical']">
        <span class="journal {@key}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="rs[@type = 'work']">
        <span class="work {@key}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="rs[@type = 'title']">
        <span class="title {replace(.,'[“”.\s]','')}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>