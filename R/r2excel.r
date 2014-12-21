#+++++++++++++++++++++++++++++++++++++++++
#Author : Alboukadel KASSAMBARA
#Date :2013-07-27
#e-mail : alboukadel.kassambara@gmail.com
#Web site : http://www.sthda.com
#+++++++++++++++++++++++++++++++++++++++++

#R2XLSX: An easy way to Read, Write and Format Excel in R using xlsx package
#settings are at the end of the file

#Version : R2XLSX_1.0
#*********************************************
#Changes : addTable, addParagraph, addText


#****************************************
#Add header : sheet title and subtitle
#****************************************
#wb :workbook object
#sheet : sheet object
#value : your header value
#level : header level; possible value (1 to 6)
#startRow : row index to start to write
#startCol : col index to start to write
#rowBreak : number of rows to jump before appending the data
#underline : a numeric value specifying the thickness of the underline.
#Allowed values are 0, 1, 2.
xlsx.addHeader<-function(wb, sheet, value="Header", level=1, color="#FFFFFF",
                         startRow=NULL, startCol=2, underline=c(0,1,2))
{
  library("xlsx")
  
  if(color=="black") color="white"# black and white color are inversed in xlsx package. don't know why
  # Define some cell styles within that workbook
  H1_STYLE <- CellStyle(wb) + Font(wb,  heightInPoints=22,color=color, isBold=TRUE, underline=underline[1])
  H2_STYLE <- CellStyle(wb) + Font(wb, heightInPoints=18, color=color, isItalic=FALSE, isBold=TRUE, underline=underline[1])
  H3_STYLE <- CellStyle(wb) + Font(wb, heightInPoints=16, color=color, isItalic=TRUE, isBold=TRUE, underline=underline[1])
  H4_STYLE <- CellStyle(wb) + Font(wb, heightInPoints=16, color=color, isItalic=TRUE, isBold=FALSE, underline=underline[1])
  H5_STYLE <- CellStyle(wb) + Font(wb, heightInPoints=14, color=color, isItalic=TRUE, isBold=FALSE, underline=underline[1])
  H6_STYLE <- CellStyle(wb) + Font(wb, heightInPoints=12, color=color, isItalic=TRUE, isBold=FALSE, underline=underline[1])
  
  #Append row to sheet
  if(is.null(startRow)){
    rows<- getRows(sheet) #list of row object
    startRow=length(rows)+1  
  } 
  
  # Create the Sheet title and subtitle
  rows <- createRow(sheet,rowIndex=startRow)
  sheetTitle <- createCell(rows, colIndex=startCol)
  setCellValue(sheetTitle[[1,1]], value)
  if(level==1) xlsx::setCellStyle(sheetTitle[[1,1]], H1_STYLE)
  else if(level==2) xlsx::setCellStyle(sheetTitle[[1,1]], H2_STYLE)
  else if(level==3) xlsx::setCellStyle(sheetTitle[[1,1]], H3_STYLE)
  else if(level==4) xlsx::setCellStyle(sheetTitle[[1,1]], H4_STYLE)
  else if(level==5) xlsx::setCellStyle(sheetTitle[[1,1]], H5_STYLE)
  else if(level==6) xlsx::setCellStyle(sheetTitle[[1,1]], H6_STYLE)  
}


