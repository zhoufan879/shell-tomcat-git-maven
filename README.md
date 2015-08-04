# shell-tomcat-git-maven
使用Shell 脚本，部署Tomcat 

参考资料：
http://blog.csdn.net/ygh_0912/article/details/11081219 
http://www.chenjianjx.com/myblog/entry/%E9%80%9A%E8%BF%87shell%E8%84%9A%E6%9C%AC%E5%9C%A8%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8A%E4%B8%80%E9%94%AE%E6%9E%84%E5%BB%BAjava%E5%BA%94%E7%94%A8%E5%B9%B6%E9%87%8D%E6%96%B0%E9%83%A8%E7%BD%B2


#大致步骤：
0. 手工初始化项目 <git init / git clone>

1. 更新代码  <git pull *>
2. 打包      <mvn clean install>
3. 杀掉Tomcat 进程  <kill -9 #PID#>
4. 备份旧war包      <backup old-war (mv) >
5. 部署新war包      <deploy new-war (cp) >
6. 启动Tomcat       <./bin/startup.sh>

