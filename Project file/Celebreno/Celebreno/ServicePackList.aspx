<%@ Page Title="Our Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServicePackList.aspx.cs" Inherits="Celebreno.ServicePackList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />

        <section>
        <div>

            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>
            
          
        <!--This is the Viewlist where EventTypes are shown (the Data Binding Technique) to link the data control to the DB -->
        <div id="EventTypeMenu" style="text-align: center">       
            <asp:ListView ID="EventTypeList"  
                ItemType="Celebreno.Models.EventType" 
                runat="server"
                SelectMethod="GetEventTypes" >

                <ItemTemplate>
                    <b style="font-size: large; font-style: normal">
                    <a  href="<%#: GetRouteUrl("ServicePacksByEventTypeRoute", new {eventtypeName = Item.EventTypeName}) %>">
                        <%#: Item.EventTypeName %>
                        
                    </a>
                    </b>

                    
                </ItemTemplate>

                <ItemSeparatorTemplate>  |  </ItemSeparatorTemplate>
            </asp:ListView>
        </div>

            <div class="alignneed" style="font-weight: bold; font-size: large; position:center; text-align:center">
                <a runat="server" href="http://localhost:44371/ServicePackList" style="text-decoration: none;  "> All Categories </a>
            </div>
           
            <br />

     <%--Start of the List View (ServicePackList)--%>
        
    <asp:ListView ID="SPList" runat="server" 
                DataKeyNames="ID" GroupItemCount="4"
                ItemType="Celebreno.Models.ServicePack" SelectMethod="GetServicePacks" >
        <%--1--%>       
        <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
        <%--2--%>    
                <EmptyItemTemplate>
                    <td/>
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
                        <div  id="CartVisibility" runat="server" style="float: left; margin-left: 10px; text-align:center " >
                        <table>
                            <tr>
                                <td>

                                    <a href="<%#: GetRouteUrl("ServicePackByProviderRoute", new {servicepackProvider = Item.Provider}) %>">
                                        <image  src='/Images/calendar.png'  width="100" height="75" style="border:none" />
                                    </a>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="<%#: GetRouteUrl("ServicePackByProviderRoute", new {servicepackProvider = Item.Provider}) %>">
                                        <span>
                                            <%#:Item.Provider%>
                                        </span>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <br />

                                    
                                    <a id="Test" href="/CartAdd.aspx?ID=<%#:Item.ID %>">
                                        <span class="ProductListItem">
                                            <span>
                                               
                                            <b>Add To Cart<b>
                                            </span>
                                        </span>
                                    </a>

                                    

                                    <br />
                        
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                            </div>
                        </p>
                    </td>
                </ItemTemplate>
        <%--5 (with table)--%>    
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                        
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>

            </asp:ListView>
     <%--End of the List View (ServicePackList)--%>

        </div>
    </section>


</asp:Content>
