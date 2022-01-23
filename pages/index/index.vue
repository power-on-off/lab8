<template>
	<view class="content">
		<view class="login">
			<view class="login-top">顾客登录</view>
			<view class="login-center clearfix">
				<view class="login-center-img"><image src="/static/name.png" /></view>
				<view class="login-center-input">
					<input type="text" placeholder="请输入会员号" v-model="username"/>
				</view>
			</view>
			<view class="login-center clearfix">
				<view class="login-center-img"><image src="/static/password.png" /></view>
				<view class="login-center-input">
					<input type="password" placeholder="请输入密码" v-model="password"/>
				</view>
			</view>
			<view class="login-button" @click="submit">登陆</view>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			username:'',
			password:'',
		};
	},
	onLoad() {
	},
	methods: {
		//登录请求
		submit(){
			uni.request({
				url: 'http://database.suweb.top/Lab8/login.php',
				method: 'GET',
				data: {
					userid:this.username,
					password:this.password
				},
				success: res => {
					console.log(res.data);
					if(res.data.code == 200) {
						uni.showToast({
							title: res.data.data.cname + '登陆成功'
						});
						
						uni.switchTab({
							url:'/pages/my/my'
						});
						uni.$emit('send_data',{cid:res.data.data.cid,cname:res.data.data.cname,ctel:res.data.data.ctel,cpoints:res.data.data.cpoints,caddr:res.data.data.caddr})
					}
					else {
						uni.showToast({
							title: '用户名或密码错误',
							icon:'none'
						});
					}
				},
				fail: () => {},
				complete: () => {}
			});
		}
	}
};
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
	background-color: blue;
	border-radius: 5px;
	margin: 0 auto;
	margin-top: 50px;
	color: white;
}
</style>
