---
title       : Textual Analysis 
subtitle    : Using a Latent Regression Model
author      : Valeria Fonseca Díaz / Álvaro Mauricio Montenegro Díaz
job         : Bogotá, Colombia
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
logo        : logo_Unal_.jpg

--- 
## What is this about?
<div class='build'>
<img class="right" src="wordclouds.jpg" height=310px width=450px/>
<img class="left" src="word_networks.gif" height=310px width=480px/>
<h5 align="left"> 
<br>
Where is the analysis of the <code> baseline documents? </code> </h5>
<h5 align="left"> 
<br>
Can we identify <code> potential general topics </code> and support our analysis from the baseline documents? </h5>
</div>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


---
## Overall sketch 

<div class='build'>
<img  src="sketch1.jpg" alt="Words" height=260px width=400px/>
<img   src="sketch2.jpg" alt="Clusters of words" height=260px width=400px/>
<img  class="center" src="sketch3_1.png" alt="Topics" height=260px width=430px/>
</div>



<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


---
## Text Corpus Data
<div class='build'>
<code> In order to present our method, we have chosen the following corpus 
<br>
<br>
</code>
<h5> 800 News articles about deaths in the USA <br> <code> Unit of analysis:</code> Body of the article
<br>
<br>
</h5>
<img class="center" src="headlines1.jpg" height=410px width=650px/>
</div>


<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>



--- &vcenter

## Introduction

> * Here we will present the use of a latent linear model to perform textual analysis. The main purpose is to `discover what topics occur` in a collection of documents
> * The method involves a bayesian estimation of a `multivariate latent linear model` over a document-term matrix
> * Topics will be calculated as vectors by grouping terms according to their estimated parameters
> * Each of the documents will be associated to topics according to how correlated its estimated parameters and each topic vector are

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>



--- &vcenter

<div class="center">
<h1> <font size=300> Language Processing Technique </font> </h1>
</div>


<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


---
## Document-Term Matrix

<div class='build'>
<p> <br> Articles were brought to <code> R </code> via <code> library(XML) </code> </p>
<p> <code> R </code> Package <code> tm </code> provides a complete language processing techique which produces a document-term matrix </p> 
<pre> <code class="r"> Westminster police spokeswoman Cheri Spottke says officers were called
to a Savannah Suites hotel at about 7 p.m. Friday on reports of shots fired
and found two people with gunshot wounds (...).</code></pre>
<img class="center" src="dtm.png" height=140px width=780px/>
  <p> <br> This binary matrix will be refered to as <span style="font-family: Times New Roman; font-size:100%; font-style:italic; "> <b>Y</b> = ( Y<sub>ij</sub> )<sub>N &times K</sub></span> ,   
  <span style="font-family: Times New Roman; font-size:100%; font-style:italic; "> N </span>documents ,
  <span style="font-family: Times New Roman; font-size:100%; font-style:italic; "> K </span>terms
  </p>
</div>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


--- &vcenter

<div class="center">
<h1> <font size=50> Multidimensional 2-Parameter Normal Ogive Model <br><br> - M2PNO - </font> </h1>
</div>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


---
## M2PNO Model
The model here considered is given by

