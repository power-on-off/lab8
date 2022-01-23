
<?php
    //连接数据库的php
    include 'mysql_connect.php';

    //具体查询(使用ID_input进行查询)
    
    
    //功能一：商品情况查询(输入商品号)
    $gid_input = '1';
    $sql = "select gname, degree, pname, ptel, paddr from goods natural join provider where gid = '".$gid_input."';";
    //功能二：个人订单查询(输入会员号)
    $cid_input = '1';
    $sql = "select oid,oaddr,oway,oif_down,otime from orders where cid = '".$cid_input."';";  
    
    //功能三：订单负责人查询(输入订单号)
    $oid_input = '10002';
    $sql = "select oid, s.sid, sname, sex, stel, stime from orders as o,staff as s where o.oid = '".$oid_input."' and s.sid = o.sid; ";  
    
    //功能四：未完成订单查询(输入员工号)
    $sid_input = 's1';
    $sql = "select * from orders where sid = '".$sid_input."' and not oif_down;"; 
    
    //功能五：订单明细查询(输入订单号)
    $oid_input = '10003';
    $sql = "select gid, gname, amount, price, floor from buy natural join goods where oid = '".$oid_input."';"; 
    
    
    
    $result = array();
  
    $mysqli_result = mysqli_query($conn,$sql);
    
    //如果有报错显示
    echo $conn->error;
    // 关联数组
    $row = mysqli_fetch_assoc($mysqli_result);
    $ans_count = 0;
    
    while ($row != null) {
        foreach ($row as $key => $value) {
            //把键/值取出放到result数组的data下
            $result["data"][$ans_count][$key] = $value;
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
