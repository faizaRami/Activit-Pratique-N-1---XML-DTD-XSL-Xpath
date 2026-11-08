<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <xsl:for-each select="operateur/client">
                    <h3>
                        Nom Client : <xsl:value-of select="@nom"/>
                    </h3>
                    <table border="1" width="80%">
                        <tr>
                            <th>Num</th><th>Type</th><th>Date</th><th>Total Factures</th>
                        </tr>
                        <xsl:for-each select="abonnement">
                            <tr>
                                <td><xsl:value-of select="@num"/></td>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@dateAb"/></td>
                                <td><xsl:value-of select="sum(facture/@montant)"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>