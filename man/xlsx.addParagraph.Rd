\name{xlsx.addParagraph}
\alias{xlsx.addParagraph}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Add a paragraph of text to a worksheet
}
\description{
Add a paragraph of text to a worksheet
}
\usage{
xlsx.addParagraph(wb, sheet, value, fontColor = "#FFFFFF", fontSize = 12, 
                  backGroundColor = "#FFFFFF", isBold = FALSE, isItalic = FALSE,
                  startRow = NULL, startCol = 2, colSpan = 10, rowSpan = 5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{wb}{workbook object}
  \item{sheet}{sheet object}
  \item{value}{text to write}
  \item{fontColor}{color of the text}
  \item{fontSize}{size of the text}
  \item{backGroundColor}{background color of the text container}
  \item{isBold}{if TRUE, the text is written in bold format}
  \item{isItalic}{if TRUE, the text is written in italic format}
  \item{startRow}{a numeric value specifying the starting row}
  \item{startCol}{a numeric value specifying the starting column}
  \item{colSpan}{number of columns to be merged (paragraph : width)}
  \item{rowSpan}{number of rows to be merged (paragraph height)}
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
 
# Add paragraph
xlsx.addHeader(wb, sheet, " Add paragraph", level=2, underline=1)
xlsx.addLineBreak(sheet, 2)
paragraph="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
xlsx.addParagraph(wb, sheet, paragraph, fontSize=14, isItalic=TRUE, 
                  fontColor="darkred", backGroundColor="gray",
                   colSpan=10, rowSpan=10)

# saving a workbook to an Excel file and write the file to the disk.
saveWorkbook(wb, "examples_add_paragraph.xlsx")
}
