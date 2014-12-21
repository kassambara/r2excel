\name{xlsx.openFile}
\alias{xlsx.openFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Open a file}
\description{Open a file from the current working directory.}
\usage{
xlsx.openFile(filename = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{the name of the file. The file should be in the current working directory.}
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