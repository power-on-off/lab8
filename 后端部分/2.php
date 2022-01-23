<?php
    //连接数据库的php
    include 'mysql_connect.php';
    
    //功能二：个人订单查询(输入会员号)
    $cid_input = $_GET['cid'];
    $sql = "select oid,oaddr,oway,oif_down,otime from orders where cid = '".$cid_input."';";  
    
    $result = array();
  
    $mysqli_result = mysqli_query($conn,$sql);
    
    //如果有报错显示
    echo $conn->error;
    // 关联数组
    $row = mysqli_fetch_assoc($mysqli_result);
    $ans_count = 0;
    $data_key = "data";
    
    while ($row != null) {
        $data_key = "data".$ans_count;
        foreach ($row as $key => $value) {
            //把键/值取出放到result数组的data下
            $result[$data_key][$key] = $value;
        }
        $ans_count++;
        $row = mysqli_fetch_assoc($mysqli_result);
    }

    // 释放结果集
    mysqli_free_result($mysqli_result);
    //关闭数据库
    mysqli_close($conn);
    
    
    if ($ans_count > 0) {
        $result["code"] = 200;
    }   else {
        $result["code"] = 400;
    }
    echo json_encode($result,JSON_UNESCAPED_UNICODE);
?>
