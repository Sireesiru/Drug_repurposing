Attribute VB_Name = "Module1"

Sub FinalOutput()
    Dim LngCol As Long
    Dim intLastRow As Integer
'    Duplicate Sheet as backup
    For Each ws In Worksheets
        If ws.Name = "Sheet2_Backup" Then
            Application.DisplayAlerts = False
            Sheets("Sheet2_Backup").Delete
            Application.DisplayAlerts = True
        ElseIf ws.Name = "Result_Sheet" Then
            Application.DisplayAlerts = False
            Sheets("Result_Sheet").Delete
            Application.DisplayAlerts = True
        End If
    Next
    Application.DisplayAlerts = False
    ThisWorkbook.Sheets("Sheet2").Copy _
    After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count)
    ActiveSheet.Name = "Sheet2_Backup"
    Application.DisplayAlerts = True
    ThisWorkbook.Sheets("Sheet2").Select
    For LngCol = 2 To ColNumber("IJV")
'        Step -1
        Worksheets("Sheet2").Range(ColLetter(LngCol + 1) & "2:" & ColLetter(LngCol + 1) & FindLastRow(LngCol)).Value = Worksheets("Sheet2").Cells(1, LngCol).Value

'        Step -2
        If LngCol > 2 Then
            Worksheets("Sheet2").Range("A" & FindLastRow(1) + 1 & ":C" & FindLastRow(1) + FindLastRow(LngCol + 1) - 1).Value = Worksheets("Sheet2").Range(ColLetter(LngCol - 1) & "2:" & ColLetter(LngCol + 1) & FindLastRow(LngCol + 1)).Value
        End If
    LngCol = LngCol + 3
    Next
    Worksheets("Sheet2").Range("A1").Value = "Indication"
    Worksheets("Sheet2").Range("B1").Value = "Value"
    Worksheets("Sheet2").Range("C1").Value = "Drug Name"
    Worksheets("Sheet2").Range("D1:IJV500").ClearContents
    
    Range("A1:C1").Select
    With Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorDark1
        .TintAndShade = -0.349986266670736
        .PatternTintAndShade = 0
    End With
    Selection.Font.Bold = True
    Range("A1:C" & FindLastRow(1)).Select
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    Columns("A:C").Select
    Columns("A:C").EntireColumn.AutoFit
    
    Sheets("Sheet2").Name = "Result_Sheet"
    Sheets("Sheet2_Backup").Name = "Sheet2"
End Sub
Function FindLastRow(intCol) As Long
    FindLastRow = Cells(Rows.Count, intCol).End(xlUp).Row
End Function
Function ColLetter(ColNumber As Long) As String
     ColLetter = Split(Cells(1, ColNumber).Address, "$")(1)
End Function
Function ColNumber(ColumnLetter As String) As Integer
   ColNumber = Range(ColumnLetter & 1).Column
End Function


