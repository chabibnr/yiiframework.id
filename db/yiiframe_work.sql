/*
Navicat MySQL Data Transfer

Source Server         : Butterfly
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yiiframe_work

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-11 15:57:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_auth_user` (`user_id`),
  CONSTRAINT `fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `fk_user_id_auth_assignment_table` (`user_id`),
  CONSTRAINT `fk_item_name_auth_assignment_table` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id_auth_assignment_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `auth_item_type` (`type`),
  KEY `fk_auth_item_table_rule_name` (`rule_name`),
  KEY `fk_auth_item_table_group_code` (`group_code`),
  CONSTRAINT `fk_auth_item_table_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_table_rule_name` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/admin', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/#mediafile', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/comment/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/bulk-activate', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/bulk-deactivate', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/bulk-delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/bulk-spam', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/bulk-trash', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/create', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/grid-page-size', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/grid-sort', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/toggle-attribute', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/update', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/comment/default/view', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/media/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/bulk-delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/create', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/grid-page-size', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/grid-sort', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/toggle-attribute', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/album/update', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/bulk-delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/create', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/grid-page-size', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/grid-sort', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/toggle-attribute', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/category/update', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/default/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/default/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/default/settings', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/manage/delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/manage/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/manage/info', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/manage/resize', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/manage/update', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/manage/upload', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/media/manage/uploader', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/bulk-delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/create', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/grid-page-size', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/grid-sort', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/update', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/default/view', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/bulk-delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/create', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/delete', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/grid-page-size', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/grid-sort', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/update', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/menu/link/view', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/page/*', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/*', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/bulk-activate', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/bulk-deactivate', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/bulk-delete', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/create', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/delete', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/grid-page-size', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/grid-sort', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/index', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/toggle-attribute', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/update', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/page/default/view', '3', null, null, null, null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('/admin/post/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/bulk-delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/create', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/toggle-attribute', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/category/update', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/bulk-activate', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/bulk-deactivate', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/bulk-delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/create', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/toggle-attribute', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/update', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/default/view', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/bulk-delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/create', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/toggle-attribute', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/post/tag/update', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/settings/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/settings/cache/flush', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/settings/default/*', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/settings/default/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/settings/reading/index', '3', null, null, null, null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('/admin/site/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/translation/*', '3', null, null, null, null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('/admin/translation/default/*', '3', null, null, null, null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('/admin/translation/default/index', '3', null, null, null, null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('/admin/translation/source/*', '3', null, null, null, null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('/admin/translation/source/create', '3', null, null, null, null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('/admin/translation/source/delete', '3', null, null, null, null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('/admin/translation/source/update', '3', null, null, null, null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/bulk-activate', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/bulk-deactivate', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/bulk-delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/change-password', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/create', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/toggle-attribute', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/default/update', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/bulk-delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/create', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission-groups/update', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/bulk-delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/create', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/refresh-routes', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/set-child-permissions', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/set-child-routes', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/update', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/permission/view', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/bulk-delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/create', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/delete', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/set-child-permissions', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/set-child-roles', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/update', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/role/view', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/user-permission/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/user-permission/set', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/user-permission/set-roles', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/visit-log/*', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/visit-log/grid-page-size', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/visit-log/grid-sort', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/visit-log/index', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('/admin/user/visit-log/view', '3', null, null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('administrator', '1', 'Administrator', null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('assignRolesToUsers', '2', 'Assign Roles To Users', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('author', '1', 'Author', null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('bindUserToIp', '2', 'Bind User To IP', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('changeGeneralSettings', '2', 'Change General Settings', null, 'settings', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('changeOwnPassword', '2', 'Change Own Password', null, 'userCommonPermissions', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('changeReadingSettings', '2', 'Change Reading Settings', null, 'settings', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('changeUserPassword', '2', 'Change User Password', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('commonPermission', '2', 'Common Permission', null, 'userCommonPermissions', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('createComments', '2', 'Create Comments', null, 'commentManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('createMediaAlbums', '2', 'Create Media Albums', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('createMediaCategories', '2', 'Create Media Categories', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('createMenuLinks', '2', 'Create Menu Links', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('createMenus', '2', 'Create Menus', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('createPages', '2', 'Create Pages', null, 'pageManagement', null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('createPostCategories', '2', 'Create Post Categories', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('createPosts', '2', 'Create Posts', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('createPostTags', '2', 'Create Post Tags', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('createSourceMessages', '2', 'Create Source Messages', null, 'translations', null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('createUsers', '2', 'Create Users', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('deleteComments', '2', 'Delete Comments', null, 'commentManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('deleteMedia', '2', 'Delete Media', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('deleteMediaAlbums', '2', 'Delete Media Albums', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('deleteMediaCategories', '2', 'Delete Media Categories', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('deleteMenuLinks', '2', 'Delete Menu Links', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('deleteMenus', '2', 'Delete Menus', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('deletePages', '2', 'Delete Pages', null, 'pageManagement', null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('deletePostCategories', '2', 'Delete Post Categories', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('deletePosts', '2', 'Delete Posts', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('deletePostTags', '2', 'Delete Post Tags', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('deleteSourceMessages', '2', 'Delete Source Messages', null, 'translations', null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('deleteUsers', '2', 'Delete Users', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('editComments', '2', 'Edit Comments', null, 'commentManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('editMedia', '2', 'Edit Media', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('editMediaAlbums', '2', 'Edit Media Albums', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('editMediaCategories', '2', 'Edit Media Categories', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('editMediaSettings', '2', 'Edit Media Settings', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('editMenuLinks', '2', 'Edit Menu Links', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('editMenus', '2', 'Edit Menus', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('editPages', '2', 'Edit Pages', null, 'pageManagement', null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('editPostCategories', '2', 'Edit Post Categories', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('editPosts', '2', 'Edit Posts', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('editPostTags', '2', 'Edit Post Tags', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('editUserEmail', '2', 'Edit User Email', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('editUsers', '2', 'Edit Users', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('flushCache', '2', 'Flush Cache', null, 'settings', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('fullMediaAccess', '2', 'Full Media Access', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('fullMediaAlbumAccess', '2', 'Full Media Albums Access', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('fullMediaCategoryAccess', '2', 'Full Media Categories Access', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('fullMenuAccess', '2', 'Full Menu Access', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('fullMenuLinkAccess', '2', 'Full Menu Links Access', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('fullPageAccess', '2', 'Full Page Access', null, 'pageManagement', null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('fullPostAccess', '2', 'Full Post Access', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('fullPostCategoryAccess', '2', 'Full Post Categories Access', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('fullPostTagAccess', '2', 'Full Post Tags Access', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('manageRolesAndPermissions', '2', 'Manage Roles And Permissions', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('moderator', '1', 'Moderator', null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('updateImmutableSourceMessages', '2', 'Update Immutable Source Messages', null, 'translations', null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('updateSourceMessages', '2', 'Update Source Messages', null, 'translations', null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('updateTranslations', '2', 'Update Message Translations', null, 'translations', null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('uploadMedia', '2', 'Upload Media', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('user', '1', 'User', null, null, null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewComments', '2', 'View Comments', null, 'commentManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('viewDashboard', '2', 'View Dashboard', null, 'dashboard', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewMedia', '2', 'View Media', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('viewMediaAlbums', '2', 'View Media Albums', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('viewMediaCategories', '2', 'View Media Categories', null, 'mediaManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('viewMenuLinks', '2', 'View Menu Links', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('viewMenus', '2', 'View Menus', null, 'menuManagement', null, '1502441271', '1502441271');
INSERT INTO `auth_item` VALUES ('viewPages', '2', 'View Pages', null, 'pageManagement', null, '1502441272', '1502441272');
INSERT INTO `auth_item` VALUES ('viewPostCategories', '2', 'View Posts', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewPosts', '2', 'View Posts', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewPostTags', '2', 'View Tags', null, 'postManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewRegistrationIp', '2', 'View Registration IP', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewRolesAndPermissions', '2', 'View Roles And Permissions', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewTranslations', '2', 'View Message Translations', null, 'translations', null, '1502441273', '1502441273');
INSERT INTO `auth_item` VALUES ('viewUserEmail', '2', 'View User Email', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewUserRoles', '2', 'View User Roles', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewUsers', '2', 'View Users', null, 'userManagement', null, '1502441270', '1502441270');
INSERT INTO `auth_item` VALUES ('viewVisitLog', '2', 'View Visit Logs', null, 'userManagement', null, '1502441270', '1502441270');

-- ----------------------------
-- Table structure for `auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk_child_auth_item_child_table` (`child`),
  CONSTRAINT `fk_child_auth_item_child_table` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_parent_auth_item_child_table` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('administrator', 'assignRolesToUsers');
INSERT INTO `auth_item_child` VALUES ('administrator', 'author');
INSERT INTO `auth_item_child` VALUES ('administrator', 'bindUserToIp');
INSERT INTO `auth_item_child` VALUES ('administrator', 'changeGeneralSettings');
INSERT INTO `auth_item_child` VALUES ('administrator', 'changeReadingSettings');
INSERT INTO `auth_item_child` VALUES ('administrator', 'changeUserPassword');
INSERT INTO `auth_item_child` VALUES ('administrator', 'createMenuLinks');
INSERT INTO `auth_item_child` VALUES ('administrator', 'createMenus');
INSERT INTO `auth_item_child` VALUES ('administrator', 'createPages');
INSERT INTO `auth_item_child` VALUES ('administrator', 'createSourceMessages');
INSERT INTO `auth_item_child` VALUES ('administrator', 'createUsers');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deleteMedia');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deleteMediaAlbums');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deleteMediaCategories');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deleteMenuLinks');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deleteMenus');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deletePages');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deletePostCategories');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deletePostTags');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deleteSourceMessages');
INSERT INTO `auth_item_child` VALUES ('administrator', 'deleteUsers');
INSERT INTO `auth_item_child` VALUES ('administrator', 'editMenuLinks');
INSERT INTO `auth_item_child` VALUES ('administrator', 'editMenus');
INSERT INTO `auth_item_child` VALUES ('administrator', 'editPages');
INSERT INTO `auth_item_child` VALUES ('administrator', 'editUserEmail');
INSERT INTO `auth_item_child` VALUES ('administrator', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('administrator', 'flushCache');
INSERT INTO `auth_item_child` VALUES ('administrator', 'fullMenuAccess');
INSERT INTO `auth_item_child` VALUES ('administrator', 'fullMenuLinkAccess');
INSERT INTO `auth_item_child` VALUES ('administrator', 'fullPageAccess');
INSERT INTO `auth_item_child` VALUES ('administrator', 'manageRolesAndPermissions');
INSERT INTO `auth_item_child` VALUES ('administrator', 'moderator');
INSERT INTO `auth_item_child` VALUES ('administrator', 'updateSourceMessages');
INSERT INTO `auth_item_child` VALUES ('administrator', 'updateTranslations');
INSERT INTO `auth_item_child` VALUES ('administrator', 'user');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewMenuLinks');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewMenus');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewPages');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewRegistrationIp');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewRolesAndPermissions');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewTranslations');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('administrator', 'viewVisitLog');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/admin/user/user-permission/set');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', '/admin/user/user-permission/set-roles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('assignRolesToUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('author', 'createMediaAlbums');
INSERT INTO `auth_item_child` VALUES ('author', 'createPosts');
INSERT INTO `auth_item_child` VALUES ('author', 'editPosts');
INSERT INTO `auth_item_child` VALUES ('author', 'uploadMedia');
INSERT INTO `auth_item_child` VALUES ('author', 'user');
INSERT INTO `auth_item_child` VALUES ('author', 'viewDashboard');
INSERT INTO `auth_item_child` VALUES ('author', 'viewPostCategories');
INSERT INTO `auth_item_child` VALUES ('author', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('author', 'viewPostTags');
INSERT INTO `auth_item_child` VALUES ('changeGeneralSettings', '/admin/settings/default/index');
INSERT INTO `auth_item_child` VALUES ('changeReadingSettings', '/admin/settings/reading/index');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', '/admin/user/default/change-password');
INSERT INTO `auth_item_child` VALUES ('changeUserPassword', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('createComments', '/admin/comment/default/create');
INSERT INTO `auth_item_child` VALUES ('createComments', 'viewComments');
INSERT INTO `auth_item_child` VALUES ('createMediaAlbums', '/admin/media/album/create');
INSERT INTO `auth_item_child` VALUES ('createMediaAlbums', 'viewMediaAlbums');
INSERT INTO `auth_item_child` VALUES ('createMediaCategories', '/admin/media/category/create');
INSERT INTO `auth_item_child` VALUES ('createMediaCategories', 'viewMediaCategories');
INSERT INTO `auth_item_child` VALUES ('createMenuLinks', '/admin/menu/link/create');
INSERT INTO `auth_item_child` VALUES ('createMenuLinks', 'viewMenuLinks');
INSERT INTO `auth_item_child` VALUES ('createMenus', '/admin/menu/default/create');
INSERT INTO `auth_item_child` VALUES ('createMenus', 'viewMenus');
INSERT INTO `auth_item_child` VALUES ('createPages', '/admin/page/default/create');
INSERT INTO `auth_item_child` VALUES ('createPages', 'viewPages');
INSERT INTO `auth_item_child` VALUES ('createPostCategories', '/admin/post/category/create');
INSERT INTO `auth_item_child` VALUES ('createPostCategories', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('createPosts', '/admin/post/default/create');
INSERT INTO `auth_item_child` VALUES ('createPosts', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('createPostTags', '/admin/post/tag/create');
INSERT INTO `auth_item_child` VALUES ('createPostTags', 'viewPostTags');
INSERT INTO `auth_item_child` VALUES ('createSourceMessages', '/admin/translation/source/create');
INSERT INTO `auth_item_child` VALUES ('createSourceMessages', 'updateSourceMessages');
INSERT INTO `auth_item_child` VALUES ('createSourceMessages', 'viewTranslations');
INSERT INTO `auth_item_child` VALUES ('createUsers', '/admin/user/default/create');
INSERT INTO `auth_item_child` VALUES ('createUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('deleteComments', '/admin/comment/default/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteComments', '/admin/comment/default/delete');
INSERT INTO `auth_item_child` VALUES ('deleteComments', 'viewComments');
INSERT INTO `auth_item_child` VALUES ('deleteMedia', '/admin/media/manage/delete');
INSERT INTO `auth_item_child` VALUES ('deleteMedia', 'viewMedia');
INSERT INTO `auth_item_child` VALUES ('deleteMediaAlbums', '/admin/media/album/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteMediaAlbums', '/admin/media/album/delete');
INSERT INTO `auth_item_child` VALUES ('deleteMediaAlbums', 'viewMediaAlbums');
INSERT INTO `auth_item_child` VALUES ('deleteMediaCategories', '/admin/media/category/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteMediaCategories', '/admin/media/category/delete');
INSERT INTO `auth_item_child` VALUES ('deleteMediaCategories', 'viewMediaCategories');
INSERT INTO `auth_item_child` VALUES ('deleteMenuLinks', '/admin/menu/link/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteMenuLinks', '/admin/menu/link/delete');
INSERT INTO `auth_item_child` VALUES ('deleteMenuLinks', 'viewMenuLinks');
INSERT INTO `auth_item_child` VALUES ('deleteMenus', '/admin/menu/default/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteMenus', '/admin/menu/default/delete');
INSERT INTO `auth_item_child` VALUES ('deleteMenus', 'viewMenus');
INSERT INTO `auth_item_child` VALUES ('deletePages', '/admin/page/default/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deletePages', '/admin/page/default/delete');
INSERT INTO `auth_item_child` VALUES ('deletePages', 'viewPages');
INSERT INTO `auth_item_child` VALUES ('deletePostCategories', '/admin/post/category/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deletePostCategories', '/admin/post/category/delete');
INSERT INTO `auth_item_child` VALUES ('deletePostCategories', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('deletePosts', '/admin/post/default/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deletePosts', '/admin/post/default/delete');
INSERT INTO `auth_item_child` VALUES ('deletePosts', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('deletePostTags', '/admin/post/tag/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deletePostTags', '/admin/post/tag/delete');
INSERT INTO `auth_item_child` VALUES ('deletePostTags', 'viewPostTags');
INSERT INTO `auth_item_child` VALUES ('deleteSourceMessages', '/admin/translation/source/delete');
INSERT INTO `auth_item_child` VALUES ('deleteSourceMessages', 'updateSourceMessages');
INSERT INTO `auth_item_child` VALUES ('deleteSourceMessages', 'viewTranslations');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/admin/user/default/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', '/admin/user/default/delete');
INSERT INTO `auth_item_child` VALUES ('deleteUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('editComments', '/admin/comment/default/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editComments', '/admin/comment/default/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('editComments', '/admin/comment/default/bulk-spam');
INSERT INTO `auth_item_child` VALUES ('editComments', '/admin/comment/default/bulk-trash');
INSERT INTO `auth_item_child` VALUES ('editComments', '/admin/comment/default/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editComments', '/admin/comment/default/update');
INSERT INTO `auth_item_child` VALUES ('editComments', 'viewComments');
INSERT INTO `auth_item_child` VALUES ('editMedia', '/admin/media/manage/update');
INSERT INTO `auth_item_child` VALUES ('editMedia', 'viewMedia');
INSERT INTO `auth_item_child` VALUES ('editMediaAlbums', '/admin/media/album/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editMediaAlbums', '/admin/media/album/update');
INSERT INTO `auth_item_child` VALUES ('editMediaAlbums', 'viewMediaAlbums');
INSERT INTO `auth_item_child` VALUES ('editMediaCategories', '/admin/media/category/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editMediaCategories', '/admin/media/category/update');
INSERT INTO `auth_item_child` VALUES ('editMediaCategories', 'viewMediaCategories');
INSERT INTO `auth_item_child` VALUES ('editMediaSettings', '/admin/media/default/settings');
INSERT INTO `auth_item_child` VALUES ('editMediaSettings', '/admin/media/manage/resize');
INSERT INTO `auth_item_child` VALUES ('editMediaSettings', 'viewMedia');
INSERT INTO `auth_item_child` VALUES ('editMenuLinks', '/admin/menu/link/update');
INSERT INTO `auth_item_child` VALUES ('editMenuLinks', 'viewMenuLinks');
INSERT INTO `auth_item_child` VALUES ('editMenus', '/admin/menu/default/update');
INSERT INTO `auth_item_child` VALUES ('editMenus', 'viewMenus');
INSERT INTO `auth_item_child` VALUES ('editPages', '/admin/page/default/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editPages', '/admin/page/default/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('editPages', '/admin/page/default/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editPages', '/admin/page/default/update');
INSERT INTO `auth_item_child` VALUES ('editPages', 'viewPages');
INSERT INTO `auth_item_child` VALUES ('editPostCategories', '/admin/post/category/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editPostCategories', '/admin/post/category/update');
INSERT INTO `auth_item_child` VALUES ('editPostCategories', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('editPosts', '/admin/post/default/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editPosts', '/admin/post/default/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('editPosts', '/admin/post/default/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editPosts', '/admin/post/default/update');
INSERT INTO `auth_item_child` VALUES ('editPosts', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('editPostTags', '/admin/post/tag/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editPostTags', '/admin/post/tag/update');
INSERT INTO `auth_item_child` VALUES ('editPostTags', 'viewPostTags');
INSERT INTO `auth_item_child` VALUES ('editUserEmail', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/admin/user/default/bulk-activate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/admin/user/default/bulk-deactivate');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/admin/user/default/toggle-attribute');
INSERT INTO `auth_item_child` VALUES ('editUsers', '/admin/user/default/update');
INSERT INTO `auth_item_child` VALUES ('editUsers', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('flushCache', '/admin/settings/cache/flush');
INSERT INTO `auth_item_child` VALUES ('fullMediaAccess', 'viewMedia');
INSERT INTO `auth_item_child` VALUES ('fullMenuAccess', 'viewMenus');
INSERT INTO `auth_item_child` VALUES ('fullMenuLinkAccess', 'viewMenuLinks');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission-groups/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission-groups/create');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission-groups/delete');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission-groups/update');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/create');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/delete');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/refresh-routes');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/set-child-permissions');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/set-child-routes');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/update');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/permission/view');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/role/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/role/create');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/role/delete');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/role/set-child-permissions');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/role/set-child-roles');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/role/update');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', '/admin/user/role/view');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', 'editUsers');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', 'viewRolesAndPermissions');
INSERT INTO `auth_item_child` VALUES ('manageRolesAndPermissions', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('moderator', 'author');
INSERT INTO `auth_item_child` VALUES ('moderator', 'createComments');
INSERT INTO `auth_item_child` VALUES ('moderator', 'createMediaCategories');
INSERT INTO `auth_item_child` VALUES ('moderator', 'createPostCategories');
INSERT INTO `auth_item_child` VALUES ('moderator', 'createPostTags');
INSERT INTO `auth_item_child` VALUES ('moderator', 'deleteComments');
INSERT INTO `auth_item_child` VALUES ('moderator', 'deletePosts');
INSERT INTO `auth_item_child` VALUES ('moderator', 'editComments');
INSERT INTO `auth_item_child` VALUES ('moderator', 'editMediaAlbums');
INSERT INTO `auth_item_child` VALUES ('moderator', 'editMediaCategories');
INSERT INTO `auth_item_child` VALUES ('moderator', 'editPostCategories');
INSERT INTO `auth_item_child` VALUES ('moderator', 'editPostTags');
INSERT INTO `auth_item_child` VALUES ('moderator', 'fullMediaAccess');
INSERT INTO `auth_item_child` VALUES ('moderator', 'fullMediaAlbumAccess');
INSERT INTO `auth_item_child` VALUES ('moderator', 'fullMediaCategoryAccess');
INSERT INTO `auth_item_child` VALUES ('moderator', 'fullPostAccess');
INSERT INTO `auth_item_child` VALUES ('moderator', 'fullPostCategoryAccess');
INSERT INTO `auth_item_child` VALUES ('moderator', 'fullPostTagAccess');
INSERT INTO `auth_item_child` VALUES ('moderator', 'user');
INSERT INTO `auth_item_child` VALUES ('moderator', 'viewComments');
INSERT INTO `auth_item_child` VALUES ('moderator', 'viewUserEmail');
INSERT INTO `auth_item_child` VALUES ('moderator', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('updateImmutableSourceMessages', 'updateSourceMessages');
INSERT INTO `auth_item_child` VALUES ('updateImmutableSourceMessages', 'viewTranslations');
INSERT INTO `auth_item_child` VALUES ('updateSourceMessages', '/admin/translation/source/update');
INSERT INTO `auth_item_child` VALUES ('updateSourceMessages', 'updateTranslations');
INSERT INTO `auth_item_child` VALUES ('updateSourceMessages', 'viewTranslations');
INSERT INTO `auth_item_child` VALUES ('updateTranslations', 'viewTranslations');
INSERT INTO `auth_item_child` VALUES ('uploadMedia', '/admin/media/manage/upload');
INSERT INTO `auth_item_child` VALUES ('uploadMedia', '/admin/media/manage/uploader');
INSERT INTO `auth_item_child` VALUES ('uploadMedia', 'editMedia');
INSERT INTO `auth_item_child` VALUES ('uploadMedia', 'viewMedia');
INSERT INTO `auth_item_child` VALUES ('user', 'changeOwnPassword');
INSERT INTO `auth_item_child` VALUES ('user', 'commonPermission');
INSERT INTO `auth_item_child` VALUES ('viewComments', '/admin/comment/default/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewComments', '/admin/comment/default/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewComments', '/admin/comment/default/index');
INSERT INTO `auth_item_child` VALUES ('viewComments', '/admin/comment/default/view');
INSERT INTO `auth_item_child` VALUES ('viewDashboard', '/admin');
INSERT INTO `auth_item_child` VALUES ('viewDashboard', '/admin/site/index');
INSERT INTO `auth_item_child` VALUES ('viewMedia', '/admin/#mediafile');
INSERT INTO `auth_item_child` VALUES ('viewMedia', '/admin/media/default/index');
INSERT INTO `auth_item_child` VALUES ('viewMedia', '/admin/media/manage/index');
INSERT INTO `auth_item_child` VALUES ('viewMedia', '/admin/media/manage/info');
INSERT INTO `auth_item_child` VALUES ('viewMediaAlbums', '/admin/media/album/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewMediaAlbums', '/admin/media/album/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewMediaAlbums', '/admin/media/album/index');
INSERT INTO `auth_item_child` VALUES ('viewMediaCategories', '/admin/media/category/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewMediaCategories', '/admin/media/category/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewMediaCategories', '/admin/media/category/index');
INSERT INTO `auth_item_child` VALUES ('viewMenuLinks', '/admin/menu/link/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewMenuLinks', '/admin/menu/link/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewMenuLinks', '/admin/menu/link/index');
INSERT INTO `auth_item_child` VALUES ('viewMenuLinks', '/admin/menu/link/view');
INSERT INTO `auth_item_child` VALUES ('viewMenuLinks', 'viewMenus');
INSERT INTO `auth_item_child` VALUES ('viewMenus', '/admin/menu/default/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewMenus', '/admin/menu/default/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewMenus', '/admin/menu/default/index');
INSERT INTO `auth_item_child` VALUES ('viewMenus', '/admin/menu/default/view');
INSERT INTO `auth_item_child` VALUES ('viewPages', '/admin/page/default/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewPages', '/admin/page/default/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewPages', '/admin/page/default/index');
INSERT INTO `auth_item_child` VALUES ('viewPages', '/admin/page/default/view');
INSERT INTO `auth_item_child` VALUES ('viewPostCategories', '/admin/post/category/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewPostCategories', '/admin/post/category/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewPostCategories', '/admin/post/category/index');
INSERT INTO `auth_item_child` VALUES ('viewPostCategories', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('viewPosts', '/admin/post/default/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewPosts', '/admin/post/default/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewPosts', '/admin/post/default/index');
INSERT INTO `auth_item_child` VALUES ('viewPosts', '/admin/post/default/view');
INSERT INTO `auth_item_child` VALUES ('viewPostTags', '/admin/post/tag/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewPostTags', '/admin/post/tag/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewPostTags', '/admin/post/tag/index');
INSERT INTO `auth_item_child` VALUES ('viewPostTags', 'viewPosts');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/permission-groups/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/permission-groups/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/permission-groups/index');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/permission/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/permission/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/permission/index');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/role/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/role/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', '/admin/user/role/index');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', 'viewUserRoles');
INSERT INTO `auth_item_child` VALUES ('viewRolesAndPermissions', 'viewUsers');
INSERT INTO `auth_item_child` VALUES ('viewTranslations', '/admin/translation/default/index');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/admin/user/default/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/admin/user/default/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewUsers', '/admin/user/default/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/admin/user/visit-log/grid-page-size');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/admin/user/visit-log/grid-sort');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/admin/user/visit-log/index');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', '/admin/user/visit-log/view');
INSERT INTO `auth_item_child` VALUES ('viewVisitLog', 'viewUsers');

-- ----------------------------
-- Table structure for `auth_item_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_group
-- ----------------------------
INSERT INTO `auth_item_group` VALUES ('commentManagement', 'Comment Management', '1502441271', '1502441271');
INSERT INTO `auth_item_group` VALUES ('dashboard', 'Dashboard', '1502441270', '1502441270');
INSERT INTO `auth_item_group` VALUES ('mediaManagement', 'Media Management', '1502441271', '1502441271');
INSERT INTO `auth_item_group` VALUES ('menuManagement', 'Menu Management', '1502441271', '1502441271');
INSERT INTO `auth_item_group` VALUES ('pageManagement', 'Page Management', '1502441272', '1502441272');
INSERT INTO `auth_item_group` VALUES ('postManagement', 'Post Management', '1502441270', '1502441270');
INSERT INTO `auth_item_group` VALUES ('settings', 'Settings', '1502441271', '1502441271');
INSERT INTO `auth_item_group` VALUES ('translations', 'Translations', '1502441273', '1502441273');
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions', 'Common Permissions', '1502441270', '1502441270');
INSERT INTO `auth_item_group` VALUES ('userManagement', 'User Management', '1502441270', '1502441270');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL DEFAULT '',
  `model_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'null-is not a reply, int-replied comment id',
  `content` text,
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-pending,1-published,2-spam,3-deleted',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `user_ip` varchar(15) DEFAULT NULL,
  `super_parent_id` int(11) DEFAULT NULL COMMENT 'null-has no parent, int-1st level parent id',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_model` (`model`),
  KEY `comment_model_id` (`model`,`model_id`),
  KEY `comment_status` (`status`),
  KEY `comment_reply` (`parent_id`),
  KEY `comment_super_parent_id` (`super_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `url` text,
  `size` varchar(127) DEFAULT NULL,
  `thumbs` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_album` (`album_id`),
  KEY `fk_media_created_by` (`created_by`),
  KEY `fk_media_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_album` FOREIGN KEY (`album_id`) REFERENCES `media_album` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for `media_album`
-- ----------------------------
DROP TABLE IF EXISTS `media_album`;
CREATE TABLE `media_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_album_slug` (`slug`),
  KEY `media_album_visible` (`visible`),
  KEY `fk_album_category` (`category_id`),
  KEY `fk_media_album_created_by` (`created_by`),
  KEY `fk_media_album_updated_by` (`updated_by`),
  CONSTRAINT `fk_album_category` FOREIGN KEY (`category_id`) REFERENCES `media_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_album
-- ----------------------------

-- ----------------------------
-- Table structure for `media_album_lang`
-- ----------------------------
DROP TABLE IF EXISTS `media_album_lang`;
CREATE TABLE `media_album_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_album_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_album_lang_language` (`language`),
  KEY `fk_media_album_lang` (`media_album_id`),
  CONSTRAINT `fk_media_album_lang` FOREIGN KEY (`media_album_id`) REFERENCES `media_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_album_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `media_category`
-- ----------------------------
DROP TABLE IF EXISTS `media_category`;
CREATE TABLE `media_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_category_slug` (`slug`),
  KEY `media_category_visible` (`visible`),
  KEY `fk_media_category_created_by` (`created_by`),
  KEY `fk_media_category_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_category
-- ----------------------------

-- ----------------------------
-- Table structure for `media_category_lang`
-- ----------------------------
DROP TABLE IF EXISTS `media_category_lang`;
CREATE TABLE `media_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_category_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_category_lang_language` (`language`),
  KEY `fk_media_category_lang` (`media_category_id`),
  CONSTRAINT `fk_media_category_lang` FOREIGN KEY (`media_category_id`) REFERENCES `media_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_category_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `media_lang`
-- ----------------------------
DROP TABLE IF EXISTS `media_lang`;
CREATE TABLE `media_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_lang_language` (`language`),
  KEY `fk_media_lang` (`media_id`),
  CONSTRAINT `fk_media_lang` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `media_upload`
-- ----------------------------
DROP TABLE IF EXISTS `media_upload`;
CREATE TABLE `media_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `owner_class` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_upload_owner_class` (`owner_class`),
  KEY `media_upload_owner_id` (`owner_id`),
  KEY `fk_media_upload_media_id` (`media_id`),
  CONSTRAINT `fk_media_upload_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_created_by` (`created_by`),
  KEY `fk_menu_updated_by` (`updated_by`),
  CONSTRAINT `fk_menu_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('admin-menu', null, null, '30', null);
INSERT INTO `menu` VALUES ('main-menu', null, null, '30', null);

-- ----------------------------
-- Table structure for `menu_lang`
-- ----------------------------
DROP TABLE IF EXISTS `menu_lang`;
CREATE TABLE `menu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(64) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  PRIMARY KEY (`id`),
  KEY `menu_lang_post_id` (`menu_id`),
  KEY `menu_lang_language` (`language`),
  CONSTRAINT `fk_menu_lang` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_lang
-- ----------------------------
INSERT INTO `menu_lang` VALUES ('1', 'admin-menu', 'en-US', 'Control Panel Menu');
INSERT INTO `menu_lang` VALUES ('2', 'main-menu', 'en-US', 'Main Menu');

-- ----------------------------
-- Table structure for `menu_link`
-- ----------------------------
DROP TABLE IF EXISTS `menu_link`;
CREATE TABLE `menu_link` (
  `id` varchar(64) NOT NULL,
  `menu_id` varchar(64) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `parent_id` varchar(64) DEFAULT '',
  `image` varchar(24) DEFAULT NULL,
  `alwaysVisible` int(1) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_menu_id` (`menu_id`),
  KEY `link_parent_id` (`parent_id`),
  KEY `fk_menu_link_created_by` (`created_by`),
  KEY `fk_menu_link_updated_by` (`updated_by`),
  CONSTRAINT `fk_menu_link` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_menu_link_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_link_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_link
-- ----------------------------
INSERT INTO `menu_link` VALUES ('about', 'main-menu', '/site/about', '', null, '1', '9', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('comment', 'admin-menu', '/comment/default/index', '', 'comment', '0', '8', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('contact', 'main-menu', '/site/contact', '', null, '1', '10', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('dashboard', 'admin-menu', '/', '', 'th', '0', '1', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('home', 'main-menu', '/site/index', '', null, '1', '1', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('image-settings', 'admin-menu', '/media/default/settings', 'settings', null, '0', '5', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('media', 'admin-menu', null, '', 'image', '0', '5', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('media-album', 'admin-menu', '/media/album/index', 'media', null, '0', '2', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('media-category', 'admin-menu', '/media/category/index', 'media', null, '0', '3', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('media-media', 'admin-menu', '/media/default/index', 'media', null, '0', '1', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('menu', 'admin-menu', '/menu/default/index', '', 'align-justify', '0', '10', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('page', 'admin-menu', '/page/default/index', '', 'file', '0', '2', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('post', 'admin-menu', null, '', 'pencil', '0', '3', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('post-category', 'admin-menu', '/post/category/index', 'post', null, '0', '2', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('post-post', 'admin-menu', '/post/default/index', 'post', null, '0', '1', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('post-tag', 'admin-menu', '/post/tag/index', 'post', null, '0', '2', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('seo', 'admin-menu', '/seo/default/index', '', 'line-chart', '0', '19', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('settings', 'admin-menu', null, '', 'cog', '0', '20', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('settings-cache', 'admin-menu', '/settings/cache/flush', 'settings', null, '0', '99', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('settings-general', 'admin-menu', '/settings/default/index', 'settings', null, '0', '1', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('settings-reading', 'admin-menu', '/settings/reading/index', 'settings', null, '0', '2', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('settings-translations', 'admin-menu', '/translation/default/index', 'settings', null, '0', '5', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('test-page', 'main-menu', '/site/test', '', null, '1', '2', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('user', 'admin-menu', null, '', 'user', '0', '15', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('user-groups', 'admin-menu', '/user/permission-groups/index', 'user', null, '0', '4', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('user-log', 'admin-menu', '/user/visit-log/index', 'user', null, '0', '10', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('user-permission', 'admin-menu', '/user/permission/index', 'user', null, '0', '3', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('user-role', 'admin-menu', '/user/role/index', 'user', null, '0', '2', null, null, '30', null);
INSERT INTO `menu_link` VALUES ('user-user', 'admin-menu', '/user/default/index', 'user', null, '0', '1', null, null, '30', null);

-- ----------------------------
-- Table structure for `menu_link_lang`
-- ----------------------------
DROP TABLE IF EXISTS `menu_link_lang`;
CREATE TABLE `menu_link_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` varchar(64) NOT NULL,
  `language` varchar(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_link_lang_link_id` (`link_id`),
  KEY `menu_link_lang_language` (`language`),
  CONSTRAINT `fk_menu_link_lang` FOREIGN KEY (`link_id`) REFERENCES `menu_link` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_link_lang
-- ----------------------------
INSERT INTO `menu_link_lang` VALUES ('1', 'dashboard', 'en-US', 'Dashboard');
INSERT INTO `menu_link_lang` VALUES ('2', 'settings', 'en-US', 'Settings');
INSERT INTO `menu_link_lang` VALUES ('3', 'settings-general', 'en-US', 'General Settings');
INSERT INTO `menu_link_lang` VALUES ('4', 'settings-reading', 'en-US', 'Reading Settings');
INSERT INTO `menu_link_lang` VALUES ('5', 'settings-cache', 'en-US', 'Flush Cache');
INSERT INTO `menu_link_lang` VALUES ('6', 'menu', 'en-US', 'Menus');
INSERT INTO `menu_link_lang` VALUES ('7', 'comment', 'en-US', 'Comments');
INSERT INTO `menu_link_lang` VALUES ('8', 'user', 'en-US', 'Users');
INSERT INTO `menu_link_lang` VALUES ('9', 'user-groups', 'en-US', 'Permission groups');
INSERT INTO `menu_link_lang` VALUES ('10', 'user-log', 'en-US', 'Visit log');
INSERT INTO `menu_link_lang` VALUES ('11', 'user-permission', 'en-US', 'Permissions');
INSERT INTO `menu_link_lang` VALUES ('12', 'user-role', 'en-US', 'Roles');
INSERT INTO `menu_link_lang` VALUES ('13', 'user-user', 'en-US', 'Users');
INSERT INTO `menu_link_lang` VALUES ('14', 'post', 'en-US', 'Posts');
INSERT INTO `menu_link_lang` VALUES ('15', 'post-post', 'en-US', 'Posts');
INSERT INTO `menu_link_lang` VALUES ('16', 'post-category', 'en-US', 'Categories');
INSERT INTO `menu_link_lang` VALUES ('17', 'media', 'en-US', 'Media');
INSERT INTO `menu_link_lang` VALUES ('18', 'media-media', 'en-US', 'Media');
INSERT INTO `menu_link_lang` VALUES ('19', 'media-album', 'en-US', 'Albums');
INSERT INTO `menu_link_lang` VALUES ('20', 'media-category', 'en-US', 'Categories');
INSERT INTO `menu_link_lang` VALUES ('21', 'image-settings', 'en-US', 'Image Settings');
INSERT INTO `menu_link_lang` VALUES ('22', 'page', 'en-US', 'Pages');
INSERT INTO `menu_link_lang` VALUES ('23', 'settings-translations', 'en-US', 'Message Translation');
INSERT INTO `menu_link_lang` VALUES ('24', 'seo', 'en-US', 'SEO');
INSERT INTO `menu_link_lang` VALUES ('25', 'post-tag', 'en-US', 'Tags');
INSERT INTO `menu_link_lang` VALUES ('26', 'home', 'en-US', 'Home');
INSERT INTO `menu_link_lang` VALUES ('27', 'about', 'en-US', 'About');
INSERT INTO `menu_link_lang` VALUES ('28', 'test-page', 'en-US', 'Test Page');
INSERT INTO `menu_link_lang` VALUES ('29', 'contact', 'en-US', 'Contact');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `language` varchar(16) NOT NULL,
  `translation` text,
  PRIMARY KEY (`id`),
  KEY `message_index` (`source_id`,`language`),
  CONSTRAINT `fk_message_source_message` FOREIGN KEY (`source_id`) REFERENCES `message_source` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `message_source`
-- ----------------------------
DROP TABLE IF EXISTS `message_source`;
CREATE TABLE `message_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL,
  `message` text,
  `immutable` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_source
-- ----------------------------
INSERT INTO `message_source` VALUES ('1', 'yee', '--- With selected ---', '1');
INSERT INTO `message_source` VALUES ('2', 'yee', 'Activate', '1');
INSERT INTO `message_source` VALUES ('3', 'yee', 'Active', '1');
INSERT INTO `message_source` VALUES ('4', 'yee', 'Add New', '1');
INSERT INTO `message_source` VALUES ('5', 'yee', 'All', '1');
INSERT INTO `message_source` VALUES ('6', 'yee', 'Always Visible', '1');
INSERT INTO `message_source` VALUES ('7', 'yee', 'An unknown error occurred.', '1');
INSERT INTO `message_source` VALUES ('8', 'yee', 'Approved', '1');
INSERT INTO `message_source` VALUES ('9', 'yee', 'Author', '1');
INSERT INTO `message_source` VALUES ('10', 'yee', 'Banned', '1');
INSERT INTO `message_source` VALUES ('11', 'yee', 'Bind to IP', '1');
INSERT INTO `message_source` VALUES ('12', 'yee', 'Browse', '1');
INSERT INTO `message_source` VALUES ('13', 'yee', 'Browser', '1');
INSERT INTO `message_source` VALUES ('14', 'yee', 'Cancel', '1');
INSERT INTO `message_source` VALUES ('15', 'yee', 'Category', '1');
INSERT INTO `message_source` VALUES ('16', 'yee', 'Clear filters', '1');
INSERT INTO `message_source` VALUES ('17', 'yee', 'Closed', '1');
INSERT INTO `message_source` VALUES ('18', 'yee', 'Code', '1');
INSERT INTO `message_source` VALUES ('19', 'yee', 'Comment Status', '1');
INSERT INTO `message_source` VALUES ('20', 'yee', 'Comments Activity', '1');
INSERT INTO `message_source` VALUES ('21', 'yee', 'Confirm', '1');
INSERT INTO `message_source` VALUES ('22', 'yee', 'Confirmation Token', '1');
INSERT INTO `message_source` VALUES ('23', 'yee', 'Content', '1');
INSERT INTO `message_source` VALUES ('24', 'yee', 'Control Panel', '1');
INSERT INTO `message_source` VALUES ('25', 'yee', 'Create {item}', '1');
INSERT INTO `message_source` VALUES ('26', 'yee', 'Create', '1');
INSERT INTO `message_source` VALUES ('27', 'yee', 'Created By', '1');
INSERT INTO `message_source` VALUES ('28', 'yee', 'Created', '1');
INSERT INTO `message_source` VALUES ('29', 'yee', 'Dashboard', '1');
INSERT INTO `message_source` VALUES ('30', 'yee', 'Data', '1');
INSERT INTO `message_source` VALUES ('31', 'yee', 'Deactivate', '1');
INSERT INTO `message_source` VALUES ('32', 'yee', 'Default Language', '1');
INSERT INTO `message_source` VALUES ('33', 'yee', 'Default Value', '1');
INSERT INTO `message_source` VALUES ('34', 'yee', 'Delete', '1');
INSERT INTO `message_source` VALUES ('35', 'yee', 'Description', '1');
INSERT INTO `message_source` VALUES ('36', 'yee', 'E-mail confirmed', '1');
INSERT INTO `message_source` VALUES ('37', 'yee', 'E-mail', '1');
INSERT INTO `message_source` VALUES ('38', 'yee', 'Edit', '1');
INSERT INTO `message_source` VALUES ('39', 'yee', 'Error', '1');
INSERT INTO `message_source` VALUES ('40', 'yee', 'For example', '1');
INSERT INTO `message_source` VALUES ('41', 'yee', 'Group', '1');
INSERT INTO `message_source` VALUES ('42', 'yee', 'ID', '1');
INSERT INTO `message_source` VALUES ('43', 'yee', 'IP', '1');
INSERT INTO `message_source` VALUES ('44', 'yee', 'Icon', '1');
INSERT INTO `message_source` VALUES ('45', 'yee', 'Inactive', '1');
INSERT INTO `message_source` VALUES ('46', 'yee', 'Insert', '1');
INSERT INTO `message_source` VALUES ('47', 'yee', 'Invalid settings for dashboard widgets', '1');
INSERT INTO `message_source` VALUES ('48', 'yee', 'Key', '1');
INSERT INTO `message_source` VALUES ('49', 'yee', 'Label', '1');
INSERT INTO `message_source` VALUES ('50', 'yee', 'Language', '1');
INSERT INTO `message_source` VALUES ('51', 'yee', 'Link ID can only contain lowercase alphanumeric characters, underscores and dashes.', '1');
INSERT INTO `message_source` VALUES ('52', 'yee', 'Link', '1');
INSERT INTO `message_source` VALUES ('53', 'yee', 'Login', '1');
INSERT INTO `message_source` VALUES ('54', 'yee', 'Logout {username}', '1');
INSERT INTO `message_source` VALUES ('55', 'yee', 'Menu ID can only contain lowercase alphanumeric characters, underscores and dashes.', '1');
INSERT INTO `message_source` VALUES ('56', 'yee', 'Menu', '1');
INSERT INTO `message_source` VALUES ('57', 'yee', 'Name', '1');
INSERT INTO `message_source` VALUES ('58', 'yee', 'No Parent', '1');
INSERT INTO `message_source` VALUES ('59', 'yee', 'No comments found.', '1');
INSERT INTO `message_source` VALUES ('60', 'yee', 'Not Selected', '1');
INSERT INTO `message_source` VALUES ('61', 'yee', 'OK', '1');
INSERT INTO `message_source` VALUES ('62', 'yee', 'OS', '1');
INSERT INTO `message_source` VALUES ('63', 'yee', 'Open', '1');
INSERT INTO `message_source` VALUES ('64', 'yee', 'Order', '1');
INSERT INTO `message_source` VALUES ('65', 'yee', 'PHP Version', '1');
INSERT INTO `message_source` VALUES ('66', 'yee', 'Parent Link', '1');
INSERT INTO `message_source` VALUES ('67', 'yee', 'Password', '1');
INSERT INTO `message_source` VALUES ('68', 'yee', 'Pending', '1');
INSERT INTO `message_source` VALUES ('69', 'yee', 'Processing', '1');
INSERT INTO `message_source` VALUES ('70', 'yee', 'Publish', '1');
INSERT INTO `message_source` VALUES ('71', 'yee', 'Published', '1');
INSERT INTO `message_source` VALUES ('72', 'yee', 'Read more', '1');
INSERT INTO `message_source` VALUES ('73', 'yee', 'Records per page', '1');
INSERT INTO `message_source` VALUES ('74', 'yee', 'Registration IP', '1');
INSERT INTO `message_source` VALUES ('75', 'yee', 'Repeat password', '1');
INSERT INTO `message_source` VALUES ('76', 'yee', 'Required', '1');
INSERT INTO `message_source` VALUES ('77', 'yee', 'Revision', '1');
INSERT INTO `message_source` VALUES ('78', 'yee', 'Role', '1');
INSERT INTO `message_source` VALUES ('79', 'yee', 'Roles', '1');
INSERT INTO `message_source` VALUES ('80', 'yee', 'Rule', '1');
INSERT INTO `message_source` VALUES ('81', 'yee', 'Save All', '1');
INSERT INTO `message_source` VALUES ('82', 'yee', 'Save', '1');
INSERT INTO `message_source` VALUES ('83', 'yee', 'Saved', '1');
INSERT INTO `message_source` VALUES ('84', 'yee', 'Settings', '1');
INSERT INTO `message_source` VALUES ('85', 'yee', 'Size', '1');
INSERT INTO `message_source` VALUES ('86', 'yee', 'Slug', '1');
INSERT INTO `message_source` VALUES ('87', 'yee', 'Spam', '1');
INSERT INTO `message_source` VALUES ('88', 'yee', 'Start', '1');
INSERT INTO `message_source` VALUES ('89', 'yee', 'Status', '1');
INSERT INTO `message_source` VALUES ('90', 'yee', 'Superadmin', '1');
INSERT INTO `message_source` VALUES ('91', 'yee', 'System Info', '1');
INSERT INTO `message_source` VALUES ('92', 'yee', 'The changes have been saved.', '1');
INSERT INTO `message_source` VALUES ('93', 'yee', 'This e-mail already exists', '1');
INSERT INTO `message_source` VALUES ('94', 'yee', 'Title', '1');
INSERT INTO `message_source` VALUES ('95', 'yee', 'Token', '1');
INSERT INTO `message_source` VALUES ('96', 'yee', 'Trash', '1');
INSERT INTO `message_source` VALUES ('97', 'yee', 'Type', '1');
INSERT INTO `message_source` VALUES ('98', 'yee', 'URL', '1');
INSERT INTO `message_source` VALUES ('99', 'yee', 'Unpublish', '1');
INSERT INTO `message_source` VALUES ('100', 'yee', 'Update \"{item}\"', '1');
INSERT INTO `message_source` VALUES ('101', 'yee', 'Update', '1');
INSERT INTO `message_source` VALUES ('102', 'yee', 'Updated By', '1');
INSERT INTO `message_source` VALUES ('103', 'yee', 'Updated', '1');
INSERT INTO `message_source` VALUES ('104', 'yee', 'Uploaded', '1');
INSERT INTO `message_source` VALUES ('105', 'yee', 'User agent', '1');
INSERT INTO `message_source` VALUES ('106', 'yee', 'User', '1');
INSERT INTO `message_source` VALUES ('107', 'yee', 'Username', '1');
INSERT INTO `message_source` VALUES ('108', 'yee', 'Value', '1');
INSERT INTO `message_source` VALUES ('109', 'yee', 'View', '1');
INSERT INTO `message_source` VALUES ('110', 'yee', 'Visible', '1');
INSERT INTO `message_source` VALUES ('111', 'yee', 'Visit Time', '1');
INSERT INTO `message_source` VALUES ('112', 'yee', 'Wrong format. Enter valid IPs separated by comma', '1');
INSERT INTO `message_source` VALUES ('113', 'yee', 'Yee CMS Version', '1');
INSERT INTO `message_source` VALUES ('114', 'yee', 'Yee Core Version', '1');
INSERT INTO `message_source` VALUES ('115', 'yee', 'Yii Framework Version', '1');
INSERT INTO `message_source` VALUES ('116', 'yee', 'Your item has been updated.', '1');
INSERT INTO `message_source` VALUES ('117', 'yee', 'Your item has been created.', '1');
INSERT INTO `message_source` VALUES ('118', 'yee', 'Your item has been deleted.', '1');
INSERT INTO `message_source` VALUES ('119', 'yee', 'Male', '1');
INSERT INTO `message_source` VALUES ('120', 'yee', 'Female', '1');
INSERT INTO `message_source` VALUES ('121', 'yee', 'First Name', '1');
INSERT INTO `message_source` VALUES ('122', 'yee', 'Last Name', '1');
INSERT INTO `message_source` VALUES ('123', 'yee', 'Skype', '1');
INSERT INTO `message_source` VALUES ('124', 'yee', 'Phone', '1');
INSERT INTO `message_source` VALUES ('125', 'yee', 'Gender', '1');
INSERT INTO `message_source` VALUES ('126', 'yee', 'Birthday', '1');
INSERT INTO `message_source` VALUES ('127', 'yee', 'Birth month', '1');
INSERT INTO `message_source` VALUES ('128', 'yee', 'Birth year', '1');
INSERT INTO `message_source` VALUES ('129', 'yee', 'Short Info', '1');
INSERT INTO `message_source` VALUES ('130', 'yee/translation', 'Add New Source Message', '1');
INSERT INTO `message_source` VALUES ('131', 'yee/translation', 'Category', '1');
INSERT INTO `message_source` VALUES ('132', 'yee/translation', 'Create Message Source', '1');
INSERT INTO `message_source` VALUES ('133', 'yee/translation', 'Create New Category', '1');
INSERT INTO `message_source` VALUES ('134', 'yee/translation', 'Immutable', '1');
INSERT INTO `message_source` VALUES ('135', 'yee/translation', 'Message Translation', '1');
INSERT INTO `message_source` VALUES ('136', 'yee/translation', 'New Category Name', '1');
INSERT INTO `message_source` VALUES ('137', 'yee/translation', 'Please, select message group and language to view translations...', '1');
INSERT INTO `message_source` VALUES ('138', 'yee/translation', 'Source Message', '1');
INSERT INTO `message_source` VALUES ('139', 'yee/translation', 'Update Message Source', '1');
INSERT INTO `message_source` VALUES ('140', 'yee/translation', '{n, plural, =1{1 message} other{# messages}}', '1');
INSERT INTO `message_source` VALUES ('141', 'yee/media', 'Add files', '1');
INSERT INTO `message_source` VALUES ('142', 'yee/media', 'Album', '1');
INSERT INTO `message_source` VALUES ('143', 'yee/media', 'Albums', '1');
INSERT INTO `message_source` VALUES ('144', 'yee/media', 'All Media Items', '1');
INSERT INTO `message_source` VALUES ('145', 'yee/media', 'Alt Text', '1');
INSERT INTO `message_source` VALUES ('146', 'yee/media', 'Back to file manager', '1');
INSERT INTO `message_source` VALUES ('147', 'yee/media', 'Cancel upload', '1');
INSERT INTO `message_source` VALUES ('148', 'yee/media', 'Categories', '1');
INSERT INTO `message_source` VALUES ('149', 'yee/media', 'Category', '1');
INSERT INTO `message_source` VALUES ('150', 'yee/media', 'Changes have been saved.', '1');
INSERT INTO `message_source` VALUES ('151', 'yee/media', 'Changes haven\'t been saved.', '1');
INSERT INTO `message_source` VALUES ('152', 'yee/media', 'Create Category', '1');
INSERT INTO `message_source` VALUES ('153', 'yee/media', 'Current thumbnail sizes', '1');
INSERT INTO `message_source` VALUES ('154', 'yee/media', 'Dimensions', '1');
INSERT INTO `message_source` VALUES ('155', 'yee/media', 'Do resize thumbnails', '1');
INSERT INTO `message_source` VALUES ('156', 'yee/media', 'File Size', '1');
INSERT INTO `message_source` VALUES ('157', 'yee/media', 'Filename', '1');
INSERT INTO `message_source` VALUES ('158', 'yee/media', 'If you change the thumbnails sizes, it is strongly recommended resize image thumbnails.', '1');
INSERT INTO `message_source` VALUES ('159', 'yee/media', 'Image Settings', '1');
INSERT INTO `message_source` VALUES ('160', 'yee/media', 'Large size', '1');
INSERT INTO `message_source` VALUES ('161', 'yee/media', 'Manage Albums', '1');
INSERT INTO `message_source` VALUES ('162', 'yee/media', 'Manage Categories', '1');
INSERT INTO `message_source` VALUES ('163', 'yee/media', 'Media Activity', '1');
INSERT INTO `message_source` VALUES ('164', 'yee/media', 'Media Details', '1');
INSERT INTO `message_source` VALUES ('165', 'yee/media', 'Media', '1');
INSERT INTO `message_source` VALUES ('166', 'yee/media', 'Medium size', '1');
INSERT INTO `message_source` VALUES ('167', 'yee/media', 'No images found.', '1');
INSERT INTO `message_source` VALUES ('168', 'yee/media', 'Original', '1');
INSERT INTO `message_source` VALUES ('169', 'yee/media', 'Please, select file to view details.', '1');
INSERT INTO `message_source` VALUES ('170', 'yee/media', 'Select image size', '1');
INSERT INTO `message_source` VALUES ('171', 'yee/media', 'Small size', '1');
INSERT INTO `message_source` VALUES ('172', 'yee/media', 'Sorry, [{filetype}] file type is not permitted!', '1');
INSERT INTO `message_source` VALUES ('173', 'yee/media', 'Start upload', '1');
INSERT INTO `message_source` VALUES ('174', 'yee/media', 'Thumbnails settings', '1');
INSERT INTO `message_source` VALUES ('175', 'yee/media', 'Thumbnails sizes has been resized successfully!', '1');
INSERT INTO `message_source` VALUES ('176', 'yee/media', 'Thumbnails', '1');
INSERT INTO `message_source` VALUES ('177', 'yee/media', 'Update Category', '1');
INSERT INTO `message_source` VALUES ('178', 'yee/media', 'Updated By', '1');
INSERT INTO `message_source` VALUES ('179', 'yee/media', 'Upload New File', '1');
INSERT INTO `message_source` VALUES ('180', 'yee/media', 'Uploaded By', '1');
INSERT INTO `message_source` VALUES ('181', 'yee/menu', 'Menu', '1');
INSERT INTO `message_source` VALUES ('182', 'yee/menu', 'Menus', '1');
INSERT INTO `message_source` VALUES ('183', 'yee/menu', 'Link ID can only contain lowercase alphanumeric characters, underscores and dashes.', '1');
INSERT INTO `message_source` VALUES ('184', 'yee/menu', 'Parent Link', '1');
INSERT INTO `message_source` VALUES ('185', 'yee/menu', 'Always Visible', '1');
INSERT INTO `message_source` VALUES ('186', 'yee/menu', 'No Parent', '1');
INSERT INTO `message_source` VALUES ('187', 'yee/menu', 'Create Menu Link', '1');
INSERT INTO `message_source` VALUES ('188', 'yee/menu', 'Update Menu Link', '1');
INSERT INTO `message_source` VALUES ('189', 'yee/menu', 'Menu Links', '1');
INSERT INTO `message_source` VALUES ('190', 'yee/menu', 'Add New Menu', '1');
INSERT INTO `message_source` VALUES ('191', 'yee/menu', 'Add New Link', '1');
INSERT INTO `message_source` VALUES ('192', 'yee/menu', 'An error occurred during saving menu!', '1');
INSERT INTO `message_source` VALUES ('193', 'yee/menu', 'The changes have been saved.', '1');
INSERT INTO `message_source` VALUES ('194', 'yee/menu', 'Please, select menu to view menu links...', '1');
INSERT INTO `message_source` VALUES ('195', 'yee/menu', 'Selected menu doesn\'t contain any link. Click \"Add New Link\" to create a link for this menu.', '1');
INSERT INTO `message_source` VALUES ('196', 'yee/page', 'Page', '1');
INSERT INTO `message_source` VALUES ('197', 'yee/page', 'Pages', '1');
INSERT INTO `message_source` VALUES ('198', 'yee/page', 'Create Page', '1');
INSERT INTO `message_source` VALUES ('199', 'yee/post', 'Create Tag', '1');
INSERT INTO `message_source` VALUES ('200', 'yee/post', 'Update Tag', '1');
INSERT INTO `message_source` VALUES ('201', 'yee/post', 'No posts found.', '1');
INSERT INTO `message_source` VALUES ('202', 'yee/post', 'Post', '1');
INSERT INTO `message_source` VALUES ('203', 'yee/post', 'Posted in', '1');
INSERT INTO `message_source` VALUES ('204', 'yee/post', 'Posts Activity', '1');
INSERT INTO `message_source` VALUES ('205', 'yee/post', 'Posts', '1');
INSERT INTO `message_source` VALUES ('206', 'yee/post', 'Tag', '1');
INSERT INTO `message_source` VALUES ('207', 'yee/post', 'Tags', '1');
INSERT INTO `message_source` VALUES ('208', 'yee/post', 'Thumbnail', '1');
INSERT INTO `message_source` VALUES ('209', 'yee/settings', 'General Settings', '1');
INSERT INTO `message_source` VALUES ('210', 'yee/settings', 'Reading Settings', '1');
INSERT INTO `message_source` VALUES ('211', 'yee/settings', 'Site Title', '1');
INSERT INTO `message_source` VALUES ('212', 'yee/settings', 'Site Description', '1');
INSERT INTO `message_source` VALUES ('213', 'yee/settings', 'Admin Email', '1');
INSERT INTO `message_source` VALUES ('214', 'yee/settings', 'Timezone', '1');
INSERT INTO `message_source` VALUES ('215', 'yee/settings', 'Date Format', '1');
INSERT INTO `message_source` VALUES ('216', 'yee/settings', 'Time Format', '1');
INSERT INTO `message_source` VALUES ('217', 'yee/settings', 'Page Size', '1');
INSERT INTO `message_source` VALUES ('218', 'yee/user', 'Child permissions', '1');
INSERT INTO `message_source` VALUES ('219', 'yee/user', 'Child roles', '1');
INSERT INTO `message_source` VALUES ('220', 'yee/user', 'Create Permission Group', '1');
INSERT INTO `message_source` VALUES ('221', 'yee/user', 'Create Permission', '1');
INSERT INTO `message_source` VALUES ('222', 'yee/user', 'Create Role', '1');
INSERT INTO `message_source` VALUES ('223', 'yee/user', 'Create User', '1');
INSERT INTO `message_source` VALUES ('224', 'yee/user', 'Log №{id}', '1');
INSERT INTO `message_source` VALUES ('225', 'yee/user', 'No users found.', '1');
INSERT INTO `message_source` VALUES ('226', 'yee/user', 'Password', '1');
INSERT INTO `message_source` VALUES ('227', 'yee/user', 'Permission Groups', '1');
INSERT INTO `message_source` VALUES ('228', 'yee/user', 'Permission', '1');
INSERT INTO `message_source` VALUES ('229', 'yee/user', 'Permissions for \"{role}\" role', '1');
INSERT INTO `message_source` VALUES ('230', 'yee/user', 'Permissions', '1');
INSERT INTO `message_source` VALUES ('231', 'yee/user', 'Refresh routes', '1');
INSERT INTO `message_source` VALUES ('232', 'yee/user', 'Registration date', '1');
INSERT INTO `message_source` VALUES ('233', 'yee/user', 'Role', '1');
INSERT INTO `message_source` VALUES ('234', 'yee/user', 'Roles and Permissions for \"{user}\"', '1');
INSERT INTO `message_source` VALUES ('235', 'yee/user', 'Roles', '1');
INSERT INTO `message_source` VALUES ('236', 'yee/user', 'Routes', '1');
INSERT INTO `message_source` VALUES ('237', 'yee/user', 'Search route', '1');
INSERT INTO `message_source` VALUES ('238', 'yee/user', 'Show all', '1');
INSERT INTO `message_source` VALUES ('239', 'yee/user', 'Show only selected', '1');
INSERT INTO `message_source` VALUES ('240', 'yee/user', 'Update Permission Group', '1');
INSERT INTO `message_source` VALUES ('241', 'yee/user', 'Update Permission', '1');
INSERT INTO `message_source` VALUES ('242', 'yee/user', 'Update Role', '1');
INSERT INTO `message_source` VALUES ('243', 'yee/user', 'Update User Password', '1');
INSERT INTO `message_source` VALUES ('244', 'yee/user', 'Update User', '1');
INSERT INTO `message_source` VALUES ('245', 'yee/user', 'User not found', '1');
INSERT INTO `message_source` VALUES ('246', 'yee/user', 'User', '1');
INSERT INTO `message_source` VALUES ('247', 'yee/user', 'Users', '1');
INSERT INTO `message_source` VALUES ('248', 'yee/user', 'Visit Log', '1');
INSERT INTO `message_source` VALUES ('249', 'yee/user', 'You can not change own permissions', '1');
INSERT INTO `message_source` VALUES ('250', 'yee/user', 'You can\'t update own permissions!', '1');
INSERT INTO `message_source` VALUES ('251', 'yee/user', '{permission} Permission Settings', '1');
INSERT INTO `message_source` VALUES ('252', 'yee/user', '{permission} Role Settings', '1');
INSERT INTO `message_source` VALUES ('253', 'yee/auth', 'Are you sure you want to delete your profile picture?', '1');
INSERT INTO `message_source` VALUES ('254', 'yee/auth', 'Are you sure you want to unlink this authorization?', '1');
INSERT INTO `message_source` VALUES ('255', 'yee/auth', 'Authentication error occurred.', '1');
INSERT INTO `message_source` VALUES ('256', 'yee/auth', 'Authorization', '1');
INSERT INTO `message_source` VALUES ('257', 'yee/auth', 'Authorized Services', '1');
INSERT INTO `message_source` VALUES ('258', 'yee/auth', 'Captcha', '1');
INSERT INTO `message_source` VALUES ('259', 'yee/auth', 'Change profile picture', '1');
INSERT INTO `message_source` VALUES ('260', 'yee/auth', 'Check your E-mail for further instructions', '1');
INSERT INTO `message_source` VALUES ('261', 'yee/auth', 'Check your e-mail {email} for instructions to activate account', '1');
INSERT INTO `message_source` VALUES ('262', 'yee/auth', 'Click to connect with service', '1');
INSERT INTO `message_source` VALUES ('263', 'yee/auth', 'Click to unlink service', '1');
INSERT INTO `message_source` VALUES ('264', 'yee/auth', 'Confirm E-mail', '1');
INSERT INTO `message_source` VALUES ('265', 'yee/auth', 'Confirm', '1');
INSERT INTO `message_source` VALUES ('266', 'yee/auth', 'Could not send confirmation email', '1');
INSERT INTO `message_source` VALUES ('267', 'yee/auth', 'Current password', '1');
INSERT INTO `message_source` VALUES ('268', 'yee/auth', 'E-mail confirmation for', '1');
INSERT INTO `message_source` VALUES ('269', 'yee/auth', 'E-mail confirmed', '1');
INSERT INTO `message_source` VALUES ('270', 'yee/auth', 'E-mail is invalid', '1');
INSERT INTO `message_source` VALUES ('271', 'yee/auth', 'E-mail with activation link has been sent to <b>{email}</b>. This link will expire in {minutes} min.', '1');
INSERT INTO `message_source` VALUES ('272', 'yee/auth', 'E-mail', '1');
INSERT INTO `message_source` VALUES ('273', 'yee/auth', 'Forgot password?', '1');
INSERT INTO `message_source` VALUES ('274', 'yee/auth', 'Incorrect username or password', '1');
INSERT INTO `message_source` VALUES ('275', 'yee/auth', 'Login has been taken', '1');
INSERT INTO `message_source` VALUES ('276', 'yee/auth', 'Login', '1');
INSERT INTO `message_source` VALUES ('277', 'yee/auth', 'Logout', '1');
INSERT INTO `message_source` VALUES ('278', 'yee/auth', 'Non Authorized Services', '1');
INSERT INTO `message_source` VALUES ('279', 'yee/auth', 'Password has been updated', '1');
INSERT INTO `message_source` VALUES ('280', 'yee/auth', 'Password recovery', '1');
INSERT INTO `message_source` VALUES ('281', 'yee/auth', 'Password reset for', '1');
INSERT INTO `message_source` VALUES ('282', 'yee/auth', 'Password', '1');
INSERT INTO `message_source` VALUES ('283', 'yee/auth', 'Registration - confirm your e-mail', '1');
INSERT INTO `message_source` VALUES ('284', 'yee/auth', 'Registration', '1');
INSERT INTO `message_source` VALUES ('285', 'yee/auth', 'Remember me', '1');
INSERT INTO `message_source` VALUES ('286', 'yee/auth', 'Remove profile picture', '1');
INSERT INTO `message_source` VALUES ('287', 'yee/auth', 'Repeat password', '1');
INSERT INTO `message_source` VALUES ('288', 'yee/auth', 'Reset Password', '1');
INSERT INTO `message_source` VALUES ('289', 'yee/auth', 'Reset', '1');
INSERT INTO `message_source` VALUES ('290', 'yee/auth', 'Save Profile', '1');
INSERT INTO `message_source` VALUES ('291', 'yee/auth', 'Save profile picture', '1');
INSERT INTO `message_source` VALUES ('292', 'yee/auth', 'Set Password', '1');
INSERT INTO `message_source` VALUES ('293', 'yee/auth', 'Set Username', '1');
INSERT INTO `message_source` VALUES ('294', 'yee/auth', 'Signup', '1');
INSERT INTO `message_source` VALUES ('295', 'yee/auth', 'This E-mail already exists', '1');
INSERT INTO `message_source` VALUES ('296', 'yee/auth', 'Token not found. It may be expired', '1');
INSERT INTO `message_source` VALUES ('297', 'yee/auth', 'Token not found. It may be expired. Try reset password once more', '1');
INSERT INTO `message_source` VALUES ('298', 'yee/auth', 'Too many attempts', '1');
INSERT INTO `message_source` VALUES ('299', 'yee/auth', 'Unable to send message for email provided', '1');
INSERT INTO `message_source` VALUES ('300', 'yee/auth', 'Update Password', '1');
INSERT INTO `message_source` VALUES ('301', 'yee/auth', 'User Profile', '1');
INSERT INTO `message_source` VALUES ('302', 'yee/auth', 'User with the same email as in {client} account already exists but isn\'t linked to it. Login using email first to link it.', '1');
INSERT INTO `message_source` VALUES ('303', 'yee/auth', 'The username should contain only Latin letters, numbers and the following characters: \"-\" and \"_\".', '1');
INSERT INTO `message_source` VALUES ('304', 'yee/auth', 'Username contains not allowed characters or words.', '1');
INSERT INTO `message_source` VALUES ('305', 'yee/auth', 'Wrong password', '1');
INSERT INTO `message_source` VALUES ('306', 'yee/auth', 'You could not login from this IP', '1');
INSERT INTO `message_source` VALUES ('307', 'yee/seo', 'Create SEO Record', '1');
INSERT INTO `message_source` VALUES ('308', 'yee/seo', 'Follow', '1');
INSERT INTO `message_source` VALUES ('309', 'yee/seo', 'Index', '1');
INSERT INTO `message_source` VALUES ('310', 'yee/seo', 'Keywords', '1');
INSERT INTO `message_source` VALUES ('311', 'yee/seo', 'SEO', '1');
INSERT INTO `message_source` VALUES ('312', 'yee/seo', 'Search Engine Optimization', '1');
INSERT INTO `message_source` VALUES ('313', 'yee/seo', 'Update SEO Record', '1');

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `alias` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '@app/migrations', '1502441185');
INSERT INTO `migration` VALUES ('m130524_201442_init', '@app/migrations', '1502441188');
INSERT INTO `migration` VALUES ('m150319_150657_alter_user_table', '@yeesoft/yii2-yee-core/migrations/', '1502441193');
INSERT INTO `migration` VALUES ('m150319_155941_init_yee_core', '@yeesoft/yii2-yee-core/migrations/', '1502441207');
INSERT INTO `migration` VALUES ('m150319_184824_init_settings', '@yeesoft/yii2-yee-core/migrations/', '1502441208');
INSERT INTO `migration` VALUES ('m150319_194321_init_menus', '@yeesoft/yii2-yee-core/migrations/', '1502441221');
INSERT INTO `migration` VALUES ('m150320_102452_init_translations', '@yeesoft/yii2-yee-translation/migrations/', '1502441224');
INSERT INTO `migration` VALUES ('m150628_124401_create_media_table', '@yeesoft/yii2-yee-media/migrations/', '1502441243');
INSERT INTO `migration` VALUES ('m150630_121101_create_post_table', '@yeesoft/yii2-yee-post/migrations/', '1502441258');
INSERT INTO `migration` VALUES ('m150703_182055_create_auth_table', '@yeesoft/yii2-yee-auth/migrations/', '1502441259');
INSERT INTO `migration` VALUES ('m150706_175101_create_comment_table', '@yeesoft/yii2-comments/migrations/', '1502441261');
INSERT INTO `migration` VALUES ('m150719_154955_add_setting_menu_links', '@yeesoft/yii2-yee-settings/migrations/', '1502441264');
INSERT INTO `migration` VALUES ('m150719_182533_add_menu_and_links', '@yeesoft/yii2-yee-menu/migrations/', '1502441264');
INSERT INTO `migration` VALUES ('m150727_175300_add_comments_menu_links', '@yeesoft/yii2-yee-comment/migrations/', '1502441264');
INSERT INTO `migration` VALUES ('m150729_121634_add_user_menu_links', '@yeesoft/yii2-yee-user/migrations/', '1502441265');
INSERT INTO `migration` VALUES ('m150729_122614_add_post_menu_links', '@yeesoft/yii2-yee-post/migrations/', '1502441265');
INSERT INTO `migration` VALUES ('m150729_131014_add_media_menu_links', '@yeesoft/yii2-yee-media/migrations/', '1502441266');
INSERT INTO `migration` VALUES ('m150731_150101_create_page_table', '@yeesoft/yii2-yee-page/migrations/', '1502441269');
INSERT INTO `migration` VALUES ('m150731_150644_add_page_menu_links', '@yeesoft/yii2-yee-page/migrations/', '1502441270');
INSERT INTO `migration` VALUES ('m150821_140141_add_core_permissions', '@yeesoft/yii2-yee-core/migrations/', '1502441270');
INSERT INTO `migration` VALUES ('m150825_202231_add_post_permissions', '@yeesoft/yii2-yee-post/migrations/', '1502441270');
INSERT INTO `migration` VALUES ('m150825_205531_add_user_permissions', '@yeesoft/yii2-yee-user/migrations/', '1502441271');
INSERT INTO `migration` VALUES ('m150825_211322_add_menu_permissions', '@yeesoft/yii2-yee-menu/migrations/', '1502441271');
INSERT INTO `migration` VALUES ('m150825_212310_add_settings_permissions', '@yeesoft/yii2-yee-settings/migrations/', '1502441271');
INSERT INTO `migration` VALUES ('m150825_212941_add_comments_permissions', '@yeesoft/yii2-yee-comment/migrations/', '1502441271');
INSERT INTO `migration` VALUES ('m150825_213610_add_media_permissions', '@yeesoft/yii2-yee-media/migrations/', '1502441271');
INSERT INTO `migration` VALUES ('m150825_220620_add_page_permissions', '@yeesoft/yii2-yee-page/migrations/', '1502441272');
INSERT INTO `migration` VALUES ('m151116_212614_add_translations_menu_links', '@yeesoft/yii2-yee-translation/migrations/', '1502441272');
INSERT INTO `migration` VALUES ('m151121_091144_i18n_yee_source', '@yeesoft/yii2-yee-core/migrations/', '1502441273');
INSERT INTO `migration` VALUES ('m151121_131210_add_translation_permissions', '@yeesoft/yii2-yee-translation/migrations/', '1502441273');
INSERT INTO `migration` VALUES ('m151121_184634_i18n_yee_translation_source', '@yeesoft/yii2-yee-translation/migrations/', '1502441274');
INSERT INTO `migration` VALUES ('m151121_225504_i18n_yee_media_source', '@yeesoft/yii2-yee-media/migrations/', '1502441274');
INSERT INTO `migration` VALUES ('m151121_232115_i18n_yee_menu_source', '@yeesoft/yii2-yee-menu/migrations/', '1502441274');
INSERT INTO `migration` VALUES ('m151121_233615_i18n_yee_page_source', '@yeesoft/yii2-yee-page/migrations/', '1502441274');
INSERT INTO `migration` VALUES ('m151121_233715_i18n_yee_post_source', '@yeesoft/yii2-yee-post/migrations/', '1502441274');
INSERT INTO `migration` VALUES ('m151121_235015_i18n_yee_settings_source', '@yeesoft/yii2-yee-settings/migrations/', '1502441274');
INSERT INTO `migration` VALUES ('m151121_235512_i18n_yee_user_source', '@yeesoft/yii2-yee-user/migrations/', '1502441275');
INSERT INTO `migration` VALUES ('m151126_061233_i18n_yee_auth_source', '@yeesoft/yii2-yee-auth/migrations/', '1502441275');
INSERT INTO `migration` VALUES ('m151226_230101_create_seo_table', '@yeesoft/yii2-yee-seo/migrations/', '1502441279');
INSERT INTO `migration` VALUES ('m151226_231101_add_seo_menu_links', '@yeesoft/yii2-yee-seo/migrations/', '1502441279');
INSERT INTO `migration` VALUES ('m151226_233401_add_seo_permissions', '@yeesoft/yii2-yee-seo/migrations/', '1502441279');
INSERT INTO `migration` VALUES ('m151226_234401_i18n_yee_seo_source', '@yeesoft/yii2-yee-seo/migrations/', '1502441279');
INSERT INTO `migration` VALUES ('m160207_123123_add_super_parent_id', '@yeesoft/yii2-comments/migrations/', '1502441281');
INSERT INTO `migration` VALUES ('m160414_212551_add_view_page', '@yeesoft/yii2-yee-page/migrations/', '1502441283');
INSERT INTO `migration` VALUES ('m160414_212558_add_view_post', '@yeesoft/yii2-yee-post/migrations/', '1502441285');
INSERT INTO `migration` VALUES ('m160426_122854_create_uploader_images_table', '@yeesoft/yii2-yee-media/migrations/', '1502441287');
INSERT INTO `migration` VALUES ('m160530_224510_add_url_field', '@yeesoft/yii2-comments/migrations/', '1502441289');
INSERT INTO `migration` VALUES ('m160605_214907_create_tag_table', '@yeesoft/yii2-yee-post/migrations/', '1502441297');
INSERT INTO `migration` VALUES ('m160605_215105_init_tag_settings', '@yeesoft/yii2-yee-post/migrations/', '1502441298');
INSERT INTO `migration` VALUES ('m160610_120101_init_demo', '@app/migrations', '1502441302');
INSERT INTO `migration` VALUES ('m160831_224932_alter_user_table', '@yeesoft/yii2-yee-core/migrations/', '1502441312');
INSERT INTO `migration` VALUES ('m160903_113810_update_auth_foreign_key', '@yeesoft/yii2-yee-auth/migrations/', '1502441313');

-- ----------------------------
-- Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(1) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'page',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `page_slug` (`slug`),
  KEY `page_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', 'test', '1', '0', '1440720000', '1440763228', '1440771930', '1', '1', '1', 'page', 'main');

-- ----------------------------
-- Table structure for `page_lang`
-- ----------------------------
DROP TABLE IF EXISTS `page_lang`;
CREATE TABLE `page_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `page_lang_post_id` (`page_id`),
  KEY `page_lang_language` (`language`),
  CONSTRAINT `fk_page_lang` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page_lang
-- ----------------------------
INSERT INTO `page_lang` VALUES ('1', '1', 'en-US', 'Test Page', '<p style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id ullamcorper nibh, id blandit ante. Suspendisse non ante commodo, finibus nibh at, sollicitudin felis. Aliquam interdum eros eget tempor porta. Quisque viverra velit magna, ac eleifend mi vehicula nec. Curabitur sollicitudin metus eget odio posuere pulvinar. Nullam vestibulum massa ac dolor mattis pharetra. Vestibulum finibus non massa ut cursus.</p><p style=\"text-align: justify;\">Proin eget ullamcorper elit, ac luctus ex. Pellentesque mattis nibh nec nunc fermentum lobortis. Cras malesuada ipsum eget massa pulvinar euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pellentesque, tortor in efficitur semper, tellus lorem blandit augue, sed euismod purus velit nec libero. Pellentesque dictum faucibus augue, ac rutrum velit. Quisque tristique neque sit amet turpis consectetur rutrum. Aliquam ac vulputate mauris.</p>');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `thumbnail` varchar(255) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(1) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'post',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `post_slug` (`slug`),
  KEY `post_category_id` (`category_id`),
  KEY `post_status` (`status`),
  KEY `fk_page_created_by` (`created_by`),
  KEY `fk_page_updated_by` (`updated_by`),
  CONSTRAINT `fk_page_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_page_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'integer-id-ullamcorper-nibh', '1', '1', '1', null, '1440720000', '1440763228', '1440771930', '30', '30', '1', 'post', 'main');
INSERT INTO `post` VALUES ('2', 'proin-eget-ullamcorper-elit', '1', '1', '1', null, '1440720000', '1440763228', '1440771930', '30', '30', '1', 'post', 'main');

-- ----------------------------
-- Table structure for `post_category`
-- ----------------------------
DROP TABLE IF EXISTS `post_category`;
CREATE TABLE `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `left_border` int(11) NOT NULL,
  `right_border` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_category_slug` (`slug`),
  KEY `post_category_visible` (`visible`),
  KEY `left_border` (`left_border`,`right_border`),
  KEY `right_border` (`right_border`),
  KEY `fk_post_category_created_by` (`created_by`),
  KEY `fk_post_category_updated_by` (`updated_by`),
  CONSTRAINT `fk_post_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_category
-- ----------------------------
INSERT INTO `post_category` VALUES ('1', 'root', '0', '1502441249', null, null, null, '0', '2147483647', '0');
INSERT INTO `post_category` VALUES ('2', 'first-category', '1', '1502441299', '1502441299', '30', '30', '42107523', '84215044', '1');

-- ----------------------------
-- Table structure for `post_category_lang`
-- ----------------------------
DROP TABLE IF EXISTS `post_category_lang`;
CREATE TABLE `post_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_category_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `post_category_lang_id` (`post_category_id`),
  KEY `post_category_lang_language` (`language`),
  CONSTRAINT `fk_post_category_lang` FOREIGN KEY (`post_category_id`) REFERENCES `post_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_category_lang
-- ----------------------------
INSERT INTO `post_category_lang` VALUES ('1', '1', 'en-US', 'First Category', null);

-- ----------------------------
-- Table structure for `post_lang`
-- ----------------------------
DROP TABLE IF EXISTS `post_lang`;
CREATE TABLE `post_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `post_lang_post_id` (`post_id`),
  KEY `post_lang_language` (`language`),
  CONSTRAINT `fk_post_lang` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_lang
-- ----------------------------
INSERT INTO `post_lang` VALUES ('1', '1', 'en-US', 'Integer id ullamcorper nibh', '<p style=\"text-align: justify;\">Integer id ullamcorper nibh, id blandit ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse non ante commodo, finibus nibh at, sollicitudin felis. Aliquam interdum eros eget tempor porta. Quisque viverra velit magna, ac eleifend mi vehicula nec. Curabitur sollicitudin metus eget odio posuere pulvinar. Nullam vestibulum massa ac dolor mattis pharetra. Vestibulum finibus non massa ut cursus.</p><p style=\"text-align: justify;\">Proin eget ullamcorper elit, ac luctus ex. Pellentesque mattis nibh nec nunc fermentum lobortis. Cras malesuada ipsum eget massa pulvinar euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pellentesque, tortor in efficitur semper, tellus lorem blandit augue, sed euismod purus velit nec libero. Pellentesque dictum faucibus augue, ac rutrum velit. Quisque tristique neque sit amet turpis consectetur rutrum. Aliquam ac vulputate mauris.</p>');
INSERT INTO `post_lang` VALUES ('2', '2', 'en-US', 'Proin eget ullamcorper elit', '<p style=\"text-align: justify;\">Suspendisse non ante commodo, finibus nibh at, sollicitudin felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id ullamcorper nibh, id blandit ante. Aliquam interdum eros eget tempor porta. Quisque viverra velit magna, ac eleifend mi vehicula nec. Curabitur sollicitudin metus eget odio posuere pulvinar. Nullam vestibulum massa ac dolor mattis pharetra. Vestibulum finibus non massa ut cursus.</p><p style=\"text-align: justify;\">Proin eget ullamcorper elit, ac luctus ex. Pellentesque mattis nibh nec nunc fermentum lobortis. Cras malesuada ipsum eget massa pulvinar euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pellentesque, tortor in efficitur semper, tellus lorem blandit augue, sed euismod purus velit nec libero. Pellentesque dictum faucibus augue, ac rutrum velit. Quisque tristique neque sit amet turpis consectetur rutrum. Aliquam ac vulputate mauris.</p>');

-- ----------------------------
-- Table structure for `post_tag`
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_slug` (`slug`),
  KEY `fk_post_tag_created_by` (`created_by`),
  KEY `fk_post_tag_updated_by` (`updated_by`),
  CONSTRAINT `fk_post_tag_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tag_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO `post_tag` VALUES ('1', 'yee-cms', '1502441300', '1502441300', '30', '30');
INSERT INTO `post_tag` VALUES ('2', 'yii2', '1502441300', '1502441300', '30', '30');

-- ----------------------------
-- Table structure for `post_tag_lang`
-- ----------------------------
DROP TABLE IF EXISTS `post_tag_lang`;
CREATE TABLE `post_tag_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_tag_id` int(11) DEFAULT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_lang_id` (`post_tag_id`),
  KEY `post_tag_lang_language` (`language`),
  CONSTRAINT `fk_post_tag_lang` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tag_lang
-- ----------------------------
INSERT INTO `post_tag_lang` VALUES ('1', '1', 'en-US', 'YeeCMS');
INSERT INTO `post_tag_lang` VALUES ('2', '2', 'en-US', 'Yii2');

-- ----------------------------
-- Table structure for `post_tag_post`
-- ----------------------------
DROP TABLE IF EXISTS `post_tag_post`;
CREATE TABLE `post_tag_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_tag_post_id` (`post_id`),
  KEY `fk_post_tag_tag_id` (`tag_id`),
  CONSTRAINT `fk_post_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `post_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tag_post
-- ----------------------------
INSERT INTO `post_tag_post` VALUES ('1', '1', '1');
INSERT INTO `post_tag_post` VALUES ('2', '1', '2');
INSERT INTO `post_tag_post` VALUES ('3', '2', '1');

-- ----------------------------
-- Table structure for `seo`
-- ----------------------------
DROP TABLE IF EXISTS `seo`;
CREATE TABLE `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(127) NOT NULL DEFAULT '',
  `keywords` text,
  `description` text,
  `index` smallint(6) NOT NULL DEFAULT '1',
  `follow` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `seo_url` (`url`),
  KEY `seo_created_by` (`created_by`),
  KEY `seo_author` (`created_by`),
  KEY `fk_seo_updated_by` (`updated_by`),
  CONSTRAINT `fk_seo_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_seo_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seo
-- ----------------------------
INSERT INTO `seo` VALUES ('1', '/en', 'Homepage', 'Site Owner', 'yii2, cms, yeecms', 'Seo meta description', '1', '1', '1452544164', '1452545049', '30', '30');

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(64) DEFAULT 'general',
  `key` varchar(64) NOT NULL,
  `language` varchar(6) DEFAULT NULL,
  `value` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `setting_group_lang` (`group`,`key`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `superadmin` int(6) DEFAULT '0',
  `registration_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bind_to_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirmed` int(1) DEFAULT '0',
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8_unicode_ci,
  `first_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(124) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_day` int(2) DEFAULT NULL,
  `birth_month` int(2) DEFAULT NULL,
  `birth_year` int(4) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('30', 'chabibdev', 'eGO71F5kPV5m3IgvsQenYXGYM3yUtv7l', '$2y$13$dEeNXN0mMiztDXdKmmM.ruSs9tsd5fuLkajzvArnkSsEGT5bP1pee', '', 'chabibdev@gmail.com', '10', '1502422491', '1502422491', '1', '', '', '0', '', '103.213.130.164', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_setting`
-- ----------------------------
DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `user_setting_user_key` (`user_id`,`key`),
  CONSTRAINT `fk_user_id_user_setting_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `user_visit_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` varchar(5) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `os` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visit_log_user_id` (`user_id`),
  CONSTRAINT `fk_user_id_user_visit_log_table` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_visit_log
-- ----------------------------
INSERT INTO `user_visit_log` VALUES ('1', '598d70a2eb942', '127.0.0.1', 'en', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', 'Chrome', 'Windows', '30', '1502441634');
