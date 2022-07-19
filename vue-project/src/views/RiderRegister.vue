<template>
    <el-container>
        <el-header height="40px">
            <el-page-header @back="goBack" content="用户注册"></el-page-header>
        </el-header>
        <el-main>
            <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="用户名" prop="username">
                    <el-input type="text" v-model="ruleForm.username" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="pass">
                    <el-input type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="确认密码" prop="checkPass">
                    <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="姓名" prop="name">
                    <el-input type="text" v-model="ruleForm.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="手机号" prop="phone">
                    <el-input type="text" v-model="ruleForm.phone" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="年龄" prop="age">
                    <el-input type="number" v-model.number="ruleForm.age"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')">注册</el-button>
                    <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
            </el-form>
        </el-main>
        <el-footer></el-footer>
    </el-container>

</template>
<style>
    .el-form{
        width: 500px;
        height: 200px;
        margin: 20px auto;
    }

    .el-container{
        height: 680px;
    }
    .el-main {
        background-color: #E9EEF3;
        color: #333;
        text-align: center;
        line-height: 160px;

    }

    .el-header {
        background-color: #409EFF;
        color: #333;
        text-align: center;
    }

    .el-footer{
        background-color: #B3C0D1;
        color: #333;
    }
</style>
<script>
    export default {
        name: "RiderRegister",
        data() {
            const validateUsername = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入用户名'));
                } else {
                    callback();
                }
            };


            const validatePass = (rule, value, callback) => {
                if (value === ''||value === ' ') {
                    callback(new Error('请输入密码'));
                } 
                else if(value.length<6)
                { 
                    callback(new Error('密码位数必须大于6位'))
                }
                else if(value.length>20)
                { 
                    callback(new Error('密码最长不超过20位'))
                }
                //密码复杂度
                else if(this.passwordcomplex(value)<5)
                {
                     callback(new Error('密码过于简单'))
                }
                else//输入密码不为空
                 {
                    if (this.userForm.checkPass !== '') {
                        this.$refs.userForm.validateField('checkPass');
                    }
                    callback();
                }
            };

            const validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.ruleForm.pass) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };

            const validateName = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入姓名'));
                } else {
                    callback();
                }
            };

            const validatePhone = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入手机号'));
                } else {
                    setTimeout(()=> {
                        if(value === '123'){
                            callback(new Error('该手机号已注册！！'))
                        }else {
                            callback();
                        }
                    },1000)

                }
            };

            const checkAge = (rule, value, callback) => {
                if (!value) {
                    return callback(new Error('年龄不能为空'));
                }
                setTimeout(() => {
                    if (!Number.isInteger(value)) {
                        callback(new Error('请输入数字值'));
                    } else {
                        if (value < 18) {
                            callback(new Error('必须年满18岁'));
                        } else {
                            callback();
                        }
                    }
                }, 500);
            };

            return {
                ruleForm: {
                    username:'',
                    pass: '',
                    checkPass: '',
                    name:'',
                    phone:'',
                    age: ''
                },
                rules: {
                    username: [
                        { validator:validateUsername,trigger: 'blur'}
                    ],
                    pass: [
                        { validator: validatePass, trigger: 'blur' }
                    ],
                    checkPass: [
                        { validator: validatePass2, trigger: 'blur' }
                    ],
                    name: [
                        { validator:validateName,trigger: 'blur'}
                    ],
                    phone: [
                        { validator:validatePhone,trigger: 'blur'}
                    ],
                    age: [
                        { validator: checkAge, trigger: 'blur' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const that = this;
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        if(confirm("确认信息无误吗？")){
                            const username = that.ruleForm.username;
                            const password = that.ruleForm.pass;
                            const name = that.ruleForm.name;
                            const phone = that.ruleForm.phone;
                            const age = that.ruleForm.age;
                            /*console.log(username+","+password+"")*/
                            this.$message({
                                message: '注册成功！！！',
                                type: 'success'
                            });
                            this.$router.push("/")
                        }else {
                            return false;
                        }

                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            //密码强度判断函数
           //密码强度判断函数
            passwordcomplex(password)
            {
                let passwordscore = 0;
                let pwdArr = password.split('');;
                console.log(pwdArr);
                // pwdLen长度
                if(pwdArr.length>6&&pwdArr.length<=8){  //长度在4-7之间，加五分
                    passwordscore += 6
                }else if(pwdArr.length>8){  //长度在8以上，加10分
                passwordscore += 8
                }

                //是否连续
                let isContinued = false;
                let countinuedCount = 0;
                for(let i =0;i<pwdArr.length;i++)
                {
                    if(pwdArr[i+1])
                    {
                        if((pwdArr[i].charCodeAt(0)+1==pwdArr[i+1].charCodeAt(0))||(pwdArr[i].charCodeAt(0)-1==pwdArr[i+1].charCodeAt(0)))
                        {  //如果相邻两个字符连续
                            isContinued = true;  //开始记录连续
                            countinuedCount++    //记录连续次数
                        }
                        else
                        {
                            if(isContinued)
                            {
                                isContinued = false;
                                passwordscore -= countinuedCount   //结束当前连续时，分数扣掉连续次数
                                countinuedCount = 0
                            }
                        }
                    }
                }
                console.log(isContinued,countinuedCount);
                if(countinuedCount == pwdArr.length-1)
                {
                    passwordscore = 0   //如果整个密码连续，分数为0
                }
                else
                {
                    passwordscore -= countinuedCount
                }
                 //如果整个密码由单一字符构成，分数为0
                for(let i = 0;i<pwdArr.length;i++){ 
                    if(i ==pwdArr.length-1){
                        passwordscore = 0
                }else if(pwdArr[i]!=pwdArr[i+1]){
                    break
                }
                }

                return passwordscore;
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            goBack() {
                this.$router.push("/registerType")
            }
        }
    }
</script>

<style scoped>

</style>
