#!/bin/bash
echo '****************************************************************************'
echo '     run_mysql.sh                                                           '
echo '            by niuren.zhu                                                   '
echo '               2017.08.24                                                   '
echo '  说明：                                                                    '
echo '    1. 尝试运行PGSQL容器。                                                  '
echo '****************************************************************************'
# 设置参数变量
WORK_FOLDER=$PWD
NAME=ibas-db-mysql
PORT=3306
MEM=2g
FOLDER=${WORK_FOLDER}/mysql
PASSWD=1q2w3e

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
  -p ${PORT}:3306 \
  -m ${MEM} \
  -v ${FOLDER}:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=${PASSWD} \
  -d mysql
