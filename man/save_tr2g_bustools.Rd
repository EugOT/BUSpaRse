% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tr2g.R
\name{save_tr2g_bustools}
\alias{save_tr2g_bustools}
\title{Save transcript to gene file for use in \code{bustools}}
\usage{
save_tr2g_bustools(tr2g, file_save = "./tr2g.tsv", ...)
}
\arguments{
\item{tr2g}{The data frame output from the \code{tr2g_*} family of functions.}

\item{file_save}{File name of the file to be saved. The directory in which
the file is to be saved must exist.}

\item{\dots}{Other arguments passed to \code{\link{fwrite}}, such
as \code{sep}, \code{quote}, and \code{col.names}.}
}
\value{
Nothing is returned into the R session. A tsv file of the format
required by \code{bustools} with the name and directory specified will be written
to disk.
}
\description{
This function saves the transcript to gene data frame generated by this package
in whatever means in a format required by \code{bustools}. In order to use
\code{bustools} to generate the gene count or TCC matrix, a file
that maps transcripts to genes is required. This should be a tsv file with 2
columns: the first column for transcript ID and the second for gene ID. The
order of transcripts in this file must be the same as the order in the
kallisto index, and this ordering can be ensured by the function
\code{\link{sort_tr2g}}. There must also be no headers. All columns other than
\code{transcript} and \code{gene} will be discarded. To save a file with those columns,
directly save the transcript to gene data frame with function like
\code{\link{write.table}}, \code{readr::write_delim}, and
\code{\link{fwrite}}.
}
\examples{
toy_path <- system.file("testdata", package = "BUSpaRse")
file_use <- paste(toy_path, "gtf_test.gtf", sep = "/")
tr2g <- tr2g_gtf(file = file_use, verbose = FALSE)
save_tr2g_bustools(tr2g, file_save = "./tr2g.tsv")
}
