\name{merge_phyloseq}
\alias{merge_phyloseq}
\title{Merge arguments into one phyloseq object.}
\usage{
  merge_phyloseq(...)
}
\arguments{
  \item{...}{a comma-separated list of phyloseq objects.}
}
\value{
  Merges are performed by first separating higher-order
  objects into a list of their component objects; then,
  merging any component objects of the same class into one
  object according to the behavior desribed in
  \code{\link{merge_phyloseq_pair}}; and finally,
  re-building a merged-object according to the constructor
  behavior of the \code{\link{phyloseq}} method. If the
  arguments contain only a single component type -- several
  otu_table objects, for example -- then a single merged
  object of the relevant component type is returned.

  Merges between 2 or more tree objects are ultimately done
  using \code{\link[ape]{consensus}} from the ape package.
  This has the potential to limit somewhat the final data
  object, because trees don't merge with other trees in the
  same granular manner as data tables, and ultimately the
  species/taxa in higher-order phyloseq objects will be
  clipped to what is contained in the tree. If this an
  issue, the tree component should be ommitted from the
  argument list.
}
\description{
  Takes a comma-separated list of phyloseq objects as
  arguments, and returns the most-comprehensive single
  phyloseq object possible.
}
\details{
  Higher-order objects can be created if arguments are
  appropriate component data types of different classes,
  and this should mirror the behavior of the
  \code{\link{phyloseq}} method, which is the suggested
  method if the goal is simply to create a higher-order
  phyloseq object from different data types (1 of each
  class) describing the same experiment.

  By contrast, this method is intended for situations in
  which one wants to combine multiple higher-order objects,
  or multiple core component data objects (e.g. more than
  one \code{otu_table}) that should be combined into one
  object.

  Merges are performed by first separating higher-order
  objects into a list of their component objects; then,
  merging any component objects of the same class into one
  object according to the behavior desribed in
  \code{\link{merge_phyloseq_pair}}; and finally, building
  back up a merged-object according to the constructor
  behavior of the \code{\link{phyloseq}} method. If the
  arguments contain only a single component type -- several
  otu_table objects, for example -- then a single merged
  object of that component type is returned.
}
\examples{
#
## # Make a random complex object
## OTU1 <- otu_table(matrix(sample(0:5,250,TRUE),25,10), taxa_are_rows=TRUE)
## tax1 <- tax_table(matrix("abc", 30, 8))
## map1 <- data.frame( matrix(sample(0:3,250,TRUE),25,10),
##   matrix(sample(c("a","b","c"),150,TRUE), 25, 6) )
## map1 <- sample_data(map1)
## exam1 <- phyloseq(OTU1, map1, tax1)
## x <- exam1
## x <- phyloseq(exam1)
## y <- tax_table(exam1)
## merge_phyloseq(x, y)
## merge_phyloseq(y, y, y, y)
}

