#!/bin/bash
echo '****************************************************************************'
echo '     run_mssql.sh                                                           '
echo '            by niuren.zhu                                                   '
echo '               2017.08.24                                                   '
echo '  说明：                                                                    '
echo '    1. 尝试运行MSSQL容器。                                                  '
echo '****************************************************************************'
# 设置参数变量
WORK_FOLDER=$PWD
NAME=ibas-db-mssql
PORT=1433
MEM=4g
FOLDER=${WORK_FOLDER}/mssql
PASSWD=Aa123456

# 检查环境
if [ ! -e "${FOLDER}" ];then mkdir -p "${FOLDER}"; fi;
# 显示容器信息
echo --容器名称：${NAME}
echo --映射端口：${PORT}
echo --限制内存：${MEM}
echo --数据目录：${FOLDER}
echo --用户密码：${PASSWD}

docker start ${NAME} \
|| \
docker run \
   --name ${NAME} \
   -m ${MEM} \
   -p ${PORT}:1433 \
   -v ${FOLDER}:/var/opt/mssql \
   -e ACCEPT_EULA=Y \
   -e MSSQL_SA_PASSWORD=${PASSWD} \
   -e MSSQL_PID=Developer \
   -d microsoft/mssql-server-linux
