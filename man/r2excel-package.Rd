\name{r2excel-package}
\alias{r2excel-package}
\alias{r2excel}
\docType{package}
\title{Read, write and format Excel files in R}
\description{Provide easy to use functions to read, write and format excel files (Excel 2007 and Excel 97/2000/XP/2003)}
\details{
\tabular{ll}{
Package: \tab r2excel\cr
Type: \tab Package\cr
Version: \tab 1.0.0\cr
Date: \tab 2014-12-20\cr
License: \tab GPL-3\cr
}
}
\author{
Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

Maintainer: Alboukadel Kassambara <alboukadel.kassambara@gmail.com>
}
\references{
http://www.sthda.com
}
\keyword{ package }
\examples{ 
# Create an Excel workbook. Both .xls and .xlsx file formats can be used.
filename<-"r2excel-example.xlsx"
wb <- createWorkbook(type="xlsx")
# Create a sheet in that workbook
sheet <- xlsx::createSheet(wb, sheetName = "example1")

# Add header
#+++++++++++++++++++++++++++++++
# Create the Sheet title and subtitle
xlsx.addHeader(wb, sheet, value="Excel file written with r2excel packages",
            level=1, color="darkblue", underline=2)         
xlsx.addLineBreak(sheet, 2)

# Add paragraph : Author
#+++++++++++++++++++++++++++++++
xlsx.addParagraph(wb, sheet, value="Author : Alboukadel KASSAMBARA. \n@:alboukadel.kassambara@gmail.com.\n Website : http://ww.sthda.com", isItalic=TRUE, colSpan=5, rowSpan=4, fontColor="darkgray", fontSize=14)
xlsx.addLineBreak(sheet, 3)

# Add table
#+++++++++++++++++++++++++++++
# add iris data using default settings
data(iris)
xlsx.addHeader(wb, sheet, value="Add iris table using default settings", level=2)
xlsx.addLineBreak(sheet, 1)
xlsx.addTable(wb, sheet, head(iris), startCol=2)
xlsx.addLineBreak(sheet, 2)
 
# Customized table
xlsx.addHeader(wb, sheet, value="Customized table", level=2)
xlsx.addLineBreak(sheet, 1)
xlsx.addTable(wb, sheet, data= head(iris),
              fontColor="darkblue", fontSize=14,
              rowFill=c("white", "lightblue")
)
xlsx.addLineBreak(sheet, 2)


# Add paragraph
#+++++++++++++++++++++++++++++
xlsx.addHeader(wb, sheet, "Add paragraph", level=2)
xlsx.addLineBreak(sheet, 2)
paragraph="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
xlsx.addParagraph(wb, sheet, paragraph, fontSize=14, isItalic=TRUE, 
                  fontColor="darkred", backGroundColor="gray")
xlsx.addLineBreak(sheet, 2)

# Add Hyperlink
#+++++++++++++++++++++++++++++
xlsx.addHeader(wb, sheet, " Add Hyperlink", level=2)
xlsx.addLineBreak(sheet, 1)
xlsx.addHyperlink(wb, sheet, "http://www.sthda.com", "Click-me!!", fontSize=12)
xlsx.addLineBreak(sheet, 2)

# Add box plot
#+++++++++++++++++++++++++++++
data(ToothGrowth)
xlsx.addHeader(wb, sheet, " Add Plot", level=2)
xlsx.addLineBreak(sheet, 1)
plotFunction<-function(){boxplot(len ~ dose, data = ToothGrowth, col = 1:3)}
xlsx.addPlot(wb, sheet, plotFunction())

# save the workbook to an Excel file and write the file to disk.
xlsx::saveWorkbook(wb, filename)

#open file
xlsx.openFile(filename)

}
