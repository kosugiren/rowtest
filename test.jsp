<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>    
    <table border="1">
        <thead>
            <tr>
                <th>Label</th>
                <th>Value</th>
            </tr>
        </thead>
        <tbody>
            <%            
         	String[][] dataArray = (String[][])request.getAttribute("dataList");
            int rowspan_cnt = 1;
            for (int i = 0; i < dataArray.length; i++) {
            	//System.out.println("+++" + i);
	            %>
	            <tr>
	            <%
	            // rowspanを設定する場合
	            // 初回または判定カラムがブレイク時
	            if (i == 0 || (i > 0 && !dataArray[i][0].equals(dataArray[i-1][0]))) {
					// カラム値同一行数カウント	            	
	    			for (int j = i + 1; j < dataArray.length
	    					&& dataArray[j][0].equals(dataArray[j-1][0]); j++) {
    					rowspan_cnt++;
	   				}  // END ループ j
	            %>
	            	<td rowspan="<%= rowspan_cnt%>"><%= dataArray[i][0] %></td>
	            <%
	                rowspan_cnt = 1;
	            }
	            %>
	            <!-- 常に出力するカラム -->
	            <td><%= dataArray[i][1] %></td>
	            </tr>
         <% } %> <!-- END ループ i -->
        </tbody>
    </table>    
    
    <hr>
    <table border="1">
        <thead>
            <tr>
                <th>Label</th>
                <th>Value</th>
            </tr>
        </thead>
        <tbody>
            <% 
               dataArray = (String[][])request.getAttribute("dataList");
               for (String[] item : dataArray) {
            %>
                   <tr>
                       <td><%= item[0] %></td>
                       <td><%= item[1] %></td>
                   </tr>
            <% } %>
        </tbody>
    </table>
    

</body>
</html>