\name{xlsx.addHeader}
\alias{xlsx.addHeader}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Add a header to a worksheet
}
\description{
Add a header (title and sub-title) to an Excel worksheet.
}
\usage{
xlsx.addHeader(wb, sheet, value = "Header", level = 1, 
              color = "#FFFFFF", startRow = NULL,
              startCol = 2, underline = c(0, 1, 2))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{wb}{workbook object}
  \item{sheet}{sheet object}
  \item{value}{the text to write as a header}
  \item{level}{header level; possible values are form 1 to 6}
  \item{color}{the color to use for the header}
  \item{startRow}{a numeric value specifying the starting row}
  \item{startCol}{a numeric value specifying the starting column}
  \item{underline}{a numeric value specifying whether the header should be underlined or not. Possible values are 0 (default value, no underline), 1 (underline with one line), 2 (underline with two lines)}
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
# create an Excel workbook. Both .xls and .xlsx file formats can be used.
wb <- createWorkbook(type="xlsx")
# Create a sheet in that workbook
sheet <- xlsx::createSheet(wb, sheetName = "example1")
 
# header level 1
xlsx.addHeader(wb, sheet, value="Header 1",level=1, color="black")
# header level 2
xlsx.addHeader(wb, sheet, value="Header 2",level=2, color="black")
# header level 3
xlsx.addHeader(wb, sheet, value="Header 3",level=3, color="black")
# header level 4
xlsx.addHeader(wb, sheet, value="Header 4",level=4, color="black")
# header level 5
xlsx.addHeader(wb, sheet, value="Header 5",level=5, color="black")
# header level 6
xlsx.addHeader(wb, sheet, value="Header 6",level=6, color="black")

# Underline the header
xlsx.addHeader(wb, sheet, value="Header 1",level=1, color="blue", underline=1)
xlsx.addHeader(wb, sheet, value="Header 1",level=1, color="blue", underline=2)

# saving a workbook to an Excel file and write the file to the disk.
saveWorkbook(wb, "examples_add_header.xlsx")
}