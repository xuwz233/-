<template>
    <div style="text-align: center;margin: auto">
        <!-- <div style="height: 50px">
            <el-button type="primary"
                    @click="" style="float: left">新增</el-button>
        </div> -->

        <el-table :data="riders"
                  style="width:1450px;border-radius: 15px">
            <!--<el-table-column
                    label="头像"
                    prop="picSrc" >
                <template slot-scope="scope">
                    <el-image :src="scope.row.picSrc" style="width: 50px;height: 50px" v-if="scope.row.picSrc!==null"/>
                    <span :src="scope.row.picSrc" style="width: 50px;height: 50px" v-if="scope.row.picSrc===null">暂无</span>
                </template>
            </el-table-column>-->
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
                    prop="number" >
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
                    label="总接单数"
                    prop="totalNum" >
            </el-table-column>
            <el-table-column
                    align="right" >
                <!-- <template slot="header" slot-scope="scope">
                    <el-input
                            v-model="search"
                            size="mini"
                            placeholder="输入关键字搜索"/>
                </template> -->
                <template slot-scope="scope" style="width: 100px">
                    <!-- <el-button
                            size="mini"
                            @click="edit(scope.$index, scope.row)" style="width: 50px;display: inline-block">修改</el-button> -->
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
    export default {
        name: "RiderManager",
        created(){
            this.axios.get("http://localhost:8084/findAllRidersByPage",{
                params:{
                    currentPage:this.currentPage,
                    pageSize:this.pageSize
                }
            }).then(resp=>{
                console.log(resp.data);
                this.riders = resp.data.deliveries;
                this.total = resp.data.count;
            })
        },
        data(){
            return{
                userInfo:'',
                search:'',
                riders:[
                    {
                        id:"",
                        name:'123',
                        phone:'',
                        number:'',
                        totalNum:'',
                        stat:''
                    }
                ],

                pageSize:5,
                total: 0,
                currentPage: 1,
                pageSizes:[1,2,3,4,5,6,7,8,9,10],
            }
        },
        methods:{
            changeStat(did,stat){
                // alert("did: "+did+"stat: "+stat);
                if(stat === 1){
                    this.$confirm("确定要冻结这个骑手吗？",'提示',{
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type:'info'
                    }).then(()=>{
                            this.axios.get("http://localhost:8084/changeRiderStat",{
                                params:{
                                    did:did,
                                    stat:'2'
                                }
                            }).then(resp=>{
                                if(resp.data === "success"){
                                    this.$message({
                                        message:"冻结成功！！！",
                                        type:'success'
                                    });
                                }
                                this.flush();
                            })
                    })
                }else if(stat === 2){
                        this.$confirm("确定要开启这个骑手吗？",'提示',{
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type:'info'
                        }).then(()=>{
                                this.axios.get("http://localhost:8084/changeRiderStat",{
                                    params:{
                                        did:did,
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
            handleSizeChange(val) {
                this.pageSize = val;
                const that = this;
                this.axios.get("http://localhost:8084/findAllUserByPage",{
                    params:{
                        currentPage:this.currentPage,
                        pageSize:this.pageSize
                    }
                }).then(resp=>{
                    console.log(resp.data);
                    this.riders = resp.data.deliveries;
                    this.total = resp.data.count;
                })
            },
            handleCurrentChange(val) {
                this.currentPage = val;
                const that = this;
                this.axios.get("http://localhost:8084/findAllUserByPage",{
                    params:{
                        currentPage:this.currentPage,
                        pageSize:this.pageSize
                    }
                }).then(resp=>{
                    console.log(resp.data);
                    this.riders = resp.data.deliveries;
                    this.total = resp.data.count;
                })
            },
            flush(){
              this.dialogVisible = false;
              this.$router.push({
                  name:"blank",
                  params:{
                      url:"riderManager"
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
