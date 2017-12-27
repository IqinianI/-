<%@ Page Title="" Language="C#" MasterPageFile="~/Nav.Master" AutoEventWireup="true" CodeBehind="pub_discussion.aspx.cs" Inherits="Web.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="utf8-net/ueditor.config.js"></script>
    <script type="text/javascript" src="utf8-net/ueditor.all.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-net/lang/zh-cn/zh-cn.js"></script>
    <style>
        #main{
           width:65%;
           margin-left:17%;
        }
        .nav-top{
            background-color:#354b5e;
            color:white;
            font-size:26px;
        }
        .table{
            width:100%;
            /*border:1px solid;*/
            margin-top:10px;
        }
        .c1 {
            height:40px;
            border:1px solid;
        }
        .c2{
            height:500px;
            border:1px solid;
        }
        .c3{
            height:130px;
            border:1px solid;
        }
        .r1{
            width:20%;
            /*height:40px;*/
            float:left;
            border-right:1px solid;
            text-align:center;
            line-height:40px;
            font-size:20px;
        }
        .r2{
            width:80%;
            /*height:30px;*/
            float:left;
            padding-left:5px;
            border-bottom:none;
        }
        .r3{
            width:20%;
            height:500px;
            float:left;
            border-right:1px solid;
            text-align:center;
            font-size:20px;
        }
        .r4{
            width:80%;
            height:500px;
            float:left;
        }
        .r5{
            width:20%;
            height:130px;
            float:left;
            border-right:1px solid;
            text-align:center;
            font-size:20px;

        }
        .r6{
             width:80%;
            height:130px;
            float:left;
            padding-left:5px;
            padding-top:5px;
        }

        .text{
            width:95%;
            margin:auto 0;
            margin-top:5px;
            margin-left:5px;
        }
       .texttitle{
          height: 30px;
          max-height: 120px;
          width: 60%;
          margin:3px 0 0 5px;
       }
    </style>
    <script>
        function setShowLength(obj, maxlength, id) {
            var rem = maxlength - obj.value.length;
            var wid = id;
            if (rem < 0) {
                rem = 0;
            }
            document.getElementById(wid).innerHTML = "还可以输入" + rem + "字数";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="main">
    <div class="nav-top"><span>发帖</span></div>
    <div class="table">
        <div class="c1 clearfix">
            <div class="r1">帖子标题</div>
            <div class="r2">
                <%--<asp:TextBox ID="Txttitle" runat="server" CssClass="texttitle"></asp:TextBox></div>--%>
               <input name="title" runat="server" type="text" id="title" size="50" value="" maxlength="15" onkeyup="javascript:setShowLength(this, 15, 'cost_tpl_title_length');" class="texttitle"/>
                <span class="red" id="cost_tpl_title_length">还可以输入15字数</span> 
        </div>
            </div>
        <div class="c2 clearfix ">
            <div class="r3">帖子内容</div>
            <div class="r4">
               <div id="div1" class="text">
                 <%-- <textarea id="text1" style="width:100%; height:300px;" class="form textarea" runat="server"></textarea>--%>
                   <textarea id="myEditor" name="myEditor" runat="server" onblur="setUeditor()" style="width:100%; height:300px;
                    "></textarea>
               </div>
              
             </div>
            </div>
        <div class="c3 clearfix">
            <div class="r5"></div>
            <div class="r6"><asp:Button ID="Button1" runat="server" Text="发帖" CssClass="btn btn-primary" OnClick="Button1_Click1"/>
                           
                <div>
                       <h6>1、这里发言，表示您接受了YuanQi网的用户行为准则。</h6>
                       <h6>2、请对您的言行负责，并遵守中华人民共和国有关法律法规,尊重网上道德。</h6>
                       <h6>3、如是商业用途请联系原作者</h6>
                </div>
            </div>
        </div>
  
    </div>
   
   <%-- <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="Editor/wangEditor.min.js"></script>--%>
   <%-- <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#div1')
        var $text1 = $('#text1')

        editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
        editor.customConfig.onchange = function (text) {
            // 监控变化，同步更新到 textarea
            $text1.val(text)
        }
        editor.create()
        // 初始化 textarea 的值
        $text1.val(editor.txt.text())
    </script>--%>
           <script id="myEditors" type="text/plain"></script>                
                <%-- 上面这个style这里是实例化的时候给实例化的这个容器设置宽和高，不设置的话，或默认为auto可能会造成部分显示的情况--%>
                <script type="text/javascript">
                    var editor = new baidu.editor.ui.Editor();
                
                    editor.render("<%=myEditor.ClientID%>");
                </script>
        <script type="text/javascript">
        function setUeditor() {
            var myEditor = document.getElementById("myEditor");
            myEditor.value = editor.getContent();//把得到的值给textarea
        }
        </script>

</div>
</asp:Content>
