<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Contact.aspx.cs" Inherits="MyProject.WebForm_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br /><br />
    <div id="contact" class="container-fluid">
      <h2 class="text-center">ROHM CONTACT</h2>
    <%--  <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">--%>
        <div class="row "> 
        <div class="col-sm-6">
           <div class="text-center">
          <h2>Information</h2></div>
            <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
          <p><span class="glyphicon glyphicon-map-marker"></span>101/94,102 Navanakorn Industrial Estate,Moo 20 Phaholyothin Road,
        <p>Tambol Khlong-Nung Amphur Khlong-Luong, Pathumthani 12120   </p>
          <p><span class="glyphicon glyphicon-phone"></span> 0-2909-7100</p>
          <p><span class="glyphicon glyphicon-print"></span> 0-2909-7744</p>
          <p><span class="glyphicon glyphicon-envelope"></span> recruitment@adm.rohmthai.com</p>
        </div></div>
        <div class="col-sm-6"> 
              <%--<a href="Img/map.png" target="_blank">
              <img src="Img/map.png" class="img-thumbnail" width="700" height="100"> --%>
             <a herf="#" id="pop"><img id="imageresource" src="Img/map.png" ></a>
        </div>
      </div>
    </div>
    <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
              <div class="modal-dialog" >
                <div class="modal-content" >

                   <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h3 class="modal-title">Contact</h3></div>

                  <div class="modal-body" align="center" >
                    <img id="imagepreview" style="width: 90%"  >
                  </div>

                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>

                </div>
              </div>
            </div>


    <script type="text/javascript">
        $("#pop").on("click", function () {
            $('#imagepreview').attr('src', $('#imageresource').attr('src'));
            $('#imagemodal').modal('show');
        });

         $("#pop1").on("click", function () {
            $('#imagepreview').attr('src', $('#imageresource1').attr('src'));
            $('#imagemodal').modal('show');
        });
    </script>

</asp:Content>
