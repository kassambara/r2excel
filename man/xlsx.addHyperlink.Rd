\name{xlsx.addHyperlink}
\alias{xlsx.addHyperlink}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Add a hyperlink to a worksheet.
}
\description{
Add a hyperlink to a worksheet.
}
\usage{
xlsx.addHyperlink(wb, sheet, address, friendlyName,
                  fontColor = "blue", fontSize = 12, 
                  isBold = FALSE, isItalic = FALSE,
                  startRow = NULL, startCol = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{wb}{workbook object}
  \item{sheet}{sheet object}
  \item{address}{text indicating the url}
  \item{friendlyName}{text specifying the name of the link }
  \item{fontColor}{the color to use for the text of the link}
  \item{fontSize}{the font size of the text}
  \item{isBold}{if TRUE, the text is written in bold format}
  \item{isItalic}{if TRUE, the text is written in italic format}
  \item{startRow}{a numeric value specifying the starting row}
  \item{startCol}{a numeric value specifying the starting column}
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
 
# Add Hyperlink
#+++++++++++++++++++++++++++++
xlsx.addHeader(wb, sheet, " Add Hyperlink", level=2, underline=1)
xlsx.addLineBreak(sheet, 1)
xlsx.addHyperlink(wb, sheet, "http://www.sthda.com", "Click-me!", fontSize=12)
xlsx.addLineBreak(sheet, 2)

# saving a workbook to an Excel file and write the file to the disk.
saveWorkbook(wb, "examples_add_hyperlink.xlsx")
}