<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdProvServicePackDetails.aspx.cs" Inherits="Celebreno.AdProvServicePackDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <br />

    <asp:FormView ID="SPForm" runat="server" ItemType="Celebreno.Models.ServicePack" SelectMethod ="GetServicePack" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1><%#:Item.Provider %></h1>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                         <image  src="/Images/calendar.png"  style="border:none; height:200px"  alt="<%#:Item.Provider %>" />
                    </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: central; text-align:left;">
                        <b>Services Provided:</b><br /><%#:Item.Description %>
                        <br />
                        <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %></span>
                        <br />
                        <span><b>Service Package ID:</b>&nbsp;<%#:Item.ID %></span>
                       
                        <br />
                        <span><b>Event Type:</b>&nbsp;<%#:Item.EventType.EventTypeName %></span>
                        <br />
                        <span><b>Provider:</b>&nbsp;<%#:Item.Provider %></span>
                        <br />
                     
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>



</asp:Content>
