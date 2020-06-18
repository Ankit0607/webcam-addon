<%@ Page Language="C#" %>

<%
    try
    {
        String strImageName;
        HttpFileCollection files = HttpContext.Current.Request.Files;
        HttpPostedFile uploadfile = files["RemoteFile"];
        strImageName = uploadfile.FileName;

        bool exists = System.IO.Directory.Exists(Server.MapPath("upload"));

        if(!exists)
            System.IO.Directory.CreateDirectory(Server.MapPath("upload"));
            
        String barcodeFile = System.IO.Path.Combine(Server.MapPath("."), "upload", strImageName);

        uploadfile.SaveAs(barcodeFile);

    }
    catch
    {
    }
%>