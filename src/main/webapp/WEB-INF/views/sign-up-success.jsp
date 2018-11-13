<%--
  Created by IntelliJ IDEA.
  User: wyf
  Date: 13/10/18
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<html>
<script language="javascript">
    var times = 5;

    function TimeClose() {
        window.setTimeout('TimeClose()', 1000);
        time.innerHTML = "Countdown  " + times + "  seconds to home page";
        times--;
    }

</script>
<head>
    <meta http-equiv="Refresh" content="5;url=/home-buyer.htm">
</head>
<body onLoad="TimeClose();">

<div id="time">Countdown 10 seconds to return home page</div>

</body>

</html>
