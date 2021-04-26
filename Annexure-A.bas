Attribute VB_Name = "Module1"
Sub Copy_Indications()
Dim intCol As Integer
Dim intToCol As Integer
Dim strColLetter As String, strNumLetter As String
Dim intResultRows As Integer, intResultCols As Integer
If SheetExists("Result") Then
    Worksheets("Result").Range("A1:GAQ400").ClearContents
Else
    MsgBox ("To proceed, please create a new sheet with name " & Chr(34) & "Result" & Chr(34)), vbCritical
    Exit Sub
End If
intResultCols = 2
intToCol = ColNumber("GAQ")
For intCol = 3 To intToCol
    intResultRows = 2
    intCol = intCol + 2
    strColLetter = ColLetter(intCol)
    strNumLetter = ColLetter(intCol + 1)
'    Step 1
    Worksheets("Indication").Range(strColLetter & "2:" & strColLetter & "367").Value = Worksheets("Indication").Range("B2:B367").Value

'    Step 2
    Worksheets("Indication").Range(strColLetter & "2:" & strNumLetter & "367").Sort Key1:=Worksheets("Indication").Range(strNumLetter & "2"), Order1:=xlDescending, Header:=xlYes

'    Step 3
    For intRow = 2 To 367
        If Worksheets("Indication").Cells(intRow, intCol + 1) > 0.5 Then
            Worksheets("Result").Cells(intResultRows, intResultCols) = Worksheets("Indication").Cells(intRow, intCol + 1)
            Worksheets("Result").Cells(intResultRows, intResultCols - 1) = Worksheets("Indication").Cells(intRow, intCol)
            intResultRows = intResultRows + 1
        End If
    Next
      
    Worksheets("Result").Cells(1, intResultCols - 1) = "Indication"
    Worksheets("Result").Cells(1, intResultCols) = Worksheets("Indication").Cells(1, intCol + 1)
    intResultCols = intResultCols + 2
Next
MsgBox "Done", vbInformation
End Sub

Function ColLetter(ColNumber As Integer) As String
     ColLetter = Split(Cells(1, ColNumber).Address, "$")(1)
End Function

Function ColNumber(ColumnLetter As String) As Integer
   ColNumber = Range(ColumnLetter & 1).Column
End Function

Public Function SheetExists(strSheetName As Variant, Optional wbWorkbook As Workbook) As Boolean
    If wbWorkbook Is Nothing Then Set wbWorkbook = ActiveWorkbook           'or ThisWorkbook - whichever appropriate
    Dim obj As Object
    On Error GoTo HandleError
    Set obj = wbWorkbook.Sheets(strSheetName)
    SheetExists = True
    Exit Function
HandleError:
     SheetExists = False
End Function
