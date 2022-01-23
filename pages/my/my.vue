<template>
	<view>
		<br><text class="flex flex-direction"> 欢迎{{this.cname}}登录！ </text><br/>
		<br><text class="flex flex-direction"> 您的会员号是：{{this.cid}} </text><br/>
		<br><text class="flex flex-direction"> 您的名字是: {{this.cname}} </text><br/>
		<br><text class="flex flex-direction"> 您的会员号是：{{this.ctel}} </text><br/>
		<br><text class="flex flex-direction"> 您的积分是：{{this.cpoints}} </text><br/>
		<br><text class="flex flex-direction"> 您的通信地址是：{{this.caddr}} </text>	<br/>	
	</view>
</template>

<script>
	export default {
		data() {
			return {
				cid:'',
				cname:'',
				ctel:'',
				cpoints:'',
				caddr:''
			}
		},
		onLoad(res) {
			uni.$on('send_data',(my_message)=>{
				//console.log(my_message);
				this.cid = my_message.cid;
				this.cname = my_message.cname;
				this.ctel = my_message.ctel;
				this.cpoints = my_message.cpoints;
				this.caddr = my_message.caddr;
			})
		},
		methods: {
			
		}
	}
</script>

<style>

</style>
