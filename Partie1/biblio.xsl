<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Bibliothèque</title>
            </head>
            
            <body>
                <h1>Gestion de la bibliothèque</h1>
                
                <table border="1">
                    
                    <tr>
                        <th>Code</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Age</th>
                        <th>ID Livre</th>
                        <th>Titre</th>
                        <th>Date Emprunt</th>
                        <th>Rendu</th>
                    </tr>
                    
                    <xsl:for-each select="biblio/etudiant">
                        
                        <xsl:variable name="code" select="@code"/>
                        <xsl:variable name="nom" select="@nom"/>
                        <xsl:variable name="prenom" select="@prenom"/>
                        <xsl:variable name="age" select="@age"/>
                        
                        <xsl:for-each select="livre">
                            
                            <tr>
                                <td><xsl:value-of select="$code"/></td>
                                <td><xsl:value-of select="$nom"/></td>
                                <td><xsl:value-of select="$prenom"/></td>
                                <td><xsl:value-of select="$age"/></td>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="@titre"/></td>
                                <td><xsl:value-of select="@dateEmprunt"/></td>
                                <td><xsl:value-of select="@rendu"/></td>
                            </tr>
                            
                        </xsl:for-each>
                        
                    </xsl:for-each>
                    
                </table>
                
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>
