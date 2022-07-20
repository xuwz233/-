<template>
    <div style="text-align: center;margin: auto">
        <!-- <div style="height: 50px">
            <el-button type="primary"
                       @click="" style="float: left">新增</el-button>
        </div> -->

        <el-table :data="shopManagers"
                  style="width:1450px;border-radius: 15px">
            <el-table-column
                    label="用户名"
                    prop="username" style="width: 50px" >
            </el-table-column>
            <el-table-column
                    label="姓名"
                    prop="name" style="width: 50px" >
            </el-table-column>
            <el-table-column
                    label="手机号"
                    prop="phone" >
            </el-table-column>
            <el-table-column
                    label="身份证号"
                    prop="identityNumber" >
            </el-table-column>
            <el-table-column
                    label="状态"
                    prop="stat" >
                <template slot-scope="scope">
                    <span v-if="scope.row.stat===1">正常</span>
                    <span v-if="scope.row.stat===2">冻结</span>
                </template>
            </el-table-column>
            <el-table-column
                    align="right" >
                <template slot-scope="scope" style="width: 100px">
                    <el-button
                            size="mini"
                            @click="edit(scope.row)" style="width: 50px;display: inline-block">修改</el-button>
                    <el-button
                            size="mini"
                            type="danger"
                            @click="changeStat(scope.$index+1, scope.row.stat)" style="width: 50px;display: inline-block" v-if="scope.row.stat===1">冻结</el-button>
                    <el-button
                            size="mini"
                            type="success"
                            @click="changeStat(scope.$index+1, scope.row.stat)" style="width: 50px;display: inline-block" v-if="scope.row.stat===2">开启</el-button>
                </template>
            </el-table-column>
        </el-table>

<!--点击修改后的弹窗-->
        <el-dialog title="店铺管理人员信息" :visible.sync="editDialogVisible" style="line-height: 15px">
            <el-form :model="userInfo" status-icon :rules="userRules" ref="userInfo" style="text-align: left">
                <el-form-item label="用户名" :label-width="formLabelWidth" prop="username">
                    <el-input v-model="userInfo.username" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
                    <el-input v-model="userInfo.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="手机号" :label-width="formLabelWidth" prop="phone">
                    <el-input v-model="userInfo.phone" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="身份证号" :label-width="formLabelWidth" prop="number">
                    <el-input v-model="userInfo.identityNumber" autocomplete="off"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="flush">取 消</el-button>
                <el-button type="primary" @click="save">保 存</el-button>
            </span>
        </el-dialog>

        <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="currentPage"
                :page-sizes="pageSizes"
                :page-size="pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total">
        </el-pagination>
    </div>
</template>

