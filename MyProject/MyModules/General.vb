Module General

    Public Sub GridSelectedRecordToSession(ByRef MyGridView As System.Web.UI.WebControls.GridView)
        For cellIndex As Integer = 1 To MyGridView.HeaderRow.Cells.Count - 1
            HttpContext.Current.Session(MyGridView.HeaderRow.Cells(cellIndex).Text) = MyGridView.SelectedRow.Cells(cellIndex).Text
        Next

    End Sub

    Public Sub MyAlert(ByVal xControl As System.Web.UI.Control, ByVal alertMessage As String)
        Dim scriptString As String

        scriptString = "alert('"
        scriptString &= alertMessage
        scriptString &= "');"

        System.Web.UI.ScriptManager.RegisterClientScriptBlock(xControl, GetType(Page), "Script", scriptString, True)
    End Sub

End Module