#****************************************
#Add paragraph
#****************************************
#wb :workbook object
#sheet : sheet object
#value : paragraph text
#fontColor: text color. default is black. value : all colors returned by colors() can be used
#fontSize : text size
#backGroundColor : fill color of the cell
#isBold : if TRUE, the text is written in bold format
#isItalic : if TRUE, the text is written in italic format
#startRow : row index to start to write
#startCol : col index to start to write
#colSpan : number of column to be merged (paragraph : width)
#rowSapn : number of rows to be merged corresponding to paragrath height
xlsx.addParagraph<-function(wb,sheet, value, fontColor="#FFFFFF", fontSize=12, backGroundColor="#FFFFFF",
                            isBold=FALSE, isItalic=FALSE,
                            startRow=NULL, startCol=2, colSpan=10, rowSpan=5)
{
  library("xlsx") 
  #Append table to sheet
  if(is.null(startRow)){
    rows<- getRows(sheet) #list of row object
    startRow=length(rows)+1
  }
    rows <- createRow(sheet,rowIndex=startRow)
   sheetParagraph <- createCell(rows, colIndex=startCol)
    setCellValue(sheetParagraph[[1,1]], value)
  #style
  PARAGRAPH_STYLE <- CellStyle(wb)+ 
    Font(wb,  heightInPoints=fontSize,color=fontColor, isBold=isBold, isItalic=isItalic)+                          
    Alignment(wrapText=TRUE, horizontal="ALIGN_JUSTIFY", 
              vertical="VERTICAL_CENTER")
  #background fill
  if(!backGroundColor %in% c("white", "#FFFFFF")) 
    PARAGRAPH_STYLE+Fill(backgroundColor=backGroundColor, foregroundColor=backGroundColor) 
  xlsx::setCellStyle(sheetParagraph[[1,1]], PARAGRAPH_STYLE)
  #Spanning region : -1, because we start to count from zero. 
  #if not, an additionnal row or column are added to merged region
  addMergedRegion(sheet, startRow, endRow=startRow+rowSpan-1, startCol, endColumn=startCol+colSpan-1) 
  xlsx.addLineBreak(sheet, rowSpan) 
}

#****************************************
#Add Hyperlink
#****************************************
#wb :workbook object
#sheet : sheet object
#value : paragraph text
#fontColor: text color. default is black. value : all colors returned by colors() can be used
#fontSize : text size
#isBold : if TRUE, the text is written in bold format
#isItalic : if TRUE, the text is written in italic format
#startRow : row index to start to write
#startCol : col index to start to write
xlsx.addHyperlink<-function(wb,sheet, address, friendlyName, 
                            fontColor="blue", fontSize=12,
                            isBold=FALSE, isItalic=FALSE, startRow=NULL, startCol=2)                      
                       
{
  library("xlsx") 
  #Append table to sheet
  if(is.null(startRow)){
    rows<- getRows(sheet) #list of row object
    startRow=length(rows)+1
  }
  rows <- createRow(sheet,rowIndex=startRow)
  linkCell <- createCell(rows, colIndex=startCol)
  setCellValue(linkCell[[1,1]], friendlyName)
  addHyperlink(linkCell[[1,1]], address)
  
  #style
  HYPERLINK_STYLE <- CellStyle(wb)+ Font(wb,  heightInPoints=fontSize,color=fontColor, isBold=isBold, isItalic=isItalic)+                          
    Alignment(wrapText=FALSE, horizontal="ALIGN_JUSTIFY")      
  xlsx::setCellStyle(linkCell[[1,1]], HYPERLINK_STYLE)
}


#****************************************
#Add Line break to the sheet
#****************************************
#sheet : sheet object
#numberOfLine : number of rows to jump before appending the data
xlsx.addLineBreak<-function(sheet, numberOfLine=1)
{
  library("xlsx")
  
  nrows<-length(getRows(sheet)) #list of row object
  startRow=nrows
  for(i in 1:numberOfLine){
  #Append row to sheet
  startRow=startRow+1
  # Create the Sheet title and subtitle
  rows <- createRow(sheet,rowIndex=startRow)
  sheetLineBreak <- createCell(rows, colIndex=1)
  setCellValue(sheetLineBreak[[1,1]], "  ") 
  }
}


