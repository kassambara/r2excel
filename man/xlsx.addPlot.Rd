\name{xlsx.addPlot}
\alias{xlsx.addPlot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Add a plot to a worksheet
}
\description{
Add a plot to a worksheet
}
\usage{
xlsx.addPlot(wb, sheet, plotFunction, startRow = NULL, startCol = 2, 
            width = 480, height = 480, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{wb}{workbook object}
  \item{sheet}{sheet object}
  \item{plotFunction}{a plotting function}
  \item{startRow}{a numeric value specifying the starting row}
  \item{startCol}{a numeric value specifying the starting column}
  \item{width}{width of the plot}
  \item{height}{height of the plot}
  \item{\dots}{others arguments to png() function}
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

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# create an Excel workbook. Both .xls and .xlsx file formats can be used.
wb <- createWorkbook(type="xlsx")
# Create a sheet in that workbook
sheet <- createSheet(wb, sheetName = "example1")
 
# basic box plot
data(ToothGrowth)
xlsx.addHeader(wb, sheet, "Basic box plot")
xlsx.addLineBreak(sheet, 1)
plotFunction<-function(){boxplot(len ~ dose, data = ToothGrowth, col = 1:3)}
xlsx.addPlot(wb, sheet, plotFunction())

# ggplot2
library("ggplot2")
xlsx.addHeader(wb, sheet, "ggplot2")
xlsx.addLineBreak(sheet, 1)
plotFunction<-function(){
  p<-qplot(mpg, wt, data=mtcars)
  print(p)
  }
xlsx.addPlot(wb, sheet, plotFunction())


# saving a workbook to an Excel file and write the file to the disk.
saveWorkbook(wb, "examples_add_plot.xlsx")
}