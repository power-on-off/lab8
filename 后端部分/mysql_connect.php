<?php
    //数据库连接部分
    $servername = "42.194.140.67";      //mysql服务器主机地址
    $username = "syw_lab8";             //mysql用户名
    $password = "";     //mysql密码
     
    // 创建连接
    $conn = new mysqli($servername, $username, $password);
    
    $conn->set_charset('utf8');
    
    //使用数据表为syw_lab8	
    $conn->select_db("syw_lab8");
?>