<script>
import { urlToHttpOptions } from 'url';

    export default {
        name: "ShopManagerManager",
        created(){
            this.axios.get("http://localhost:8084/findAllShopManagerByPage",{
                params:{
                    currentPage:this.currentPage,
                    pageSize:this.pageSize
                }
            }).then(resp=>{
                console.log(resp.data);
                this.shopManagers = resp.data.shopManagers;
                this.total = resp.data.count;
            })
        },
        data(){
            const validatename = (rule, value, callback) => {
                if (value === ''||value==null) {
                        callback(new Error("请输入姓名"))
                }else {
                        callback();
                }
                
            };
            return{
                // userInfo:'',
                id:'',
                formLabelWidth:'120px',

                // userInfo:'',
                userInfo:{
                    smid:'',
                    username:'',
                    name:'',
                    phone:'',
                    identityNumber:'',
                },
                userRules: {
                            name: [
                                {validator: validatename, trigger: 'blur'}
                            ],

                        },
                search:'',
                shopManagers:[
                    {
                        id:"",
                        username:'123',
                        phone:'',
                        name:'',
                        identityNumber:'',
                        stat:''
                    }
                ],

                editDisabled:true,
                editDialogVisible:false,

                pageSize:5,
                total: 0,
                currentPage: 1,
                pageSizes:[1,2,3,4,5,6,7,8,9,10],
            }
        },
        methods:{
            /*改变店铺状态*/
            changeStat(smid,stat){
                if(stat === 1){
                    this.$confirm("确定要冻结这个店铺管理人员账号吗？",'提示',{
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type:'info'
                    }).then(()=>{
                            this.axios.get("http://localhost:8084/changeShopManageStat",{
                                params:{
                                    smid:smid,
                                    stat:'2'
                                }
                            }).then(resp=>{
                                if(resp.data === "success"){
                                    this.$message({
                                        message:"冻结成功！！！",
                                        type:'success'
                                    });
                                // alert(this);
                                }
                                this.flush();
                                // this.$router.push("/riderManager");
                            })
                    })
                }else if(stat === 2){
                        this.$confirm("确定要开启这个店铺管理人员账号吗？",'提示',{
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type:'info'
                        }).then(()=>{
                                this.axios.get("http://localhost:8084/changeShopManageStat",{
                                    params:{
                                        smid:smid,
                                        stat:'1'
                                    }
                                }).then(resp=>{
                                    if(resp.data === "success"){
                                        this.$message({
                                            message:"开启成功！！！",
                                            type:'success'
                                        });
                                    }
                                    // alert("开启成功！");
                                    this.flush();
                                    // this.$router.push("/riderManager");
                                })
                        })
                    }
                    // this.flush();
                },
            edit(item){
                        // alert("进入修改了！");
                        console.log(item);
                        // alert(item.smid);
                        this.editDialogVisible = true;
                        this.userInfo.name = item.name;
                        this.userInfo.smid = item.smid;
                        this.userInfo.phone = item.phone;
                        this.userInfo.identityNumber = item.identityNumber;
                        this.userInfo.username=item.username;
            },
             /*保存修改*/
            save()
            {
                console.log(this.userInfo);
                this.$refs['userInfo'].validate((valid) => {
                    // alert("进入保存了");
                    if (valid) {
                        this.$confirm("确定要保存修改吗？", '提示', {
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type: 'info'
                        }).then(() => {
                            console.log(this.userInfo);
                            this.axios.post("http://localhost:8084/updateShopManagerMessage", this.userInfo).then(resp => {
                                // alert("进入update了")
                                if (resp.data === "success") {
                                    this.$message({
                                        message: "保存成功！！！",
                                        type: 'success'
                                    });
                                    this.flush();
                                } else {
                                    this.$message({
                                        message: "保存失败！！！",
                                        type: 'warning'
                                    });
                                    this.flush();
                                }
                            })
                        }).catch(() => {
                            this.$message({
                                type: 'info',
                                message: '已取消'
                            });
                        })
                    } else {
                        return false;
                    }
                })
            }
        ,
            handleSizeChange(val) {
                this.pageSize = val;
                const that = this;
                this.axios.get("http://localhost:8084/findAllShopManagerByPage",{
                    params:{
                        currentPage:this.currentPage,
                        pageSize:this.pageSize
                    }
                }).then(resp=>{
                    console.log(resp.data);
                    this.shopManagers = resp.data.shopManagers;
                    this.total = resp.data.count;
                })
            },
            handleCurrentChange(val) {
                this.currentPage = val;
                const that = this;
                this.axios.get("http://localhost:8084/findAllShopManagerByPage",{
                    params:{
                        currentPage:this.currentPage,
                        pageSize:this.pageSize
                    }
                }).then(resp=>{
                    console.log(resp.data);
                    this.shopManagers = resp.data.shopManagers;
                    this.total = resp.data.count;
                })
            },
            flush(){
              this.dialogVisible = false;
              this.$router.push({
                  name:"blank",
                  params:{
                      url:"shopManagerManager"
                  }
              })
            },
        }
    }
</script>

<style scoped>
    .el-table{
        line-height: 50px;
        margin: auto;
    }
</style>
