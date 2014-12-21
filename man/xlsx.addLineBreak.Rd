\name{xlsx.addLineBreak}
\alias{xlsx.addLineBreak}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Add a line break to a worksheet
}
\description{
Add a line break to a worksheet.
}
\usage{
xlsx.addLineBreak(sheet, numberOfLine = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sheet}{ Sheet object}
  \item{numberOfLine}{number of rows to skip before appending the data}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
# create an Excel workbook. Both .xls and .xlsx file formats can be used.
wb <- createWorkbook(type="xlsx")
# Create a sheet in that workbook
sheet <- xlsx::createSheet(wb, sheetName = "example1")
 
# Add line break
xlsx.addHeader(wb, sheet, value="Header 1",level=1, color="black")
xlsx.addLineBreak(sheet, 3)
xlsx.addHeader(wb, sheet, value="Header 2",level=1, color="black")

# saving a workbook to an Excel file and write the file to the disk.
saveWorkbook(wb, "examples_add_linebreak.xlsx")
}