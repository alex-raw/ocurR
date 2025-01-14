% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assoc.R
\name{coll_analysis}
\alias{coll_analysis}
\alias{coll_analysis.data.frame}
\alias{coll_analysis.matrix}
\alias{coll_analysis.default}
\title{Association measures for collocation and collostruction analyses}
\usage{
coll_analysis(.x, ...)

\method{coll_analysis}{data.frame}(
  .x,
  o11 = NULL,
  f1 = NULL,
  f2 = NULL,
  n = NULL,
  fun = "ll",
  flip = NULL,
  ...
)

\method{coll_analysis}{matrix}(.x, f2 = NULL, n = NULL, fun = "ll", flip = NULL, ...)

\method{coll_analysis}{default}(.x, o11, f1, f2 = NULL, n = NULL, fun = "ll", flip = NULL, ...)
}
\arguments{
\item{.x}{data.frame or list containing data}

\item{...}{further arguments to be passed to or from other methods}

\item{o11}{numeric: joint frequencies}

\item{f1}{numeric: corpus frequencies of the word}

\item{f2}{numeric of length 1 or equal to o11: corpus frequencies of
co-occurring structure; if omitted, sum of o11 is used}

\item{n}{numeric of length 1 or equal to o11: corpus or sample size; if
omitted, \code{sum(f1 + f2)} is used; this might be undesired in the case of
collostruction analysis, where corpus size should always be explicitly
passed}

\item{fun}{character vector or named list containing character, function or
expression elements: for built-in measures (see Details).}

\item{flip}{character: names of measures for which to flip the sign for cases
with negative association, intended for two-sided measures}
}
\value{
an object similar to .x with one result per column for the
association measures specified in \code{fun}; row names in matrices and character
or factor columns in data.frames are preserved
}
\description{
Calculates common association measures used to perform collocation or
collostruction analysis for typical count data.
}
\details{
For collocation analysis, f1 and f2 typically represent the corpus
frequencies of the word and the collocate, respectively, i.e. frequencies of
co-occurrence included. For collostruction analysis, f1 represents the corpus
frequencies of the word, and f2 the construction frequency. In a contingency
table, they represent marginal sums.
Both the construction frequency \code{f2} and the corpus size \code{n} can be provided
as vectors, which allows for efficient calculations over data from multiple
constructions/corpora.

For data.frame input, the values for "o11", "f1", "f2", "n" can either be
provided explicitly as expression or character argument or implicitly by
column name. It is recommended to pass the columns explicitly.

Matrix input currently requires column names "o11", "f1", "f2", "n"
}
\examples{

data(adjective_cooccurrence)
.x <- subset(adjective_cooccurrence, word != collocate)
n <- attr(adjective_cooccurrence, "corpus_size")
res <- coll_analysis(.x, o11, f1, f2, n, fun = "ll")
res[order(res$ll, decreasing = TRUE), ] |> head()

# if arguments match column names, they can be used explicitly
c("o11", "f1", "f2") \%in\% names(.x) # TRUE
coll_analysis(.x, n = n, fun = "ll") |>
  head()

# control names of output columns by using a named list
coll_analysis(.x, o11, f1, f2, n, fun = list(logl = "ll")) |>
  head()

# using custom function
mi_base2 <- \(o11, e11) log2(o11 / e11)
coll_analysis(.x, o11, f1, f2, n, fun = mi_base2) |>
  head()

# mix built-in measures with custom functions
coll_analysis(.x, n = n, fun = list(builtin = "ll", custom = mi_base2)) |>
  head()

}
