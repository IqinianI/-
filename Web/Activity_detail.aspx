﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Nav.Master" AutoEventWireup="true" CodeBehind="Activity_detail.aspx.cs" Inherits="Web.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
       <link href="css/comment.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <link href="css/act_detail/Art_detail.css" rel="stylesheet" />--%>
    <link href="css/contest.css" rel="stylesheet" />
    <asp:ListView ID ="LVact_de" runat ="server" >
                <LayoutTemplate > 
                    <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                </LayoutTemplate>
                <ItemTemplate >         
   <article class="post">
	<header>
        <div class="title">
         	<h2 style="font-size:30px;"><a href="#"><%#Eval("act_name") %></a></h2>
          		<p></p>
        </div>
      	<div class="meta">
             <time class="published" style="font-size:12px;"><%#Eval("pub_time") %></time>       		
      	</div>
	</header>
   
    <p style="font-size:20px;"><%#Eval("activity_cont") %></p>
   
      <ul class="actions">
	     <li><asp:linkbutton ID ="lbtnjoin" runat="server" class="button big" OnClick ="lbtnjoin_click">报名参与</asp:linkbutton></li>
      </ul>
       <asp:Panel ID="joinpanel" runat ="server" Visible ="false"  >
           <div class ="jointxtbox">
               用户名：<asp:TextBox ID="txtname" CssClass="form txtbox " runat="server"></asp:TextBox><br />
               联系电话：<asp:TextBox ID ="txtphone" CssClass ="form txtbox " runat ="server" ></asp:TextBox><br />
               <%--<asp:Button ID="btnjoin" runat="server" Text="报名" OnClick="btnjoin_Click" CssClass="form-btn semibold"  />    --%>           
           </div>
       </asp:Panel>
     

  </article>

                </ItemTemplate>
                </asp:ListView>
</asp:Content>