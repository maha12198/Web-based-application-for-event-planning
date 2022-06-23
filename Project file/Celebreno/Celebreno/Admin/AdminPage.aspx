 <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Celebreno.Admin.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       
    <br />

    <h1>Administration</h1>
    <p>
        <asp:Button ID="BtnAdd" runat="server" Text="Add" CausesValidation="False" OnClick="BtnAdd_Click" class="btn btn-primary" />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="BtnRmv" runat="server" Text="Remove" CausesValidation="False" OnClick="BtnRmv_Click"  class="btn btn-primary"/>   
        &nbsp;&nbsp;&nbsp;<asp:Button ID="BtnUpdate" runat="server" Text="Update" CausesValidation="False" OnClick="BtnUpdate_Click" class="btn btn-primary" />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="BtnView" runat="server" Text="View" CausesValidation="False" OnClick="BtnView_Click" class="btn btn-primary" /> 

         
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

            <table style="width:100%">
                <tr>
                    <td style="width:40%; vertical-align: top; text-align:left;">
                        
                        <h3><strong>Add Service Package:</strong></h3>
                         <br />
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelAddEventType" runat="server">Event Type:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownAddEventType" runat="server" DataTextField="EventTypeName" DataValueField="EventTypeID" ItemType="Celebreno.Models.EventType" SelectMethod="GetEventTypes" class="form-control">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                           
                            <tr>
                                <td>
                                    Provider:</td>
                                <td>
                                    
                                    <asp:TextBox ID="AddServicePackName" runat="server" class="form-control" placeholder="Provider Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AddServicePackName" Display="Dynamic" SetFocusOnError="true" Text="* Provider of the Service Package is required."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelAddDescription" runat="server"> Provided Services:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtAddDesc" runat="server" TextMode="MultiLine" class="form-control" placeholder="Description"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtAddDesc" Display="Dynamic" SetFocusOnError="true" Text="* Description required."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtAddDesc" Display="Dynamic" ErrorMessage="* Please enter valid description without spaces" ValidationExpression="^[a-zA-Z]+[a-zA-Z0-9_-]*(?:,[a-zA-Z]+[a-zA-Z0-9_-]*)*$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelAddPrice" runat="server">Price:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="AddProductPrice" runat="server"  class="form-control" placeholder="Price"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddProductPrice" Display="Dynamic" SetFocusOnError="true" Text="* Price required."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AddProductPrice" Display="Dynamic" SetFocusOnError="True" Text="* Must be a valid price without $." ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
    <br />

                        <asp:Button ID="BtnAddService" runat="server" CausesValidation="true" OnClick="BtnAddService_Click" Text="Add" class="btn btn-secondary"/>
                    </td>



                    <td style="width:60% ; vertical-align: top; text-align:left;">

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
                        
                       
                                                
                    </td>
                    
                </tr>
            </table>

        </asp:View>




        <asp:View ID="View2Remove" runat="server">







            <table style="width:100%" >
                <tr>
                    <td style="width:40% ; vertical-align: top; text-align:left;">
                        <h3><strong>Remove Service Package:</strong></h3>
                     
                          <br />
                     
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server">Service Package ID:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownRemoveServiceByID" runat="server" AppendDataBoundItems="true" DataTextField="ID" DataValueField="ID" ItemType="Celebreno.Models.ServicePack" SelectMethod="GetServicePacks" class="form-control">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                      
                        <br />
                        <br />
                        <asp:Button ID="BtnRemoveService" runat="server" CausesValidation="false" OnClick="BtnRemoveService_Click" Text="Remove" class="btn btn-secondary" />
                    </td>
                    <td  style="width:60% ; vertical-align: top; text-align:left;">
                         <asp:GridView ID="GridViewRmv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="100px" HorizontalAlign="Center" RowHeaderColumn="ID" style="margin-top: 0px" CssClass="rcgv" GridLines="None"  >
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


                        

                    </td>
                </tr>
            </table>
           
            
        </asp:View>





        <asp:View ID="View3Update" runat="server">
            <table style="width:100%">
                <tr>
                    <td style="width:40%; vertical-align: top; text-align:left;">
                        <h3><strong>Update Service Package:</strong></h3>
                       
                       
                        
                        <table>

                             <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server"> Service Package ID:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListSID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ID" OnSelectedIndexChanged="DropDownListSID_SelectedIndexChanged1" class="form-control" >
                        </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server">Event Type:</asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListEvID" runat="server" AutoPostBack="True" class="form-control">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server">Provider:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtProvider" runat="server" class="form-control" placeholder="Provider Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtProvider" Display="Dynamic" SetFocusOnError="true" Text="* Provider of the Service Package is required."></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server">Provided Services:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextDesc" runat="server" TextMode="MultiLine" class="form-control" placeholder="Description"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextDesc" Display="Dynamic" SetFocusOnError="true" Text="* Description required."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextDesc" Display="Dynamic" ErrorMessage="* Please enter valid description without spaces" ValidationExpression="^[a-zA-Z]+[a-zA-Z0-9_-]*(?:,[a-zA-Z]+[a-zA-Z0-9_-]*)*$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server">Price:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextPrice" runat="server" class="form-control" placeholder="Price"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextPrice" Display="Dynamic" SetFocusOnError="true" Text="* Price required."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextPrice" Display="Dynamic" SetFocusOnError="True" Text="* Must be a valid price without $." ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Button ID="BtnUpdt" runat="server" OnClick="BtnUpdt_Click" Text="Update" class="btn btn-secondary" CausesValidation="true"/>
                    </td>


                    <td style="width:60%; vertical-align: top; text-align:left;">
                        <asp:GridView ID="GridViewUpdate" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="100px" HorizontalAlign="Center" RowHeaderColumn="ID" style="margin-top: 0px" CssClass="rcgv" GridLines="None"  >
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
                    </td>
                </tr>
            </table>
        </asp:View>




        <asp:View ID="View4View" runat="server">

            <%--Start of the List View (ServicePackList)--%>
   
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


                        <asp:Label ID="LabelActionStatus" runat="server" CssClass="text-secondary" style="font-family: 'Segoe UI'; "></asp:Label>
                        
                        
                        
                    </asp:Content>
