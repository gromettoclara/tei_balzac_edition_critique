<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="html" indent="yes"/>
    
    
    <!-- déclaration des variables -->
    <!-- chemins des fichiers de sortie -->
    
    <xsl:variable name="home">
        <xsl:value-of select="concat('balzac_home','.html')"/>
        <!-- variable pour la page d'accueil  -->
    </xsl:variable>
    <xsl:variable name="mercier">
        <xsl:value-of select="concat('petit_mercier','.html')"/>
        <!-- variable pour l'extrait sur le petit Mercier  -->
    </xsl:variable>
    <xsl:variable name="debauche">
        <xsl:value-of select="concat('debauche','.html')"/>
        <!-- variable pour l'extrait de la Peau de Chagrin  -->
    </xsl:variable>
    <xsl:variable name="consultation">
        <xsl:value-of select="concat('consultation','.html')"/>
        <!-- variable pour la consultation  -->
    </xsl:variable>
    <xsl:variable name="index">
        <xsl:value-of select="concat('index','.html')"/>
        <!-- variable pour l'index  -->
    </xsl:variable>
    
    <!-- contenu du head -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="//titleStmt/title[@type='main']"/> / <xsl:value-of select="//titleStmt/title[@type='sub'][1]"/> <xsl:text> par </xsl:text><xsl:value-of select="//titleStmt/author"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title[@type='sub'][2]"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/principal"/>
                </xsl:attribute>
            </meta>
            <link type="text/css" rel="stylesheet" href="./balzac_css.css"/>
            <script type="text/javascript" src="./balzac_js.js"/>
        </head>
    </xsl:variable>
    
    <!-- contenu du footer -->
    <xsl:variable name="footer">
        <footer>
            <p>Sélection, alignement et édition : <br/>
            <xsl:value-of select="//titleStmt/respStmt[1]/persName"/><br/>
            Établissement du texe du <i>Furne Corrigé</i> :<br/>
                <xsl:value-of select="//titleStmt/respStmt[2]/orgName"/> : <xsl:value-of select="//titleStmt/respStmt[2]/note"/><br/>
            Sous licence CC BY-NC-ND 3.0 FR DEED Attribution</p>
        </footer>
    </xsl:variable>
    

    <!-- liens vers l'accueil et vers l'index -->
    <xsl:variable name="return_home">
        <a class="nav-btn" href="{concat('./', $home)}">Revenir à l'accueil</a>
    </xsl:variable>
    
    <xsl:variable name="return_index">
        <a class="nav-btn" href="{concat('./', $index)}">Index</a>
    </xsl:variable>
    
    <!-- bandeau / header des pages -->
    <xsl:variable name="body_header">
            <h1><i><xsl:value-of select="//titleStmt/title[@type='main']"/></i></h1>
            <p><xsl:value-of select="//titleStmt/author"/></p>
            <h2><xsl:value-of select="//titleStmt/title[2]"/></h2>
            <h2><xsl:value-of select="//titleStmt/title[3]"/></h2>
    </xsl:variable>
    
    <!-- fin des déclarations des variables -->
    
    
    
    <!-- template qui matche la racine avec call-template des pages générées-->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="petit_mercier"/>
        <xsl:call-template name="debauche"/>
        <xsl:call-template name="consultation"/>
        <xsl:call-template name="index"/>
    </xsl:template>
    
    <!-- PAGE HOME -->
    <!-- on a le header / bandeau dans une div avec une classe spéciale pour gérer le style dans le css, on a une div avec la présentation du projet, le bloc nav avec le menu, et enfin le footer. Le tout dans une flexbox gérée dans le css. -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:element name="div">
                        <xsl:attribute name="class">home</xsl:attribute>
                        <xsl:copy-of select="$body_header"/>
                    </xsl:element>
                    <div style="padding: 40px 50px 40px 50px">  
                        <p><b>Résumé : </b><xsl:value-of select="//abstract"/></p>
                    </div>
                    <nav>
                        <a class="nav-btn" href="./{$mercier}">Le Petit Mercier</a> 
                        <a class="nav-btn" href="./{$debauche}">Une débauche</a>
                        <a class="nav-btn" href="./{$consultation}">La Consultation.</a>
                        <xsl:copy-of select="$return_index"/>
                    </nav>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE DU PETIT MERCIER -->
    <!-- structure générale : header / une box mère qui contient deux box filles pour les deux versions en parallèle / biblio des témoins en parallèle / menu et footer -->
    <xsl:template name="petit_mercier">
        <xsl:result-document href="{$mercier}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <div class="bandeau">
                        <xsl:copy-of select="$body_header"/>
                    </div>
                    
                    <div class="main-container">
                        <div class="text-container" id="text1">
                        <h3>
                            <i><xsl:value-of select="//witness[@xml:id ='C']//title[@level='a']"/></i>
                            <xsl:text> issu de </xsl:text>
                            <i><xsl:value-of select="//witness[@xml:id ='C']//title[@level='j']"/></i>
                            <xsl:text> du </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='C']//date"/>
                            <xsl:text> pages </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='C']//biblScope"/>
                        </h3>
                        <xsl:apply-templates mode="rdg" select="//text/body/ab[1]"/>
                    </div>
                    
                        <div class="text-container" id="text2">
                        <h3>
                            <i><xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[1]//title[@type='main']"/></i>,
                            (<xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[1]//title[@level='m']"/>), 
                            <xsl:text>Furne, </xsl:text><i><xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[1]//title[@level='a']"/></i>, 
                            <xsl:text> pages </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[1]//biblScope"/>
                        </h3> 
                        
                        <xsl:apply-templates select="//text/body/ab[1]"/>
                        </div>
                    </div>
         
                    
                    <nav>
                        <a class="nav-btn" href="./{$debauche}">Une Débauche</a>
                        <a class="nav-btn" href="./{$consultation}">La Consultation</a>
                        <xsl:copy-of select="$return_home"/>
                        <xsl:copy-of select="$return_index"/>
                    </nav>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- règles pour ramener le texte -->
    <!-- 1. le texte du lemme -->
    <!-- ramener le texte qui n'est pas dans les app -->
    
    <xsl:template match="//text/body/ab[1]">
            <xsl:apply-templates/>
    </xsl:template>
    
    <!-- ramener le texte qui est dans les éléments app -->
    <!-- si app a un enfant lem, va chercher les règles qui s'appliquent aux descendants. Sinon une span vide est créée. Cette span a un attribut var (pour le JS) -->
    
    <xsl:template match="//text/body/ab[1]/app">
        <xsl:choose>
            <xsl:when test="./child::lem">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span"><xsl:attribute name="class">var</xsl:attribute></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <!-- le titre ne concerne que la publication en revue, on l'enlève pour Furne, d'où la règle vide -->
    <xsl:template match="//ab[1]/title">
    </xsl:template>
    
    <!-- ramener le texte du lem dans une balise span, toujours avec cet attribut var pour le JS -->
    <xsl:template match="//ab[1]/app/lem">
        <span class="var"><xsl:apply-templates/></span>
    </xsl:template>
    
    <!-- ne pas ramener le texte des autres témoins, d'où la règle vide -->
    <xsl:template match="//ab[1]/app/rdg">
    </xsl:template>
    
    <!-- 2. mode rdg : le texte du lem -->
    <!-- ramener le texte qui n'est pas dans les app -->
    <xsl:template match="//text/body/ab[1]" mode="rdg">
        <xsl:apply-templates mode="rdg"/>
    </xsl:template>
    
    <!-- ramener le texte qui est dans les éléments app -->
    <!-- si app a un enfant rdg, va chercher les règles qui s'appliquent aux descendants. Sinon une span vide est créée. Cette span a un attribut var (pour le JS) -->
    <xsl:template match="//text/body/ab[1]/app" mode="rdg">
        <xsl:choose>
            <xsl:when test="./child::rdg">
                <xsl:apply-templates mode="rdg"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span"><xsl:attribute name="class">var</xsl:attribute></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- la chronique journalistique a un titre, on peut ramener celui-ci -->
    <xsl:template match="//ab[1]/title" mode="rdg">
        <xsl:element name="h4">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- ramener le texte du témoin (mais en pouvant appliquer des règles sur les noeuds enfants) dans une balise span de class var -->
    <xsl:template match="//ab[1]/app/rdg" mode="rdg">
        <span class="var"><xsl:apply-templates mode="rdg"/></span>
    </xsl:template>
    
    <!-- ne pas ramener le texte du lemme-->
    <xsl:template match="//ab[1]/app/lem" mode="rdg">
    </xsl:template>
    
    <!-- On se retrouve donc avec deux blocs de texte : le texte du lemme et le texte du témoin accouplé. Les passages de texte alignés sont placés dans des balises span de classe "var" de même index -->


    <!-- TEMPLATES DE LA PAGE DE UNE DEBAUCHE -->
    <!-- même fonctionnement que pour le premier extrait -->
    <xsl:template name="debauche">
        <xsl:result-document href="{$debauche}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <div class="bandeau">
                        <xsl:copy-of select="$body_header"/>
                    </div>
                    
                   
                    <div class="main-container">
                        <div class="text-container" id="text1">
                        <h3>
                            <i><xsl:value-of select="//witness[@xml:id ='R2M']//title[@level='a']"/></i>
                            <xsl:text> issu de </xsl:text>
                            <i><xsl:value-of select="//witness[@xml:id ='R2M']//title[@level='j']"/></i>
                            <xsl:text> de </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='R2M']//date"/>, 
                            <xsl:value-of select="//witness[@xml:id ='R2M']//biblScope[@unit='vol']"/><xsl:text>, pages </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='R2M']//biblScope[@unit='page']"/>
                        </h3>
                        <xsl:apply-templates mode="rdg" select="//text/body/ab[2]"/>
                    </div>
                    
                    <div class="text-container" id="text2">
                        <h3>
                            <i><xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[2]//title[@type='main']"/></i>,
                            (<xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[2]//title[@level='m']"/>), 
                            <xsl:text>Furne, </xsl:text><i><xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[2]//title[@level='a']"/></i>, 
                            <xsl:text> pages </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[2]//biblScope"/>
                        </h3> 
                    
                        <xsl:apply-templates select="//text/body/ab[2]"/>
                    </div>
                    </div>
                    
                    <nav>
                        <a class="nav-btn" href="./{$mercier}">Le Petit Mercier</a>
                        <a class="nav-btn" href="./{$consultation}">La Consultation</a>
                        <xsl:copy-of select="$return_home"/> 
                        <xsl:copy-of select="$return_index"/>
                    </nav>
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template match="//text/body/ab[2]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//text/body/ab[2]/app">
        <xsl:choose>
            <xsl:when test="./child::lem">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span"><xsl:attribute name="class">var</xsl:attribute></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="//ab[2]/title">
    </xsl:template>
    
    <xsl:template match="//ab[2]/app/lem">
        <span class="var"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//ab[2]/app/rdg">
    </xsl:template>
    
    <xsl:template match="//text/body/ab[2]" mode="rdg">
        <xsl:apply-templates mode="rdg"/>
    </xsl:template>
    
    
    <xsl:template match="//text/body/ab[2]/app" mode="rdg">
        <xsl:choose>
            <xsl:when test="./child::rdg">
                <xsl:apply-templates mode="rdg"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span"><xsl:attribute name="class">var</xsl:attribute></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
  
    </xsl:template>
    
    <xsl:template match="//ab[2]/title" mode="rdg">
        <xsl:element name="h4">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//ab[2]/app/rdg" mode="rdg">
        <span class="var"><xsl:apply-templates mode="rdg"/></span>
    </xsl:template>
    
    <xsl:template match="//ab[2]/app/lem" mode="rdg">
    </xsl:template>
    
    
    <!-- TEMPLATES DE LA PAGE DE LA CONSULTATION -->
    <!-- même fonctionnement -->
    <xsl:template name="consultation">
        <xsl:result-document href="{$consultation}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <div class="bandeau">
                        <xsl:copy-of select="$body_header"/>
                    </div>
                    
                    <div class="main-container">
                        <div class="text-container" id="text1">
                        <h3>
                            <i><xsl:value-of select="//witness[@xml:id ='C2']//title[@level='a']"/></i>
                            <xsl:text> issu de </xsl:text>
                            <i><xsl:value-of select="//witness[@xml:id ='C2']//title[@level='j']"/></i>
                            <xsl:text> du </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='C2']//date"/>, <xsl:text> pages </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='C2']//biblScope[@unit='page']"/>
                        </h3>
                        <xsl:apply-templates mode="rdg" select="//text/body/ab[3]"/>
                    </div>
                    
                    <div class="text-container" id="text2">
                        <h3>
                            <i><xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[3]//title[@level='m']"/></i>,
                            <xsl:text>Chlendowski </xsl:text>, <xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[3]//date"/>
                            <xsl:text> pages </xsl:text>
                            <xsl:value-of select="//witness[@xml:id ='F']/biblFull/sourceDesc/bibl[3]//biblScope"/>
                        </h3> 
                        
                        <xsl:apply-templates select="//text/body/ab[3]"/>
                    </div>
                    </div>
                    
                    
                    <nav>
                        <a class="nav-btn" href="./{$mercier}">Le Petit Mercier</a>
                        <a class="nav-btn" href="./{$debauche}">Une Débauche</a>
                        <xsl:copy-of select="$return_home"/>
                        <xsl:copy-of select="$return_index"/>
                    </nav>
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template match="//text/body/ab[3]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//text/body/ab[3]/app">
        <xsl:choose>
            <xsl:when test="./child::lem">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span"><xsl:attribute name="class">var</xsl:attribute></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="//ab[3]/title">
    </xsl:template>
    
    <xsl:template match="//ab[3]/app/lem">
        <span class="var"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//ab[3]/app/rdg">
    </xsl:template>
    
    
    
    <xsl:template match="//text/body/ab[3]" mode="rdg">
        <xsl:apply-templates mode="rdg"/>
    </xsl:template>
    
    
    
    <xsl:template match="//text/body/ab[3]/app" mode="rdg">
        <xsl:choose>
            <xsl:when test="./child::rdg">
                <xsl:apply-templates mode="rdg"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span"><xsl:attribute name="class">var</xsl:attribute></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="//ab[3]/title" mode="rdg">
        <xsl:element name="h4">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//ab[3]/app/rdg" mode="rdg">
        <span class="var"><xsl:apply-templates mode="rdg"/></span>
    </xsl:template>
    
    <xsl:template match="//ab[3]/app/lem" mode="rdg">
    </xsl:template>
    
    <!-- template de la page index -->
    <xsl:template name="index">
        <xsl:result-document href="{$index}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <div class="bandeau"><xsl:copy-of select="$body_header"/></div>
                    <div class="main-container">
                        <xsl:for-each-group select="//body//app" group-by="tokenize(@corresp, ' ')">
                            <xsl:if test="current-grouping-key()='#orth' or current-grouping-key()='#place-diff' or current-grouping-key()='#persname-diff'">
                                <div class="text-container">
                                    <xsl:choose>
                                        <xsl:when test="current-grouping-key()='#orth'">
                                            <h3>Index des variantes orthographiques</h3>
                                        </xsl:when>
                                        <xsl:when test="current-grouping-key()='#place-diff'">
                                            <h3>Index des changements toponymiques</h3>
                                        </xsl:when>
                                        <xsl:when test="current-grouping-key()='#persname-diff'">
                                            <h3>Index des variantes de dénomination individuelles</h3>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:for-each-group select="current-group()" group-by=".">
                                        <p> <i><xsl:value-of select="./rdg"/></i> // <i><xsl:value-of select="./lem"/></i> : 
                                            <a>
                                                <xsl:attribute name="href">
                                                    <xsl:choose>
                                                        <xsl:when test="ancestor::ab/@n = 'I'">
                                                            <xsl:text>./</xsl:text><xsl:value-of select="$mercier"/>
                                                        </xsl:when>
                                                        <xsl:when test="ancestor::ab/@n = 'II'">
                                                            <xsl:text>./</xsl:text><xsl:value-of select="$debauche"/>
                                                        </xsl:when>
                                                        <xsl:when test="ancestor::ab/@n = 'III'">
                                                            <xsl:text>./</xsl:text><xsl:value-of select="$consultation"/>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:value-of select="ancestor::ab/@n"/>
                                            </a>
                                            <xsl:if test="position()!= last()">, 
                                            </xsl:if><xsl:if test="position() = last()">.</xsl:if>
                                        </p>
                                    </xsl:for-each-group>
                                </div>
                            </xsl:if>
                            
                        </xsl:for-each-group></div>
                    <nav>
                        <xsl:copy-of select="$return_home"/> 
                        <a class="nav-btn" href="./{$mercier}">Le Petit Mercier</a>
                        <a class="nav-btn" href="./{$consultation}">La Consultation</a>
                        <a class="nav-btn" href="./{$debauche}">Une débauche</a>
                    </nav>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Règles concernant les enfants directs de ab (qui ne sont pas app), ou les enfants de lem et rdg -->
    
    <!-- les retours à la ligne, les italiques, et les petites capitales hors de app -->
    <xsl:template match="//text/body/ab/lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="//text/body/ab/hi[@rend='i']">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
    
    <xsl:template match="//text/body/ab//hi[@rend='sc']">
        <xsl:element name="span">
            <xsl:attribute name="style">font-variant: small-caps;</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- les retours à la ligne, les italiques, et les petites capitales dans lem -->
    <xsl:template match="//ab/app/lem/lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="//ab/app/lem/hi[@rend='i']">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
    
    <xsl:template match="//ab/app/lem/hi[@rend='sc']">
        <xsl:element name="span">
            <xsl:attribute name="style">font-variant: small-caps;</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- les retours à la ligne, les italiques, et les petites capitales hors de app (et mode rdg pour que les apply-templates qui retranscrivent le texte du témoin soient activés) -->
    <xsl:template match="//text/body/ab/lb" mode="rdg">
        <br/>
    </xsl:template>
    
    <xsl:template match="//text/body/ab/hi[@rend='i']" mode="rdg">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
    
    <xsl:template match="//text/body/ab/hi[@rend='sc']" mode="rdg">
        <xsl:element name="span">
            <xsl:attribute name="style">font-variant: small-caps;</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- les retours à la ligne, les italiques, et les petites capitales dans rdg (et mode rdg pour les ramener au bon endroit, soit le deuxième bloc de texte) -->
    <xsl:template match="//ab/app/rdg/lb" mode="rdg">
        <br/>
    </xsl:template>
    
    <xsl:template match="//ab/app/rdg/hi[@rend='i']" mode="rdg">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
    
    <xsl:template match="//ab/app/rdg//hi[@rend='sc']" mode="rdg">
        <xsl:element name="span">
            <xsl:attribute name="style">font-variant: small-caps;</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- règles sur les persName -->
    <!-- règles sur les persName hors de app -->
    <!-- je récupère l'xml:id du personnage dans une variable. Je vais chercher la description de ce personnage ou cette personne dans le particDesc, s'il y a bien une description.
    le persName est ramené avec une span contenant sa description. Grâce à du css, cette description ne s'affichera au survol.-->
   <xsl:template match="//ab/persName">
       <xsl:param name="id">
           <xsl:value-of select="substring-after(./@ref, '#')"/>
       </xsl:param>
       <xsl:choose>
           <xsl:when test="//particDesc/listPerson/person[@xml:id=$id]/note">
               <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//particDesc/listPerson/person[@xml:id=$id]/note"/></span></b>
           </xsl:when>
           <xsl:otherwise>
               <xsl:value-of select="."/>
           </xsl:otherwise>
       </xsl:choose>
   </xsl:template>
    
    <!-- règles sur les persNale dans le lem -->
    <xsl:template match="//ab/app/lem/persName">
        <xsl:param name="id">
            <xsl:value-of select="substring-after(./@ref, '#')"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="//particDesc/listPerson/person[@xml:id=$id]/note">
                <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//particDesc/listPerson/person[@xml:id=$id]/note"/></span></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- règle sur les persName hors de app (mode rdg pour qu'elle s'appliquent uniquement au texte du témoin -->
    <xsl:template match="//ab/app/rdg/persName" mode="rdg">
        <xsl:param name="id">
            <xsl:value-of select="substring-after(./@ref, '#')"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="//particDesc/listPerson/person[@xml:id=$id]/note">
                <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//particDesc/listPerson/person[@xml:id=$id]/note"/></span></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- règle sur les persName dans le rdg (mode rdg pour qu'elle s'appliquent uniquement au texte du témoin -->
    <xsl:template match="//ab/persName" mode="rdg">
        <xsl:param name="id">
            <xsl:value-of select="substring-after(./@ref, '#')"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="//particDesc/listPerson/person[@xml:id=$id]/note">
                <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//particDesc/listPerson/person[@xml:id=$id]/note"/></span></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- règles sur les placeName -->
    <!-- même principe que les persName -->
    <!-- Toujours 4 règles : 2 pour les apply-templates qui concernent le texte du lemme
    2 pour les apply-templates qui concernent le texte des témoins
    à chaque fois il faut aller chercher les persName hors du app et dans le app-->
    <xsl:template match="//ab/placeName">
        <xsl:param name="id">
            <xsl:value-of select="substring-after(./@ref, '#')"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="//settingDesc/listPlace/place[@xml:id=$id]/note">
                <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//settingDesc/listPlace/place[@xml:id=$id]/note"/></span></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//ab/app/lem/placeName">
        <xsl:param name="id">
            <xsl:value-of select="substring-after(./@ref, '#')"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="//settingDesc/listPlace/place[@xml:id=$id]/note">
                <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//settingDesc/listPlace/place[@xml:id=$id]/note"/></span></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//ab/app/rdg/placeName" mode="rdg">
        <xsl:param name="id">
            <xsl:value-of select="substring-after(./@ref, '#')"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="//settingDesc/listPlace/place[@xml:id=$id]/note">
                <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//settingDesc/listPlace/place[@xml:id=$id]/note"/></span></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//ab/placeName" mode="rdg">
        <xsl:param name="id">
            <xsl:value-of select="substring-after(./@ref, '#')"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="//settingDesc/listPlace/place[@xml:id=$id]/note">
                <b class="infobulle"><xsl:value-of select="."/><span class="infobulle-text"><xsl:value-of select="//settingDesc/listPlace/place[@xml:id=$id]/note"/></span></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>