#****************************************
#add table 
#****************************************
#wb :workbook object
#sheet : sheet object
#data : data frame
#level : header level; possible value (1 to 6)
#startRow : row index to start to write
#startCol : col index to start to write
#rowBreak : nimber of rows to jum before appending the data
#if col.names and row.names : column and row names  are written
#fontColor : color of text
#fontSize : text size
#rownamesFill: background color of table row names
#colnamesFill : background color of table column names
#rowFill : background color of odd (1,3,5) and even rows (i.e : 2, 4, 6). For table styling.
#Be carrefull : using mergedColumnForRownames is a  very slow process
xlsx.addTable<-function(wb, sheet, data, startRow=NULL,startCol=2,
                        col.names=TRUE, row.names=TRUE, columnWidth=14,
                        fontColor="#FFFFFF", fontSize=12, 
                        rownamesFill="white", colnamesFill="white", rowFill=c("white", "white")){
  
  library("xlsx")
  #++++++++++++++++++++++++++++++++++++++
  #Define table style
  #++++++++++++++++++++++++++++++++++++++
  #***Border position and pen value*****
  #Border(color="black", position="BOTTOM", pen="BORDER_THIN"
  #position :  Valid values are "BOTTOM", "LEFT", "TOP", "RIGHT"
  # pen : valid values are BORDER_DASH_DOT,BORDER_DASH_DOT_DOT,BORDER_DASHED,BORDER_DOTTED,BORDER_DOUBLE,BORDER_HAIR,BORDER_MEDIUM,BORDER_MEDIUM_DASH_DOT,BORDER_MEDIUM_DASH_DOT_DOT,BORDER_MEDIUM_DASHED,BORDER_NONE,BORDER_SLANTED_DASH_DOT,BORDER_THICK,BORDER_THIN
  #***Alignement value*****
  #Alignment(horizontal=NULL, vertical=NULL, wrapText=FALSE, rotation=0, indent=0)
  #HALIGN_STYLES_: "ALIGN_CENTER, ALIGN_JUSTIFY, ALIGN_LEFT, ALIGN_RIGHT"
  #VALIGN_STYLES_: "VERTICAL_BOTTOM, VERTICAL_CENTER, VERTICAL_JUSTIFY, VERTICAL_TOP"
  #Alignement :
  TABLE_ROWNAMES_STYLE <- CellStyle(wb) + Font(wb, isBold=TRUE, color=fontColor, 
                                            heightInPoints=fontSize)
  #rownames fill 
  if(rownamesFill!="white") {
    TABLE_ROWNAMES_STYLE <-TABLE_ROWNAMES_STYLE+
                        Fill(foregroundColor = rownamesFill, 
                             backgroundColor=rownamesFill)
  }
                
  
  TABLE_COLNAMES_STYLE <- CellStyle(wb) + 
    Font(wb, isBold=TRUE, color=fontColor, heightInPoints=fontSize) +
    Alignment(wrapText=TRUE, horizontal="ALIGN_CENTER") +
    Border(color="black", position=c("TOP", "BOTTOM"), 
           pen=c("BORDER_THIN", "BORDER_THICK"))
  #colnames fill
  if(colnamesFill!="white") {
    TABLE_COLNAMES_STYLE <-TABLE_COLNAMES_STYLE+
                          Fill(foregroundColor = colnamesFill,
                               backgroundColor=colnamesFill)
  }
            
  #Append table to sheet
  #get current active row of sheet
  if(is.null(startRow)){
    rows<- getRows(sheet) #list of row object
    startRow=length(rows)+1
  } 
  
  #font color
  col.n=ncol(data)
  column.style=NULL
  for(i in 1:col.n){
    column.style[[i]]=CellStyle(wb, font=Font(wb, color=fontColor, heightInPoints=fontSize))
  }
  names(column.style)<-as.character(1:ncol(data))
  
  # Add the table  to the sheet
  addDataFrame(data, sheet, startRow=startRow, startColumn=startCol,
               col.names=col.names, row.names=row.names,
               colnamesStyle = TABLE_COLNAMES_STYLE, rownamesStyle=TABLE_ROWNAMES_STYLE,
               colStyle=column.style) 
  #Column width
  #+++++++++++++++++++++++++++++++++++++++
  colIndex=1:(ncol(data)+startCol)
  xlsx::setColumnWidth(sheet, colIndex=colIndex, colWidth=columnWidth)
  
  #Table styling
  #+++++++++++++++++++++++++++++++++++++++
  if(!all(rowFill==c("white", "white"))){
      col.n =ncol(data)
      row.n=nrow(data)
      if(col.names==TRUE) col.n<-col.n+1
      if(row.names==TRUE) row.n<-row.n+1
      cb<-CellBlock(sheet, startRow=startRow, startColumn=startCol, 
                    noRows=row.n, noColumns=col.n, create=FALSE )
      #color pair row for styling
      for(i in 1: nrow(data)){ 
        if(i%%2==0) CB.setFill( cb, fill=Fill(foregroundColor = rowFill[2], backgroundColor=rowFill[2]),
                    rowIndex=i, colIndex=1:col.n)
        else CB.setFill( cb, fill=Fill(foregroundColor = rowFill[1], backgroundColor=rowFill[1]),
                         rowIndex=i, colIndex=1:col.n)
    }
   
  }
}




