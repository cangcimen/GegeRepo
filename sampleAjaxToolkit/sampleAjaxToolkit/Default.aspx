<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="sampleAjaxToolkit._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<link href="Styles/modalpopup.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>
<div>
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />
    <asp:GridView runat="server" ID="employeeGrid" DataKeyNames="EmployeeID" AutoGenerateColumns="false">
    <RowStyle BackColor="#EFF3FB" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
            <asp:ImageButton ID="imgbtn" ImageUrl="edit.png" runat="server" Width="25" Height="25" onclick="imgbtn_Click" />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblresult" runat="server"/>
    <asp:Button ID="btnShowPopup" runat="server" style="display:none" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
    CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="269px" Width="400px" style="display:none">
    <table width="100%" style="border:Solid 3px #D55500; width:100%; height:100%" cellpadding="0" cellspacing="0">
    <tr style="background-color:#D55500">
    <td colspan="2" style=" height:10%; color:White; font-weight:bold; font-size:larger" align="center">Employee Details</td>
    </tr>
    <tr>
 
    </tr>
    <tr>
    <td align="right">
    EmployeeID:
    </td>
    <td>
    <asp:Label ID="lblEmployeeID" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td align="right">
    FirstName:
    </td>
    <td>
    <asp:TextBox ID="txtfname" runat="server"/>
    </td>
    </tr>
    <tr>
    <td align="right">
    LastName:
    </td>
    <td>
    <asp:TextBox ID="txtlname" runat="server"/>
    </td>
    </tr>
    <tr>
    <td align="right">
    City:
    </td>
    <td>
    <asp:TextBox ID="txtCity" runat="server"/>
    </td>
    </tr>
    <tr>
    <td align="right">
    Address:
    </td>
    <td>
    <asp:TextBox ID="txtAdd" runat="server"/>
    </td>
    </tr>
    <tr>
    <td>
    </td>
    <td>
    <asp:Button ID="btnUpdate" CommandName="Update" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
    </td>
    </tr>
    </table>
    </asp:Panel>
</div>
</asp:Content>
