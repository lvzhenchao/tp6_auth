-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-04-30 09:19:10
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `message`
--

-- --------------------------------------------------------

--
-- 表的结构 `qing_admin`
--

CREATE TABLE `qing_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(100) NOT NULL DEFAULT '0' COMMENT 'æƒé™å­—ç¬¦ä¸²',
  `last_login_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `email` varchar(20) NOT NULL,
  `group_id` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_admin`
--

INSERT INTO `qing_admin` (`id`, `username`, `password`, `create_time`, `mobile`, `last_login_time`, `status`, `email`, `group_id`) VALUES
(1, 'root_qing', 'bc0570bcc63421dc0ed01e39c5a1e07a', 0, '0', 0, 1, '', '1'),
(3, 'article_admin', 'bc0570bcc63421dc0ed01e39c5a1e07a', 1587462278, '', 0, 0, '', '3');

-- --------------------------------------------------------

--
-- 表的结构 `qing_auth_group`
--

CREATE TABLE `qing_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_auth_group`
--

INSERT INTO `qing_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理员', 1, '1,2,3,4,5,6,7,8,11,15,16,17,9,12,13,14,10,18,19,20,23,21,22'),
(2, '栏目管理员', 1, '5,10,19,21,22'),
(3, '文章管理员', 1, '1,2,3,4,10,19,21,22'),
(4, '广告管理员', 1, '6,21,22');

-- --------------------------------------------------------

--
-- 表的结构 `qing_auth_group_access`
--

CREATE TABLE `qing_auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_auth_group_access`
--

INSERT INTO `qing_auth_group_access` (`uid`, `group_id`) VALUES
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- 表的结构 `qing_auth_rule`
--

CREATE TABLE `qing_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '上级规则id 0表示顶级规则',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单是否显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_auth_rule`
--

INSERT INTO `qing_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `parent_id`, `show`) VALUES
(1, 'dongadmin/Article/index', '文章管理', 1, 1, '', 0, 1),
(2, 'dongadmin/Article/add', '添加文章', 1, 1, '', 1, 1),
(3, 'dongadmin/Article/edit', '编辑文章', 1, 1, '', 1, 1),
(4, 'dongadmin/Article/delete', '删除文章', 1, 1, '', 1, 1),
(5, 'dongadmin/Cate/index', '栏目管理', 1, 1, '', 0, 1),
(6, 'dongadmin/Ad/index', '广告管理', 2, 1, '', 0, 1),
(7, 'dongadmin/Config/index', '系统参数', 3, 1, '', 0, 1),
(8, 'dongadmin/AuthGroup/index', '用户组管理', 3, 1, '', 0, 1),
(9, 'dongadmin/Authrule/index', '权限管理', 3, 1, '', 0, 1),
(10, 'dongadmin/Admin/index', '管理员列表', 3, 1, '', 0, 1),
(11, 'dongadmin/AuthGroup/power', '权限分配', 3, 1, '', 8, 1),
(12, 'dongadmin/Authrule/add', '添加', 3, 1, '', 9, 1),
(13, 'dongadmin/Authrule/edit', '编辑', 3, 1, '', 9, 1),
(14, 'dongadmin/Authrule/del', '删除', 3, 1, '', 9, 1),
(15, 'dongadmin/AuthGroup/add', '添加', 3, 1, '', 8, 1),
(16, 'dongadmin/AuthGroup/edit', '编辑', 3, 1, '', 8, 1),
(17, 'dongadmin/AuthGroup/del', '删除', 3, 1, '', 8, 1),
(18, 'dongadmin/Admin/add', '添加', 3, 1, '', 10, 1),
(19, 'dongadmin/Admin/edit', '编辑', 3, 1, '', 10, 1),
(20, 'dongadmin/Admin/del', '删除', 3, 1, '', 10, 1),
(21, 'dongadmin/Index/index', '首页', 0, 1, '', 0, 1),
(22, 'dongadmin/Index/logout', '退出登录', 0, 1, '', 0, 1),
(23, 'dongadmin/Admin/status', '状态', 3, 1, '', 10, 1);

--
-- 转储表的索引
--

--
-- 表的索引 `qing_admin`
--
ALTER TABLE `qing_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_auth_group`
--
ALTER TABLE `qing_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_auth_group_access`
--
ALTER TABLE `qing_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- 表的索引 `qing_auth_rule`
--
ALTER TABLE `qing_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `qing_admin`
--
ALTER TABLE `qing_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `qing_auth_group`
--
ALTER TABLE `qing_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `qing_auth_rule`
--
ALTER TABLE `qing_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
