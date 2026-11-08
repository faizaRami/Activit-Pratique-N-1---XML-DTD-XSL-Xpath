<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        
        <svg xmlns="http://www.w3.org/2000/svg"
            width="900"
            height="450"
            viewBox="0 0 900 450">
            
            <text x="300" y="30"
                font-size="22"
                fill="black">
                Histogramme des températures
            </text>
            
            <!-- Axe horizontal -->
            <line x1="40" y1="350"
                x2="850" y2="350"
                stroke="black"/>
            
            <!-- Parcours des villes du premier jour -->
            <xsl:for-each select="meteo/mesure[1]/ville">
                
                <xsl:variable name="nom" select="@nom"/>
                
                <xsl:variable name="t1"
                    select="number(@temperature)"/>
                
                <xsl:variable name="t2"
                    select="number(/meteo/mesure[2]/ville[@nom=$nom]/@temperature)"/>
                
                <xsl:variable name="x"
                    select="position() * 95"/>
                
                <!-- Barre de température -->
                <rect x="{$x}"
                    y="{350 - ($t1 * 8)}"
                    width="45"
                    height="{$t1 * 8}"
                    fill="steelblue">
                    
                    <!-- Animation de la hauteur -->
                    <animate attributeName="height"
                        from="{$t1 * 8}"
                        to="{$t2 * 8}"
                        dur="2s"
                        repeatCount="indefinite"
                        direction="alternate"/>
                    
                    <!-- Animation de la position -->
                    <animate attributeName="y"
                        from="{350 - ($t1 * 8)}"
                        to="{350 - ($t2 * 8)}"
                        dur="2s"
                        repeatCount="indefinite"
                        direction="alternate"/>
                    
                </rect>
                
                <!-- Nom de la ville -->
                <text x="{$x}"
                    y="370"
                    font-size="11">
                    <xsl:value-of select="$nom"/>
                </text>
                
                <!-- Valeur de la température -->
                <text x="{$x}"
                    y="{340 - ($t1 * 8)}"
                    font-size="12">
                    
                    <xsl:value-of select="$t1"/>
                    
                    <animate attributeName="y"
                        from="{340 - ($t1 * 8)}"
                        to="{340 - ($t2 * 8)}"
                        dur="2s"
                        repeatCount="indefinite"
                        direction="alternate"/>
                    
                </text>
                
            </xsl:for-each>
            
        </svg>
        
    </xsl:template>
    
</xsl:stylesheet>