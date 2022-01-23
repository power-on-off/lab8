
<?php
    //连接数据库的php
    include 'mysql_connect.php';

    //具体查询(使用ID_input进行查询)

    $userid = $_GET['userid'];
    $password = $_GET['password'];
   //$password = '123456';
    
    //查询内容
    $sql = "select cid,cname,ctel,cpoints, caddr from customer
            where cid = '".$userid."' and cpwd = left(MD5('".$password."'),20)";
   
   $result = array();
  
    $mysqli_result = mysqli_query($conn,$sql);
    
    //如果有报错显示
    echo $conn->error;
    // 关联数组
    $row = mysqli_fetch_assoc($mysqli_result);
    $ans_count = 0;
    
    if ($row != null) {
        foreach ($row as $key => $value) {
            $ans_count++;
            //把键/值取出放到result数组的data下
            $result["data"][$key] = $value;
        }
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
