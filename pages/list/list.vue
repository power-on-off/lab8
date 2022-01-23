<template>
	<view class="content">
		<view class="login">
			<view class="login-top">订单情况查询</view>
			<view class="login-center clearfix">
				<view class="login-center-img"></view>
				<view class="login-center-input">
					<input type="text" placeholder="请输入订单号" v-model="oid"/>
				</view>
			</view>
			<view class="login-button" @click="submit">查询</view>
		</view>
	</view class="content">

		
</template>

<script>
	export default {
		data() {
			return {
				oid:'',
				boolpay:'',
				boolok:''
			}
		},
		onLoad(res) {
		},
		methods: {
			submit(){
				uni.request({
					url:'http://database.suweb.top/Lab8/3.php',
					method:'GET',
					data: {
						oid:this.oid
					},
					success: res => {
						console.log(res.data);
						if (res.data.code == 200) {
							if (res.data.data.oif_pay == '1')	{
								this.boolpay = '是';
							}	else {
								this.boolpay = '否';
							}
							if (res.data.data.oif_down == '1')	{
								this.boolok = '是';
							}	else {
								this.boolok = '否';
							}
							uni.showModal({
								title: '订单查询结果',
								content:  '您查询的订单id是：'+ this.oid+
								'\r\n是否付款：'+ this.boolpay+
								'\r\n下单时间：'+ res.data.data.otime+
								'\r\n地址：'+ res.data.data.oaddr+
								'\r\n运送方式：'+ res.data.data.oway+
								'\r\n是否完成：'+ this.boolok+
								'\r\n订单负责人：'+ res.data.data.sname+
								'\r\n订单负责人电话：'+ res.data.data.stel
							});
						}
						else {
							uni.showToast({
								title: '没有该订单'
							});
						}
					}
				});
			}
		}
	}
</script>

<style>
* {
	box-sizing: content-box;
}
.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: ' ';
	clear: both;
	height: 0;
}
.cli {
	clear: both;
	font-size: 0;
	height: 0;
	overflow: hidden;
	display: block;
}
.lclear {
	clear: left;
	font-size: 0;
	height: 0;
	overflow: hidden;
}
.fl {
	float: left;
}
.fr {
	float: right;
}
.content {
	display: flex;
	justify-content: center;
	align-items: center;
	overflow-y: hidden;
}
.login {
	width: 350px;
	border-radius: 5px;
	height: 500px;
	background: white;
}
.login-top {
	font-size: 24px;
	margin-top: 100px;
	padding-left: 40px;
	box-sizing: border-box;
	color: #333333;
	margin-bottom: 50px;
}
.login-center {
	width: 100%;
	box-sizing: border-box;
	padding: 0 40px;
	margin-bottom: 30px;
}
.login-center-img {
	width: 40rpx;
	height: 40rpx;
	float: left;
	margin-top: 5px;
}
.login-center-img > image {
	width: 100%;
	height: 100%;
}
.login-center-input {
	float: left;
	width: 230px;
	margin-left: 15px;
	height: 30px;
	position: relative;
}
.login-center-input input {
	z-index: 2;
	transition: all 0.5s;
	padding-left: 10px;
	color: #333333;
	width: 100%;
	height: 30px;
	border: 0;
	border-bottom: 1px solid #cccccc;
	border-top: 1px solid #ffffff;
	border-left: 1px solid #ffffff;
	border-right: 1px solid #ffffff;
	box-sizing: border-box;
	outline: none;
	position: relative;
}
.login-center-input input:focus {
	border: 1px solid dodgerblue;
}
.login-center-input-text {
	background: white;
	padding: 0 5px;
	position: absolute;
	z-index: 0;
	opacity: 0;
	height: 20px;
	top: 50%;
	margin-top: -10px;
	font-size: 14px;
	left: 5px;
	color: dodgerblue;
	line-height: 20px;
}
.login-center-input input:focus ~ .login-center-input-text {
	top: 0;
	z-index: 3;
	opacity: 1;
	margin-top: -15px;
}
.login-button {
	cursor: pointer;
	width: 250px;
	text-align: center;
	height: 40px;
	line-height: 40px;
	background-color: black;
	border-radius: 5px;
	margin: 0 auto;
	margin-top: 50px;
	color: white;
}
</style>
