\name{xlsx.writeFile}
\alias{xlsx.writeFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Write a data.frame to an Excel workbook}
\description{Write a data.frame to an Excel workbook. This function is just a wrapper for the write.xlsx2 function from xlsx package.}
\usage{
xlsx.writeFile(data, file, sheetName = "Sheet1",
    col.names = TRUE, row.names = TRUE, append = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{a data.frame to write to the workbook.}
  \item{file}{the path to the output file.}
  \item{sheetName}{a character string with the sheet name}
  \item{col.names}{a logical value indicating if the column names of the data are to be written to the file.}
  \item{row.names}{a logical value indicating if the row names of the data are to be written to the file.}
  \item{append}{a logical value indicating if x should be appended to an existing file. If TRUE the file is read from disk.}
  \item{\dots}{Other arguments to write.xlsx2 from xlsx package}
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
xlsx.writeFile(USArrests, file="USArrests.xlsx", sheetName="USArrests")
xlsx.openFile("USArrests.xlsx")
}