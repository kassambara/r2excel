\name{xlsx.addTable}
\alias{xlsx.addTable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Add a table to a worksheet
}
\description{
Add a table to an Excel worksheet
}
\usage{
xlsx.addTable(wb, sheet, data, startRow = NULL, startCol = 2,
              col.names = TRUE, row.names = TRUE, columnWidth = 14,
              fontColor = "#FFFFFF", fontSize = 12,
              rownamesFill = "white", colnamesFill = "white",
              rowFill=c("white", "white"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{wb}{workbook object}
  \item{sheet}{sheet object}
  \item{data}{ a data frame}
  \item{startRow}{a numeric value specifying the starting row}
  \item{startCol}{a numeric value specifying the starting column}
  \item{col.names}{a logical value indicating whether the column names of the data are to be written to the file. Default is TRUE}
  \item{row.names}{a logical value indicating whether the row names of the data are to be written to the file. Default is TRUE}
  \item{columnWidth}{a numeric value specifyingthe width of the column.}
  \item{fontColor}{the color of the text}
  \item{fontSize}{the size of the text}
  \item{rownamesFill}{the color for filling the cells containing row names}
  \item{colnamesFill}{the color for filling the cells containing row names}
  \item{rowFill}{a vector of two colors for filling odd and even rows. Default is c("white", "white")}
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
sheet <- createSheet(wb, sheetName = "example1")

# add iris data using default settings
data(iris)
xlsx.addHeader(wb, sheet, value="Add iris table using default settings")
xlsx.addLineBreak(sheet, 1)
xlsx.addTable(wb, sheet, head(iris), startCol=2)
xlsx.addLineBreak(sheet, 2)
 
# Customized table
xlsx.addHeader(wb, sheet, value="Customized table")
xlsx.addLineBreak(sheet, 1)
xlsx.addTable(wb, sheet, data= head(iris),
              fontColor="darkblue", fontSize=14,
              rowFill=c("white", "lightblue")
)
xlsx.addLineBreak(sheet, 2)

# saving a workbook to an Excel file and write the file to the disk.
saveWorkbook(wb, "examples_add_table.xlsx")
}