#****************************************
#add Plot 
#****************************************
#wb :workbook object
#sheet : sheet object
#startRow : row index to start to write
#startCol : col index to start to write
#plotFunction: plot function
xlsx.addPlot<-function( wb, sheet, plotFunction, startRow=NULL,startCol=2,
               width=480, height=480,... )
             
{
  library("xlsx")
  png(filename = "plot.png", width = width, height = height,...)
  plotFunction()
  dev.off() 
  #Append plot to the sheet
  if(is.null(startRow)){
    rows<- getRows(sheet) #list of row object
    startRow=length(rows)+1
  } 
  # Add the file created previously
  addPicture("plot.png", sheet=sheet,  startRow = startRow, startColumn = startCol) 
  xlsx.addLineBreak(sheet, round(width/20)+1)
  res<-file.remove("plot.png")
}

#****************************************
#Write a data.frame to an Excel workbook
#****************************************
#data : data frame
#file : output file name
#if col.names and row.names : column and row names  are written
#append :if TRUE data should be appended to an existing file. 
#usage : res <- xlsx.writeFile(USArrests, file="USArrests.xlsx", sheetName="USArrests")
xlsx.writeFile<-function(data, file, sheetName="Sheet1",
               col.names=TRUE, row.names=TRUE, append=FALSE, ...){
  write.xlsx2(data, file=file, sheetName=sheetName,
              col.names=col.names, row.names=row.names, append=append, ...)
}

#****************************************
#Read a data.frame from an Excel workbook
#****************************************
#file :the path to the file to read
#sheetIndex: a number representing the sheet index in the workbook.
#startRow : index of starting row
#colIndex: a numeric vector indicating the cols you want to extract. If NULL, all columns found will be extracted
#endRow: The index of the last row to pull. If NULL, read all the rows in the sheet.
#header : if TRUE, the first row is considered as row names
#usage : 
#file <- system.file("tests", "test_import.xlsx", package = "xlsx")
#res <- xlsx.readFile(file, 1)  # read first sheet
#head(res)
xlsx.readFile<-function(file, sheetIndex=1, startRow=1, colIndex=NULL, endRow=NULL, header=TRUE,...){
  library("xlsx")
  res<-read.xlsx2(file=file, sheetIndex=sheetIndex, startRow=1, colIndex=colIndex, 
             endRow=endRow,header=header, ...)
   res          
}


# Return operating systeme name
#+++++++++++++++++++++++++++++++++++++++++++
getOS<-function(){ 
  OS=.Platform$OS.type
  if(OS=="unix"){
    if(Sys.info()["sysname"]=="Linux") OS="linux"
    else OS="mac"
  }
}

#++++++++++++++++++++++++++++
#Open file
#++++++++++++++++++++++++++++
xlsx.openFile<-function(filename=NULL)
{  
  absolute.path=paste(getwd(), "/", filename, sep="")
  if(.Platform$OS.type=="windows"){
    shell.exec(absolute.path)
  }
  else if(.Platform$OS.type=="unix"){
    system(paste("open ", absolute.path, sep=""))
  }    
}

#Settings
#+++++++++++++++++++++++++++++++++
#load packages
if(getOS()=="mac") Sys.setenv(NOAWT=1) #prevents usage of awt - required on Mac
