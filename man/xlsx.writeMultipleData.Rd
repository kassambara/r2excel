\name{xlsx.writeMultipleData}
\alias{xlsx.writeMultipleData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Export multiple data to the same Excel workbook}
\description{Export multiple data to the same Excel workbook. The different objects (data) are written in different worksheets from the same Excel workbook. The object names are used for naming the different sheets. It works for data frames, matrices, time series, and tables.}
\usage{
xlsx.writeMultipleData(file, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{the path to the output file.}
  \item{\dots}{a list of data to write to the workbook}
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
xlsx.writeMultipleData("multiple-objects-workbooks.xlsx", mtcars, Titanic, AirPassengers, state.x77)
xlsx.openFile("multiple-objects-workbooks.xlsx")
}