# Survey--

这里只有一部分 详细内容请看
SSM 调查问卷-项目笔记.pdf


腾讯课堂调查问卷系统
# 调查问卷系统

项目预览

**优势：**

- 项目搭建配置比较详细，很适合ssm入门同学
- Jquery使用较多，提高Jquery技术水平，提供前端技能。
- 在面试过程中，你可以将该项目作为一个自己开发的模块去讲给面试官。

## 1.项目技术

- 数据库：MySQL8.0
- 数据库设计软件：Power Designer16.5
- IDE：IDEA
- Web容器：Apache Tomcat 8.5
- 项目管理工具：Maven
- 后端技术：Spring+Spring MVC+MyBatis（SSM框架）
- 前端技术：**LayUI**（Vue/React）

## 2.项目需求

- 问卷星
- 调查派
- 腾讯问卷

### 2.1系统角色

- 管理员：zhangsan、lisi（Admin表）
  - 管理员信息CURD
  - 制作调查问卷
  - 发布调查问卷
  - 统计调查结果
  - 图表展示

- 访客：（无需登录）
  - 参与调查

## 3.数据库设计

![image-20210415155151733](C:\Users\18341\AppData\Roaming\Typora\typora-user-images\image-20210415155151733.png)

```sql
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : survey

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 22/06/2020 10:40:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2081 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (2073, 'admin', '433db2fa87c8e880868dcf6ae9c2fca2', 'xx', '18533333333', '');
INSERT INTO `tb_admin` VALUES (2077, 'xx', '433db2fa87c8e880868dcf6ae9c2fca2', 'xxx', '18555555555', 'xxxx');
INSERT INTO `tb_admin` VALUES (2079, 'asdfasdf', '433db2fa87c8e880868dcf6ae9c2fca2', 'asdfasdfasdf', '18533333333', '');
INSERT INTO `tb_admin` VALUES (2080, '111111111111111111111111111', '433db2fa87c8e880868dcf6ae9c2fca2', '111111111111111111111', '18533333333', '');

-- ----------------------------
-- Table structure for tb_answer_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_opt`;
CREATE TABLE `tb_answer_opt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `opt_id` int(11) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1radio|2checkbox',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `voter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_2`(`opt_id`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`opt_id`) REFERENCES `tb_question_opt` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_answer_opt
-- ----------------------------
INSERT INTO `tb_answer_opt` VALUES (23, 19, 33, 96, '1', '2020-06-16 09:39:38', 'ef539923-716d-4735-a286-81167a1f4e63');
INSERT INTO `tb_answer_opt` VALUES (24, 19, 34, 100, '2', '2020-06-16 09:39:38', 'ef539923-716d-4735-a286-81167a1f4e63');
INSERT INTO `tb_answer_opt` VALUES (25, 19, 33, 97, '1', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (26, 19, 34, 100, '2', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (27, 19, 34, 102, '2', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (28, 19, 33, 98, '1', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_opt` VALUES (29, 19, 34, 103, '2', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_opt` VALUES (30, 19, 33, 97, '1', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (31, 19, 34, 101, '2', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (32, 19, 34, 103, '2', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');

-- ----------------------------
-- Table structure for tb_answer_txt
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_txt`;
CREATE TABLE `tb_answer_txt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `voter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_answer_txt
-- ----------------------------
INSERT INTO `tb_answer_txt` VALUES (9, 19, 38, '111', '2020-06-16 09:39:38', NULL);
INSERT INTO `tb_answer_txt` VALUES (10, 19, 38, '11222', '2020-06-16 09:39:45', NULL);
INSERT INTO `tb_answer_txt` VALUES (11, 19, 38, '阿斯顿发斯蒂芬', '2020-06-16 09:41:59', NULL);
INSERT INTO `tb_answer_txt` VALUES (12, 19, 38, '啊啊啊', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_txt` VALUES (13, 19, 38, '啊啊啊', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '1radio|2checkbox|3text|4textarea',
  `required` int(1) NULL DEFAULT NULL COMMENT '0非必填1必填',
  `check_style` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'text;number;date',
  `order_style` int(1) NULL DEFAULT NULL COMMENT '0顺序1随机',
  `show_style` int(1) NULL DEFAULT NULL COMMENT '1;2;3;4',
  `test` int(1) NULL DEFAULT NULL COMMENT '0不测评1测评',
  `score` int(3) NULL DEFAULT NULL,
  `orderby` int(11) NULL DEFAULT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `survey_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`survey_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`survey_id`) REFERENCES `tb_survey` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (27, '标题', '描述', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-13 10:22:00', 18);
INSERT INTO `tb_question` VALUES (28, '标题', '描述', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 13:42:43', 18);
INSERT INTO `tb_question` VALUES (29, '标题', '描述', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-15 13:42:45', 18);
INSERT INTO `tb_question` VALUES (30, '标题', '描述', 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-15 13:42:46', 18);
INSERT INTO `tb_question` VALUES (31, '标题', '描述', 2, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 13:43:15', 18);
INSERT INTO `tb_question` VALUES (32, '标题adsfgasdfgasdsfgsadfgsdfg', '', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 13:46:03', 18);
INSERT INTO `tb_question` VALUES (33, '你未来的职业规划是什么吗？', '', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 15:20:59', 19);
INSERT INTO `tb_question` VALUES (34, '你期望的薪水', '', 2, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 15:21:25', 19);
INSERT INTO `tb_question` VALUES (38, '标题', '描述', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-16 09:14:05', 19);
INSERT INTO `tb_question` VALUES (40, '标题', '描述', 2, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-16 10:55:44', 19);

-- ----------------------------
-- Table structure for tb_question_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_question_opt`;
CREATE TABLE `tb_question_opt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1radio|2checkbox',
  `opt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderby` int(11) NULL DEFAULT NULL,
  `answer` int(1) NULL DEFAULT NULL COMMENT '默认为NULL；1答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_question_opt
-- ----------------------------
INSERT INTO `tb_question_opt` VALUES (80, 18, 28, '1', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (81, 18, 28, '1', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (82, 18, 28, '1', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (83, 18, 28, '1', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (84, 18, 31, '2', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (85, 18, 31, '2', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (86, 18, 31, '2', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (87, 18, 31, '2', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (88, 18, 32, '1', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (89, 18, 32, '1', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (90, 18, 32, '1', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (91, 18, 32, '1', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (92, 18, 27, '1', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (93, 18, 27, '1', '选项12qasdfasdf', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (94, 18, 27, '1', '选项asdfasdf', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (95, 18, 27, '1', '选项fffffffasddddddddddddddddddddddddddddddddddddd', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (96, 19, 33, '1', 'Java软件工程师', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (97, 19, 33, '1', '前端工程师', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (98, 19, 33, '1', 'Python工程师', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (99, 19, 33, '1', '大数据工程师', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (100, 19, 34, '2', '5000', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (101, 19, 34, '2', '8000', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (102, 19, 34, '2', '10000', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (103, 19, 34, '2', '15000', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (116, 19, 40, '2', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (117, 19, 40, '2', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (118, 19, 40, '2', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (119, 19, 40, '2', '选项', 4, NULL);

-- ----------------------------
-- Table structure for tb_survey
-- ----------------------------
DROP TABLE IF EXISTS `tb_survey`;
CREATE TABLE `tb_survey`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bounds` int(1) NULL DEFAULT NULL COMMENT '0:不限制;1:限制',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `rules` int(1) NULL DEFAULT NULL COMMENT '0公开;1密码',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建、执行中、结束',
  `logo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bgimg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `anon` int(1) NULL DEFAULT NULL COMMENT '0匿名；1不匿名',
  `creator` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_survey
-- ----------------------------
INSERT INTO `tb_survey` VALUES (18, '我的第一份问卷调查', '我的第一份问卷调查我的第一份问卷调查我的第一份问卷调查我的第一份问卷调查', 0, '2020-06-12 20:00:00', '2020-06-14 00:00:00', 0, '', '', '结束', NULL, '790f8992311349dda939ab97b11ecfae_timg.jpg', 0, 2073, '2020-06-12 17:03:51');
INSERT INTO `tb_survey` VALUES (19, '职业规划测试', '职业规划测试职业规划测试职业规划测试职业规划测试职业规划测试', 0, '2020-06-15 00:00:00', '2020-06-17 00:00:00', 0, '', 'http://localhost:8080/survey/dy/4e0bd53b-91fa-41b4-a061-0964da735015', '执行中', NULL, '76c973d99eed4ffb90edf806bc5470f4_timg.jpg', 0, 2073, '2020-06-15 15:20:15');

SET FOREIGN_KEY_CHECKS = 1;

```

​                    

## 4.搭建项目

### 4.1Maven搭建项目

1 创建maven-archtype-webapp的项目

2配置maven路径

![image-20210325164202221](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20210325164202221.png)

3 提示build success构建成功

![image-20210325164340310](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20210325164340310.png)

4 删除多余插件

5  创建 java和resources文件夹

![image-20210325164509953](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20210325164509953.png)

6 配置tomcat插件

```xml
<plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <!--端口控制-->
                    <port>8080</port>
                    <!--项目路径控制意味着http://localhost:8080/abc-->
                    <path>/survey</path>
                    <!--编码-->
                    <uriEncoding>UTF-8</uriEncoding>
                </configuration>
            </plugin>
        </plugins>
```

7 配置tomcat命令

![image-20210325164950654](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20210325164950654.png)

![image-20210325165056178](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20210325165056178.png)

参考视频  第四节.maven搭建

### 4.2引入Spring、Spring MVC框架

#### 第一步：编写pom.xml文件

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>


    <groupId>com.yanzhen</groupId>
    <artifactId>survey</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <name>survey Maven Webapp</name>
    <!-- FIXME change it to the project's website -->
    <url>http://www.example.com</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
        <spring.version>5.2.6.RELEASE</spring.version>
    </properties>

    <dependencies>
        <!--测试-->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
        <!--spring jar包-->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-beans</artifactId>
            <version>${spring.version}</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-aop</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-tx</artifactId>
            <version>${spring.version}</version>
        </dependency>


    </dependencies>

    <build>
        <finalName>survey</finalName>
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <!--端口控制-->
                    <port>8080</port>
                    <!--项目路径控制http://localhost:8080/abc-->
                    <path>/survey</path>
                    <uriEncoding>UTF-8</uriEncoding>
                </configuration>
            </plugin>
        </plugins>
    </build>


</project>
```

#### 第二步：编写web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
          http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">

  <!-- 配置前端控制器 -->
  <servlet>
    <servlet-name>survey</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>classpath:spring-mvc.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>

  <servlet-mapping>
    <servlet-name>survey</servlet-name>
    <url-pattern>/</url-pattern>
  </servlet-mapping>

  <!--加载Spring核心配置文件-->
  <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>classpath:applicationContext.xml</param-value>
  </context-param>

  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>

  <!--配置编码过滤器-->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>

  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>

</web-app>
```

#### 第三步：编写spplicationContext.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:p="http://www.springframework.org/schema/p"          xmlns:util="http://www.springframework.org/schema/util"      						    xmlns:context="http://www.springframework.org/schema/context"
 xsi:schemaLocation="http://www.springframework.org/schema/beans 
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/util
       http://www.springframework.org/schema/util/spring-util.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd ">





</beans>
```

#### 第四步：编写spring-mvc.xml文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
             http://www.springframework.org/schema/beans/spring-beans.xsd
             http://www.springframework.org/schema/context
             http://www.springframework.org/schema/context/spring-context.xsd
             http://www.springframework.org/schema/aop
             http://www.springframework.org/schema/aop/spring-aop.xsd
             http://www.springframework.org/schema/tx
             http://www.springframework.org/schema/tx/spring-tx.xsd
             http://www.springframework.org/schema/mvc
             http://www.springframework.org/schema/mvc/spring-mvc.xsd">



    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/page/"></property>
        <property name="suffix" value=".jsp"></property>
    </bean>

    <mvc:default-servlet-handler/>


</beans>
```

- 需要spring核心配置文件、Spring MVC配置文件

  - 新建applicationContext.xml

  - 配置前端控制器等web.xml的相关配置

    ```xml
    <!-- 配置前端控制器 -->
      <servlet>
        <servlet-name>survey</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
          <param-name>contextConfigLocation</param-name>
          <param-value>classpath:spring-mvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
      </servlet>
      <servlet-mapping>
        <servlet-name>survey</servlet-name>
        <url-pattern>/</url-pattern>
      </servlet-mapping>
      <!--加载Spring核心配置文件-->
      <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:applicationContext.xml</param-value>
      </context-param>
      <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
      </listener>
      <!--配置编码过滤器-->
      <filter>
        <filter-name>encodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
          <param-name>encoding</param-name>
          <param-value>utf-8</param-value>
        </init-param>
      </filter>
      
      <filter-mapping>
        <filter-name>encodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
      </filter-mapping>
    ```

### 4.3引入Mybaits框架

- mybatis相关的jar
- mybatis-spring.jar

```xml
 <dependency>
     <groupId>org.mybatis</groupId>
     <artifactId>mybatis</artifactId>
     <version>${mybatis.version}</version>
</dependency>

<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>2.0.4</version>
</dependency>
```



引入common-dbcp2数据源相关的jar

```xml
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-dbcp2</artifactId>
    <version>2.7.0</version>
</dependency>
```

### 4.4SSM框架整合

```xml
<!--加载数据库配置文件 QQ:596183363-->
<context:property-placeholder location="classpath:db.properties" />

<context:component-scan base-package="com.yanzhen.service"/>

<!--配置数据源-->
<bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource">
    <property name="driverClassName" value="${jdbc.driver}"/>
    <property name="url" value="${jdbc.url}" />
    <property name="username" value="${jdbc.username}" />
    <property name="password" value="${jdbc.password}"/>
</bean>

<!--获取SqlSessionFactory工厂-->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <!--数据源-->
    <property name="dataSource" ref="dataSource"></property>
    <!--Mybatis主配置文件加载-->
    <property name="configLocation" value="classpath:mybatis-config.xml"></property>
    <property name="mapperLocations">
        <list>
            <value>classpath:com/yanzhen/mapper/*.xml</value>
        </list>
    </property>
</bean>

<!--配置扫描Mapper文件-->
<bean id="mapperScanner" class="org.mybatis.spring.mapper.MapperScannerConfigurer">
    <property name="basePackage" value="com.yanzhen.mapper"></property>
    <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"/>
</bean>
```



### 4.5 DAO层编码

#### 1编写 AdminDao.class里的几个方法

```java
import com.yanzhen.entity.Admin;

import java.util.List;
import java.util.Map;

public interface AdminDao {

    public int create(Admin admin);
    public int delete(Map<String,Object> paramMap);
    public int update(Map<String,Object> paramMap);
    public List<Admin> query(Map<String,Object> paramMap);
    public Admin detail(Map<String,Object> paramMap);
    public int count(Map<String,Object> paramMap);
}
```

#### 2 编写AdminMapper.xml配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.yanzhen.mapper.AdminDao">

    <resultMap id="AdminMap" type="com.yanzhen.entity.Admin">
        <id column="id" property="id" />
        <result column="account" property="account" />
        <result column="password" property="password" />
        <result column="name" property="name" />
        <result column="phone" property="phone" />
        <result column="remark" property="remark" />
    </resultMap>
    
    <insert id="create" parameterType="com.yanzhen.entity.Admin" keyProperty="id" useGeneratedKeys="true">
        insert into tb_admin(account,password,name,phone,remark) values (#{account},#{password},#{name},#{phone},#{remark})
    </insert>

    <sql id="AdminFindCirteria">
        <where>
            <if test="id!=null">and id=#{id}</if>
            <if test="account!=null">and account=#{account}</if>
            <if test="password!=null">and password=#{password}</if>
            <if test="name!=null">and name=#{name}</if>
            <if test="phone!=null">and phone=#{phone}</if>
        </where>
    </sql>

    <delete id="delete">
        delete from tb_admin
        <include refid="AdminFindCirteria"/>
    </delete>

    <select id="count" resultType="int">
        select count(1) from tb_admin
        <include refid="AdminFindCirteria"/>
    </select>

    <update id="update">
        update tb_admin set
        <include refid="AdminUpdateCirteria" />
        <include refid="AdminFindCirteria" />
    </update>

    <sql id="AdminUpdateCirteria">
        <set>
            <if test="account!=null">account=#{account},</if>
            <if test="password!=null">password=#{password},</if>
            <if test="name!=null">name=#{name},</if>
            <if test="phone!=null">phone=#{phone},</if>
            <if test="remark!=null">remark=#{remark},</if>
        </set>
    </sql>

    <select id="query" resultMap="AdminMap">
        select * from tb_admin
        <include refid="AdminFindCirteria" />
    </select>

    <select id="detail" resultMap="AdminMap">
        select * from tb_admin
        <include refid="AdminFindCirteria" />
        limit 1
    </select>


</mapper>
```



## 5.代码生成器

代码生成器项目：支持Spring Boot、SSM框架、Java基本JDBC技术

模块引擎采用Freemarker
