<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传照片</title>
</head>
<body>
<form action="/lostandfound/UploadServlet" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>上传图片</td>
            <td><input type="file" class="file" name="file"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="button" id="button" value="发布">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
