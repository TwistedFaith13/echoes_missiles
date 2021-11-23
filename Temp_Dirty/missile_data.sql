DROP TABLE IF EXISTS `echoes_db`.`def_sizes`;
DROP TABLE IF EXISTS `echoes_db`.`def_missile_types`;
DROP TABLE IF EXISTS `echoes_db`.`def_missiles`;

CREATE TABLE `echoes_db`.`def_sizes` (
	`ms_id` tinyint(3) unsigned NOT NULL COMMENT 'Internal ID. Only for correlation',
	`ms_display_name` char(10) NOT NULL COMMENT 'Human readable name for sizes.',
	PRIMARY KEY (`ms_id`),
	UNIQUE KEY `Duplicate Check` (`ms_display_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Baseline Size Table';

CREATE TABLE `echoes_db`.`def_missile_types` (
	`mt_id` tinyint(3) unsigned NOT NULL COMMENT 'Internal ID. Only for correlation',
	`mt_display_name` char(10) NOT NULL COMMENT 'Human readable name for missile types',
	PRIMARY KEY (`mt_id`),
	UNIQUE KEY `Duplicate Check` (`mt_display_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Baseline Missile Type Table';

CREATE TABLE `echoes_db`.`def_missiles` (
	`m_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal ID. Only for correlation',
	`m_size` tinyint(3) unsigned NOT NULL COMMENT 'Foreign key pointing to def_sizes',
	`m_type` tinyint(3) unsigned NOT NULL COMMENT 'Foreign key pointing to def_missile_types',
	`m_tech_level` tinyint(3) unsigned NOT NULL COMMENT 'Minimum tech level to equip',
	`m_meta_level` tinyint(3) unsigned NOT NULL COMMENT 'Meta level of projectile',
	`m_name` char(20) NOT NULL COMMENT 'Projectile display name',
	`m_dps` decimal(5,2) NOT NULL COMMENT 'Projectile DPS (sum of all damage types divided by activation time)',
	`m_em_dmg` decimal(5,2) NOT NULL COMMENT 'Projectile ElectroMagnetic damage',
	`m_th_dmg` decimal(5,2) NOT NULL COMMENT 'Projectile Thermal damage',
	`m_ki_dmg` decimal(5,2) NOT NULL COMMENT 'Projectile Kinetic damage',
	`m_ex_dmg` decimal(5,2) NOT NULL COMMENT 'Projectile Explosive damage',
	`m_velocity` smallint(5) unsigned NOT NULL COMMENT 'Projectile velocity (affects range, ability to hit fast target) unit:m/s',
	`m_activation_time` decimal(4,2) NOT NULL COMMENT 'Weapon cycle time (affects DPS) unit:s',
	`m_explosion_velocity` tinyint(3) unsigned NOT NULL COMMENT 'Explosion velocity (affects ability to hit fast targets) unit:m/s',
	`m_explosion_radius` smallint(5) unsigned NOT NULL COMMENT 'Explosion radius (affects ability to hit small targets) unit:m',
	`m_flight_time` decimal(4,2) NOT NULL COMMENT 'Projectile flight time (affects range) unit:s',
	`m_range` decimal(5,2) NOT NULL COMMENT 'Projectile range (velocity multiplied by time / 1000) unit:km',
	PRIMARY KEY (`m_id`),
	KEY `Only Size` (`m_size`),
	KEY `Only Type` (`m_type`),
	KEY `Both Size and Type` (`m_size`,`m_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Baseline Missile Details Table';

INSERT INTO `echoes_db`.`def_sizes`
	(`ms_id`, `ms_display_name`)
VALUES
	(1, 'Small'),
	(2, 'Medium'),
	(3, 'Large');

INSERT INTO `echoes_db`.`def_missile_types`
	(`mt_id`, `mt_display_name`)
VALUES
	(1, "Rapid"),
	(2, "Missile"),
	(3, "Torpedo");

INSERT INTO `echoes_db`.`def_missiles`
	(`m_size`, `m_type`, `m_tech_level`, `m_meta_level`, `m_name`, `m_dps`, `M_em_dmg`, `m_th_dmg`, `m_ki_dmg`, `m_ex_dmg`, `m_velocity`, `m_activation_time`, `m_explosion_velocity`, `m_explosion_radius`, `m_flight_time`, `m_range`)
VALUES
	(1, 2, 7, 3, "Mk7", 19.53, 62.51, 62.51, 62.51, 62.51, 3750, 12.8, 170, 40, 4, 15),
	(1, 2, 9, 4, "Mk9", 20.85, 66.71, 66.71, 66.71, 66.71, 3750, 12.8, 170, 40, 4, 15),
	(1, 2, 0, 5, "Gallows", 21.91, 70.11, 70.11, 70.11, 70.11, 3750, 12.8, 170, 40, 4, 15),
	(1, 2, 0, 6, "Caldari Navy", 22.82, 73.01, 73.01, 73.01, 73.01, 3750, 12.8, 170, 40, 4, 15),
	(1, 2, 0, 6, "Republic Fleet", 22.82, 73.01, 73.01, 73.01, 73.01, 3750, 12.8, 170, 40, 4, 15),
	(1, 2, 0, 8, "Discipline", 24.28, 77.7, 77.7, 77.7, 77.7, 3750, 12.8, 170, 40, 4, 15),
	(1, 2, 0, 11, "Pithi C-Type", 25.97, 83.09, 83.09, 83.09, 83.09, 3750, 12.8, 170, 40, 4, 15),
	(1, 3, 7, 3, "Mk7", 25.13, 25.13, 25.13, 25.13, 25.13, 2250, 4, 150, 20, 2.4, 5.4),
	(1, 3, 9, 4, "Mk9", 26.8, 26.8, 26.8, 26.8, 26.8, 2250, 4, 150, 20, 2.4, 5.4),
	(1, 3, 0, 5, "Balefire", 28.17, 28.17, 28.17, 28.17, 28.17, 2250, 4, 150, 20, 2.4, 5.4),
	(1, 3, 0, 6, "Caldari Navy", 29.34, 29.34, 29.34, 29.34, 29.34, 2250, 4, 150, 20, 2.4, 5.4),
	(1, 3, 0, 6, "Republic Fleet", 29.34, 29.34, 29.34, 29.34, 29.34, 2250, 4, 150, 20, 2.4, 5.4),
	(1, 3, 0, 8, "Heth", 31.23, 31.23, 31.23, 31.23, 31.23, 2250, 4, 150, 20, 2.4, 5.4),
	(1, 3, 0, 11, "Pithi C-Type", 33.39, 33.39, 33.39, 33.39, 33.39, 2250, 4, 150, 20, 2.4, 5.4),
	(2, 1, 7, 3, "Mk7", 27.66, 43.16, 43.16, 43.16, 43.16, 3750, 6.24, 170, 40, 4.25, 15.94),
	(2, 1, 9, 4, "Mk9", 29.5, 46.03, 46.03, 46.03, 46.03, 3750, 6.24, 170, 40, 4.25, 15.94),
	(2, 1, 0, 5, "Undertaker", 31.01, 48.37, 48.37, 48.37, 48.37, 3750, 6.24, 170, 40, 4.25, 15.94),
	(2, 1, 0, 6, "Caldari Navy", 32.29, 50.37, 50.37, 50.37, 50.37, 3750, 6.24, 170, 40, 4.25, 15.94),
	(2, 1, 0, 6, "Republic Fleet", 32.29, 50.37, 50.37, 50.37, 50.37, 3750, 6.24, 170, 40, 4.25, 15.94),
	(2, 1, 0, 8, "Hurricane", 34.37, 53.62, 53.62, 53.62, 53.62, 3750, 6.24, 170, 40, 4.25, 15.94),
	(2, 1, 0, 11, "Pithum C-Type", 36.75, 57.33, 57.33, 57.33, 57.33, 3750, 6.24, 170, 40, 4.25, 15.94),
	(2, 2, 7, 3, "Mk7", 33.75, 101, 101, 101, 101, 4300, 12, 81, 140, 6.5, 27.95),
	(2, 2, 9, 4, "Mk9", 36.01, 108, 108, 108, 108, 4300, 12, 81, 140, 6.5, 27.95),
	(2, 2, 0, 5, "Undertaker", 37.84, 114, 114, 114, 114, 4300, 12, 81, 140, 6.5, 27.95),
	(2, 2, 0, 6, "Caldari Navy", 39.39, 118, 118, 118, 118, 4300, 12, 81, 140, 6.5, 27.95),
	(2, 2, 0, 6, "Republic Fleet", 39.39, 118, 118, 118, 118, 4300, 12, 81, 140, 6.5, 27.95),
	(2, 2, 0, 8, "Discipline", 41.93, 126, 126, 126, 126, 4300, 12, 81, 140, 6.5, 27.95),
	(2, 2, 0, 11, "Pithum C-Type", 44.84, 135, 135, 135, 135, 4300, 12, 81, 140, 6.5, 27.95),
	(2, 3, 7, 3, "Mk7", 42.02, 67.24, 67.24, 67.24, 67.24, 2250, 6.4, 101, 125, 4, 9),
	(2, 3, 9, 4, "Mk9", 44.82, 71.72, 71.72, 71.72, 71.72, 2250, 6.4, 101, 125, 4, 9),
	(2, 3, 0, 5, "Undertaker", 47.12, 75.39, 75.39, 75.39, 75.39, 2250, 6.4, 101, 125, 4, 9),
	(2, 3, 0, 6, "Caldari Navy", 49.07, 78.51, 78.51, 78.51, 78.51, 2250, 6.4, 101, 125, 4, 9),
	(2, 3, 0, 6, "Republic Fleet", 49.07, 78.51, 78.51, 78.51, 78.51, 2250, 6.4, 101, 125, 4, 9),
	(2, 3, 0, 8, "Heth", 52.22, 83.55, 83.55, 83.55, 83.55, 2250, 6.4, 101, 125, 4, 9),
	(2, 3, 0, 11, "Pithum C-Type", 55.83, 89.32, 89.32, 89.32, 89.32, 2250, 6.4, 101, 125, 4, 9),
	(3, 1, 9, 4, "Mk9", 46.05, 80.59, 80.59, 80.59, 80.59, 4300, 7, 70, 140, 6.5, 27.95),
	(3, 1, 0, 5, "Gallows", 48.41, 84.72, 84.72, 84.72, 84.72, 4300, 7, 70, 140, 6.5, 27.95),
	(3, 1, 0, 6, "Caldari Navy", 50.4, 88.21, 88.21, 88.21, 88.21, 4300, 7, 70, 140, 6.5, 27.95),
	(3, 1, 0, 6, "Republic Fleet", 50.4, 88.21, 88.21, 88.21, 88.21, 4300, 7, 70, 140, 6.5, 27.95),
	(3, 1, 0, 8, "Hurricane", 53.67, 93.93, 93.93, 93.93, 93.93, 4300, 7, 70, 140, 6.5, 27.95),
	(3, 1, 0, 11, "Pith C-Type", 57.38, 100, 100, 100, 100, 4300, 7, 70, 140, 6.5, 27.95),
	(3, 1, 0, 12, "Pith B-Type", 60.25, 105, 105, 105, 105, 4300, 7, 70, 140, 6.5, 27.95),
	(3, 2, 9, 4, "Mk9", 48.59, 201, 201, 201, 201, 4700, 16.54, 69, 330, 14, 65.8),
	(3, 2, 0, 5, "Gallows", 51.08, 211, 211, 211, 211, 4700, 16.54, 69, 330, 14, 65.8),
	(3, 2, 0, 6, "Caldari Navy", 53.16, 220, 220, 220, 220, 4700, 16.54, 69, 330, 14, 65.8),
	(3, 2, 0, 6, "Republic Fleet", 53.16, 220, 220, 220, 220, 4700, 16.54, 69, 330, 14, 65.8),
	(3, 2, 0, 8, "Hurricane", 56.59, 234, 234, 234, 234, 4700, 16.54, 69, 330, 14, 65.8),
	(3, 2, 0, 11, "Pith C-Type", 60.51, 250, 250, 250, 250, 4700, 16.54, 69, 330, 14, 65.8),
	(3, 2, 0, 12, "Pith B-Type", 63.57, 263, 263, 263, 263, 4700, 16.54, 69, 330, 14, 65.8),
	(3, 3, 9, 4, "Mk9", 58.97, 212, 212, 212, 212, 1800, 14.4, 71, 450, 6, 10.8),
	(3, 3, 0, 5, "Barrage", 62, 223, 223, 223, 223, 1800, 14.4, 71, 450, 6, 10.8),
	(3, 3, 0, 6, "Caldari Navy", 64.53, 232, 232, 232, 232, 1800, 14.4, 71, 450, 6, 10.8),
	(3, 3, 0, 6, "Republic Fleet", 64.53, 232, 232, 232, 232, 1800, 14.4, 71, 450, 6, 10.8),
	(3, 3, 0, 8, "Hurricane", 68.7, 247, 247, 247, 247, 1800, 14.4, 71, 450, 6, 10.8),
	(3, 3, 0, 11, "Pith C-Type", 73.47, 264, 264, 264, 264, 1800, 14.4, 71, 450, 6, 10.8),
	(3, 3, 0, 12, "Pith B-Type", 77.13, 278, 278, 278, 278, 1800, 14.4, 71, 450, 6, 10.8);


/*
Sample query
SELECT
	concat(`m_name`, ' ', (select `ms_display_name` from `def_sizes` where `m_size`=`def_sizes`.`ms_id`), ' ', (select `mt_display_name` from `def_missile_types` where `m_type`=`def_missile_types`.`mt_id`), ' Launcher') as "Name",
    concat(`m_activation_time`, ' s') as "Activation Time",
    `m_dps` as "DPS",
    concat((`m_em_dmg` + `m_th_dmg` + `m_ki_dmg` + `m_ex_dmg`), ' (Em: ', `m_em_dmg`, ', Th: ', `m_th_dmg`, ', Ki: ', `m_ki_dmg`, ', Ex: ', `m_ex_dmg`, ')') as "Alpha Dmg",
    concat(`m_range`, ' km') as "Range"
FROM
	`echoes_db`.`def_missiles`
WHERE m_size=2 and m_type=1 limit 10;

SELECT
	concat(`m_name`, ' ', (select `ms_display_name` from `def_sizes` where `m_size`=`def_sizes`.`ms_id`), ' ', (select `mt_display_name` from `def_missile_types` where `m_type`=`def_missile_types`.`mt_id`), ' Launcher') as "Name",
    concat(`m_activation_time` * (1 + (-10)/100), ' s') as "Activation Time",
    `m_dps` as "DPS",
    concat((`m_em_dmg` + `m_th_dmg` + `m_ki_dmg` + `m_ex_dmg`), ' (Em: ', `m_em_dmg`, ', Th: ', `m_th_dmg`, ', Ki: ', `m_ki_dmg`, ', Ex: ', `m_ex_dmg`, ')') as "Alpha Dmg",
    concat(`m_range`, ' km') as "Range"
FROM
	`echoes_db`.`def_missiles`
WHERE `m_id`=20;
*/