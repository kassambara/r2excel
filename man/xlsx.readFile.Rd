\name{xlsx.readFile}
\alias{xlsx.readFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read the contents of a worksheet into an R data.frame
}
\description{
Read the contents of a worksheet into an R data.frame. This function is just a wrapper for the read.xlsx2 function from xlsx package.
}
\usage{
xlsx.readFile(file, sheetIndex = 1, startRow = 1, colIndex = NULL, endRow = NULL, header = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{the path to the file to read}
  \item{sheetIndex}{a number indicating the index of the sheet to read from the workbook}
   \item{startRow}{a numeric value specifying the starting row}
  \item{colIndex}{a numeric vector indicating the cols you want to extract. If NULL, all columns found will be extracted.}
  \item{endRow}{a number specifying the index of the last row to pull. If NULL, read all the rows in the sheet.}
  \item{header}{a logical value indicating whether the first row corresponding to the first element of the rowIndex vector contains the names of the variables.}
  \item{\dots}{other arguments to read.xlsx2 function}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
}
\references{
http://www.sthda.com
}
\author{
Alboukadel Kassambara <alboukadel.kassambara@gmail.com>
}
\note{
%%  ~~further notes~~
}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
file <- system.file("tests", "test_import.xlsx", package = "xlsx")
res <- xlsx.readFile(file, 1)  # read first sheet
head(res)
}