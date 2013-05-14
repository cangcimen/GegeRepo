Imports System.Data.SqlClient
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports AjaxControlToolkit


Public Class _Default
    Inherits System.Web.UI.Page
    Dim cnString As String = "data source = .;uid = sa; pwd = biofree; initial catalog = northwind"

    Private Sub populateData()
        Using cn As New SqlConnection(cnString)
            cn.Open()
            Dim sql As String = "SELECT * FROM Employees"
            Dim cmd As New SqlCommand(sql, cn)
            Dim reader As SqlDataReader = cmd.ExecuteReader
            Dim dt As New DataTable
            dt.Load(reader)
            employeeGrid.DataSource = dt
            employeeGrid.DataBind()
        End Using
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            populateData()
        End If
    End Sub

    Protected Sub imgbtn_click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim btndetails As ImageButton = TryCast(sender, ImageButton)
        Dim gvrow As GridViewRow = DirectCast(btndetails.NamingContainer, GridViewRow)
        lblEmployeeID.Text = gvrow.Cells(0).Text
        txtfname.Text = gvrow.Cells(1).Text
        txtlname.Text = gvrow.Cells(2).Text
        txtCity.Text = gvrow.Cells(3).Text
        txtAdd.Text = gvrow.Cells(4).Text
        Me.ModalPopupExtender1.Show()

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Using cn As New SqlConnection(cnString)
            cn.Open()
            Dim sql As String = "UPDATE Employees SET FirstName = @FirstName, LastName = @Lastname, City = @City, Address = @Address WHERE EmployeeID = @EmployeeID"
            Dim cmd As New SqlCommand(sql, cn)
            cmd.Parameters.AddWithValue("@FirstName", txtfname.Text)
            cmd.Parameters.AddWithValue("@LastName", txtlname.Text)
            cmd.Parameters.AddWithValue("@City", txtCity.Text)
            cmd.Parameters.AddWithValue("@Address", txtAdd.Text)
            cmd.Parameters.AddWithValue("@EmployeeID", Convert.ToInt32(lblEmployeeID.Text))
            cmd.ExecuteNonQuery()
            populateData()
        End Using
    End Sub

End Class