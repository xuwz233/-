<template>
    <div>
        <el-header height="80px">
            <van-image  width="180" height="180" src="/upload/99.png" style="left:-10px;top:-50px;position: absolute;">
            
            </van-image>
            <span></span>
            <el-button type="primary" icon="el-icon-user"  style="float: right;margin: 20px auto" @click="toLogin">
                <span>前往登录</span>
            </el-button>

        </el-header>
        <el-carousel :interval="4000" type="card" height="500px" style="margin-top: 100px ;">
            <el-carousel-item v-for="item in images" :key="item">
                <el-image :src="item" style="width: 400px;height: 300px;margin-left: 200px ;"></el-image>
            </el-carousel-item>
        </el-carousel>
        <div class="footer" style="position:absolute; left:600px;">
            ©版权所有 彩虹工作室
            <span class="padding-5"></span>           
            <a target="_blank" href=" ">鄂ICP备16006642号-2</a>
</div>
    </div>
    
</template>

<script>
    export default {
        name: "Index",
        data(){
            return{
                images:[
                    '/upload/p1.png',
                    '/upload/p2.png',
                    '/upload/p3.png',


                ],
                url:'../../public/upload/p1.png'
            }
        },
        methods:{
            toLogin(){
                this.$router.push("/login")
            }
        }
    }
</script>

<style scoped>
.bck{
    background:url(../../public/upload/p1.png) no-repeat center;
    width:100%;
    height:800px;
}

.el-header {
    background-color: #0e95e5;
    color: #333;
    text-align: center;
    line-height: 60px;
}

</style>