$$ P(Y_{ij}=1 | \boldsymbol{\theta}_i, \boldsymbol{\alpha}_j, \gamma_j)= \boldsymbol{\Phi}(\boldsymbol{\alpha}'_j\boldsymbol{\theta}_i-\gamma_j), \quad i=1,...,N \quad j=1,...,K$$

> * $\boldsymbol{\Phi}(\cdot)$ is the cumulative distribution function of a standard normal random variable
> * $\boldsymbol{\theta}_i$ represents the $i$-th document $\boldsymbol{d}$-dimensional point
> * $\boldsymbol{\alpha}_j$ represents the $j$-th term vector in a $\boldsymbol{d}$-dimesional space

> * The latent characteristic of the model comes from the fact that $\boldsymbol{\theta}_i$ parameter is not observable 
> * <h5> <code> The use of this model to perform textual analysis arises from the interpretation of parameters </code> $\boldsymbol{\theta}$ <code> and  </code> $\boldsymbol{\alpha}$ </h5>
> * The choice of $\boldsymbol{d}$ is based upon Horn's technique from the document-term matrix

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>



--- &twocol

## Bayesian Estimation: Gibbs sampler
<br>
> * Let us define $\eta_{ij}=\boldsymbol{\alpha}'_j\boldsymbol{\theta}_i -\gamma_j$
> *  $P(Y_{ij}=1 | \boldsymbol{\theta}_i, \boldsymbol{\alpha}_j, \gamma_j)= \boldsymbol{\Phi}(\eta_{ij})=1-\boldsymbol{\Phi}(-\eta_{ij})=1-\boldsymbol{\Phi}_{Z}(0)$
> * New variable $\mathbf{Z}$ provides $P(Y_{ij}=1 | \cdot)=P(Z_{ij}>0| \cdot)$
> * Joint posterior distribution <br> $$ p(\boldsymbol{\theta}, \boldsymbol{\alpha}, \gamma, \mathbf{Z}|\mathbf{Y}) \propto f(\mathbf{Y}|\mathbf{Z})p(\mathbf{Z}|\boldsymbol{\theta}, \boldsymbol{\alpha}, \gamma)p(\boldsymbol{\theta})p(\boldsymbol{\alpha},\gamma) $$
> * <h5> <code> Gibbs Sampler: </code> Given the joint posterior distribution, sample from each conditional one at a time </h5>
> * We have derived this procedure in detail for this particular model in conjunction with our <code> R </code> algorithm. <code> (Montenegro, 2010), (Fox, 2010) </code>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


--- &vcenter

<div class="center">
<h1> <font size=50> Interpretation of M2PNO Model <br><br> Calculating topic vectors </font> </h1>
</div>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


--- &twocol
## Grouping terms

*** =left
![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 
*** =right
> * It can be shown that $\frac{\boldsymbol{\alpha}_j}{||\boldsymbol{\alpha}_j||}$ are directions in which $\boldsymbol{\theta}_i$ values are best discriminated `(Reckase, 2009)`
> * When placing $\boldsymbol{\alpha}_j$ vectors in a $\boldsymbol{d}$-dimensional space, such directions seem to be grouping around `few main directions`
> * These vectors are to be clustered via a hierarchical method taking `correlation` as the `disimilarity measure`  
> * <h4> Therefore, what we are doing is to cluster `words` to define some `topics` </h4>



<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


--- &twocol
## Topic vectors
*** =left
> *  A total of $\boldsymbol{m}$ topics have been detected
> * <h5> From each of the terms clusters, <code>first eigenvector </code> $\mathbf{t}_m$ will be the corresponding topic vector </h5>
> * <code> Projection score </code> for documents $$\boldsymbol{\theta'}_i  \mathbf{t}_m$$
> *  <code> Projection score </code> for words  $$\boldsymbol{\alpha'}_j  \mathbf{t}_m$$

*** =right
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 




<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>





--- &vcenter


<div class="center">
<h1> <font size=50> Gun Deaths Corpus Data <br><br> - Results - </font> </h1>
</div>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


--- &vcenter

## Gun Deaths Topics 

<div class='build'>
<img class="center" src="topicstable.jpg" height=520px width=880px/>
</div>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>


--- &vcenter
## Gun Deaths News Articles: Examples 
<div class='build'>
<img class="center" src="results.jpg" height=520px width=880px/>
</div>


<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>



--- &vcenter
## Conclusions and future work

> * `Probit latent model` is a good alternative based on the type of input matrix
> * This method can be conceived as a dimension reduction technique with the particularity that `each unit is to be explained by all of the thematic dimensions`, that is, all of the topics
> * Most analyses are based on terms clustering methods to identify what we have called tendencies of textual data,
but the `analysis over baseline documents` is not actually performed. In many fields of study, diferent evaluations of
speech are needed so that the estimated score of each unit is a first approach to judge textual data
> * As a future work, one of the aspects that can be optimized is to set a rule to choose the `number of dimensions to estimate the M2PNO` or, possibly, another method to detect such a number a priori

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>





--- &vcenter 

## Bibliography

> * `James H. Albert. Bayesian estimation of normal ogive item response curves using gibbs sampling. Journal of Educational Statistics, 17(3):20, 1992`
> * `Jean-Paul Fox. Bayesian item response theory. Springer. 2010`
> * `Alvaro Mauricio Montenegro Díaz. Muldimensional item response theory models where the ability has a latent linear structure. PhD Thesis. 2010`
> * `Mark D. Reckase. Multidimensional item response theory. Springer. 2009`
> * `C.A.W. Glas and A.A. Beguin. MCMC estimation and some model-fit analysis of multidimensional IRT models. Psychometrika. 66(4):21, 2001 `




<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>

--- &vcenter
<div class="center">
<h5> <font size=50> Check out our shiny app! <br><br> </font> </h5>
<h1> <font size=50> - Thank you - </font>  </h1>
</div>

<footer> <font size=3 color='#928E8E'> Textual Analysis Using a Latent Regression Model</font> </footer>
<header>
<img src='logo_header.gif' height=60px width=130px/ style='float:left'/> 
</header>
