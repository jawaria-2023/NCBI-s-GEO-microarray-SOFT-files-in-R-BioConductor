____________Installing GEOquery___________

Loading a GDS file with GEOquery
library(Biobase)
library(GEOquery)

#Download GDS file, put it in the current directory, and load it:
gds858 <- getGEO('GDS858', destdir=".")

#Or, open an existing GDS file (even if its compressed):
gds858 <- getGEO(filename='GDS858.soft.gz')
> Meta(gds858)$channel_count
> Meta(gds858)$description
> Meta(gds858)$feature_count
> Meta(gds858)$platform
> Meta(gds858)$sample_count
> Meta(gds858)$sample_organism
> Meta(gds858)$sample_type
> Meta(gds858)$title
> Meta(gds858)$type


Useful stuff, and now the expression data table:
> colnames(Table(gds858))
> Table(gds858)[1:10,1:6]


#Now, lets turn this GDS object into an expression set object (using base 2 logarithms) and have a look at it:

> eset <- GDS2eSet(gds858, do.log2=TRUE)
> eset
> print(eset)
> sampleNames(eset)

GEOquery does an excellent job of extracting the phenotype data, as you can see:
  
> pData(eset)$infection
> pData(eset)$"genotype/variation"

As with any expression set object, its easy to pull out a subset of the data:
  
> eset["1320_at","GSM14504"]

> exprs(eset["1320_at","GSM14504"])

Loading a GPL (Annotation) file with GEOquery
>  Meta(gds858)$platform
library(Biobase)
library(GEOquery)

#Download GPL file, put it in the current directory, and load it:
gpl96 <- getGEO('GPL96', destdir=".")

#Or, open an existing GPL file:
gpl96 <- getGEO(filename='GPL96.soft')

As with the GDS object, we can use the Meta and Table functions to extract information:
> Meta(gpl96)$title
> colnames(Table(gpl96))

Lets look at the first four columns, for the first ten genes:
  > Table(gpl96)[1:10,1:4]

__________Using the BioConductor hgu133a package___________

First of all, we need to install the package:
  
  > source("http://www.bioconductor.org/biocLite.R")
> biocLite("hgu133a")

Running bioCLite version 0.1  with R version  2.1.1 
...
Then we can load the newly installed library:
  
  > library(hgu133a)
There is any easy way to check when this was lasted updated, and what it can translate the Affy probe names into:
  
  > hgu133a()

And now lets test some of those mappings on the fourth gene 121_at in the GPL file:
  
  > Table(gpl96)[4,c("ID","GB_LIST","Gene.Title","Gene.Symbol","Entrez.Gene")]

Now, what does the annotation file have to say?
  
> mget("121_at",hgu133aACCNUM)
> mget("121_at",hgu133aGENENAME)
> mget("121_at",hgu133aSYMBOL)
> mget("121_at",hgu133aUNIGENE)






  
  





  
  

  



