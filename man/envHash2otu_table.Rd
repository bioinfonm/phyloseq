\name{envHash2otu_table}
\alias{envHash2otu_table}
\title{Convert a sequence-sample hash (like ENV file) into an OTU table.}
\usage{
  envHash2otu_table(tipSampleTable)
}
\arguments{
  \item{tipSampleTable}{(Required). A two-column character
  table (matrix or data.frame), where each row specifies
  the sequence name and source sample, consistent with the
  env-file for the UniFrac server
  (\url{http://bmf2.colorado.edu/unifrac/}).}
}
\value{
  \code{\link{otu_table}}. A trivial OTU table where each
  sequence is treated as a separate OTU.
}
\description{
  Parses an ENV-file into a sparse matrix of
  species-by-sample, where each species-row has only one
  non-zero value. We call this sparse abundance table the
  trivial OTU table, where every sequence is treated as a
  separate species. If a phylogenetic tree is available, it
  can be submitted with this table as arguments to
  \code{\link{tip_glom}} to create an object with a
  non-trivial \code{otu_table}.
}
\examples{
#
## fakeSeqNameVec <- paste("seq_", 1:8, sep="")
## fakeSamNameVec <- c(rep("A", 4), rep("B", 4))
## fakeSeqAbunVec <- sample(1:50, 8, TRUE)
## test    <- cbind(fakeSeqNameVec, fakeSamNameVec, fakeSeqAbunVec)
## testotu <- envHash2otu_table( test )
## test    <- cbind(fakeSeqNameVec, fakeSamNameVec)
## testotu <- envHash2otu_table( test )
}
\references{
  \url{http://bmf2.colorado.edu/unifrac/}
}
\seealso{
  \code{\link{import_env_file}}

  \code{\link{tip_glom}}

  \code{\link{otu_table}}
}
\keyword{internal}

