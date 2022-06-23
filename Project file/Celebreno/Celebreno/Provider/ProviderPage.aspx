<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProviderPage.aspx.cs" Inherits="Celebreno.Provider.ProviderPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <br />

    <h1>Provider Page</h1>
    <p>
        <asp:Button ID="BtnAdd" runat="server" Text="Add" CausesValidation="False" OnClick="BtnAdd_Click" CssClass="btn btn-primary"  />
        
        &nbsp;<asp:Button ID="BtnView" runat="server" Text="View" CausesValidation="False" OnClick="BtnView_Click" CssClass="btn btn-primary" />
    </p>

   <style>
    :root{--gv-border-radius: 7px;}
    .rcgv
    {
        border-radius: var(--gv-border-radius);
        border-width: 0 !important;
    }
    .rcgv th:first-child
    {
        border-top-left-radius: var(--gv-border-radius);
    }
    .rcgv th:last-child
    {
        border-top-right-radius: var(--gv-border-radius);
    }
    .rcgv tr:last-child td:first-child
    {
        border-bottom-left-radius: var(--gv-border-radius);
    }
    .rcgv tr:last-child td:last-child
    {
        border-bottom-right-radius: var(--gv-border-radius);
    }
</style>

    <asp:MultiView ID="MultiViewAdmin" runat="server" ActiveViewIndex="0">



        <asp:View ID="View1Add" runat="server">

            <table class="w-100">
                <tr>
                    <td  style="width:40%">
                        <h3>Add Service Package:</h3>
                        <br/>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelAddEventType" runat="server">Event Type:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownAddEventType" runat="server" class="form-control" DataTextField="EventTypeName" DataValueField="EventTypeID" ItemType="Celebreno.Models.EventType" SelectMethod="GetEventTypes">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <asp:Label ID="LabelAddName" runat="server">Provider:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="AddServicePackName" runat="server" CssClass="form-control" placeholder="Provider Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AddServicePackName" Display="Dynamic" SetFocusOnError="true" Text="* Provider of the Service Package is required."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelAddDescription" runat="server">Provided Services:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtAddDesc" runat="server" CssClass="form-control" placeholder="Description" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtAddDesc" Display="Dynamic" SetFocusOnError="true" Text="* Description required."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtAddDesc" Display="Dynamic" ErrorMessage="* Please enter valid description without spaces" ValidationExpression="^[a-zA-Z]+[a-zA-Z0-9_-]*(?:,[a-zA-Z]+[a-zA-Z0-9_-]*)*$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelAddPrice" runat="server">Price:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="AddProductPrice" runat="server" CssClass="form-control" placeholder="Price"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddProductPrice" Display="Dynamic" SetFocusOnError="true" Text="* Price required."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AddProductPrice" Display="Dynamic" SetFocusOnError="True" Text="* Must be a valid price without $." ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                         <br />
                        <asp:Button ID="BtnAddService" runat="server" CausesValidation="true" CssClass="btn btn-secondary" OnClick="BtnAddService_Click" Text="Add" />
                    </td>
                   <td style="width:60%; direction: ltr;">

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Celebreno %>" SelectCommand="SELECT [ID], [Description], [UnitPrice], [EventTypeID], [Provider] FROM [ServicePacks]"></asp:SqlDataSource>

                        <asp:GridView ID="GridViewAdd" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="100px" HorizontalAlign="Center" RowHeaderColumn="ID" style="margin-top: 0px" CssClass="rcgv" GridLines="None"  >
                            <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="EventTypeID" HeaderText="EventTypeID" SortExpression="EventTypeID" />
                    <asp:BoundField DataField="Provider" HeaderText="Provider" SortExpression="Provider" />
                </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
                        <div style="direction: ltr">
                            EventTypeID: 1 - Social Event &nbsp;|&nbsp;2 - Wedding Event
                            <br />
                        </div>
                        
                       
                       
                        
                        
                    </td>
                </tr>
            </table>
            <h3>&nbsp;</h3>

            <p></p>
        </asp:View>





        <asp:View ID="View4View" runat="server">
            <asp:ListView ID="SPList" runat="server" DataKeyNames="ID" GroupItemCount="4" ItemType="Celebreno.Models.ServicePack" SelectMethod="GetServicePacksView">
                <%--1--%>
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <%--2--%>
                <EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                <%--3--%>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <%--4--%>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td><a href="http://localhost:44371/AdProvServicePackDetails.aspx?ID=<%#:Item.ID%>"><%-- old code in .doc -> now, it is a uniform img, so the code could be more simple, but let it be like this for now, if I changed my mind --%>
                                    <image height="75" src="/Images/calendar.png" style="border: none" width="100" />
                                    </a></td>
                            </tr>
                            <tr>
                                <td><a href="http://localhost:44371/AdProvServicePackDetails.aspx?ID=<%#:Item.ID%>"><span><%#:Item.Provider%></span></a>
                                    <br />
                                    <span><b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%></span>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <%--5 (with table)--%>
                <LayoutTemplate>
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                        <tr id="groupPlaceholder">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                            </tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <%--End of the List View (ServicePackList)--%>
        </asp:View>




    </asp:MultiView>


    <asp:Label ID="LabelActionStatus" runat="server" style="font-family: 'Segoe UI'; color: #EE686E"></asp:Label>







</asp:Content>
