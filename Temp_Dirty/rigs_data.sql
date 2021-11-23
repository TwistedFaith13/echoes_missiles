DROP TABLE IF EXISTS `echoes_db`.`def_rig_ef_types`;
DROP TABLE IF EXISTS `echoes_db`.`def_rigs`;

CREATE TABLE `echoes_db`.`def_rig_ef_types` (
	`ef_type_id` tinyint(3) unsigned NOT NULL COMMENT 'Internal ID. Only for correlation',
	`ef_type_name` char(20) NOT NULL COMMENT 'Effect name for display',
	`ef_type_help` varchar(255) DEFAULT NULL COMMENT 'Additional help text for users',
	PRIMARY KEY (`ef_type_id`),
	UNIQUE KEY `Effect Type` (`ef_type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Rig Effects Type Table';
CREATE TABLE `echoes_db`.`def_rigs` (
	`r_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal ID. Only for correlation',
	`r_meta_level` tinyint(3) unsigned NOT NULL COMMENT 'Rig meta level',
	`r_name` char(50) NOT NULL COMMENT 'Rig name',
	`r_ef_type` tinyint(3) unsigned NOT NULL COMMENT 'Foreign key pointing to def_rig_ef_types',
	`r_ef` DECIMAL(4,2) NOT NULL COMMENT 'effect amount',
	PRIMARY KEY (`r_id`),
	UNIQUE KEY `Rig Name` (`r_name`),
	KEY `Effect Type` (`r_ef_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Rig Effects Type Table';

INSERT INTO `echoes_db`.`def_rig_ef_types`
	(`ef_type_id`, `ef_type_name`, `ef_type_help`)
VALUES
	(1, "Explosion Velocity", "Explosion velocity determines how fast the explosion damage travels from impact to its maximum radius. A slow explosion will apply poor damage to a fast moving target."),
	(2, "Damage Bonus", "Damage bonus determines how much maximum damage a missile can do. This is affected by factors like explosion radius, target signature radius, explosion velocity and target velocity."),
	(3, "Explosion Radius", "Explosion radius determines how large the explosion will be. The larger it is, the less damage it will apply to small/fast moving targets."),
	(4, "Flight Time", "Flight time determines how long the missiles can track a target. The higher this value the longer the missile will stay in the chase, raising its effective range."),
	(5, "Flight Velocity", "Flight velocity determines how fast a missile can chase a target. If the target is faster than the missile then it is possible that the missile will not be able to apply damage at all. Faster velocity also increased effective range."),
	(6, "Activation Time", "Activation time is the delay between missile launches. The lesser this number the faster missiles will be launched. This affects pure DPS numbers - but not the alpha damage.");

INSERT INTO `echoes_db`.`def_rigs`
	(`r_meta_level`, `r_name`, `r_ef_type`, `r_ef`)
VALUES
	(0, "Warhead Flare Catalyst I", 1, 10),
	(1, "Warhead Flare Catalyst II", 1, 12.5),
	(2, "Warhead Flare Catalyst III", 1, 15),
	(0, "Warhead Calefaction Catalyst Prototype", 2, 7.5),
	(0, "Warhead Calefaction Catalyst I", 2, 12.5),
	(1, "Warhead Calefaction Catalyst II", 2, 15),
	(2, "Warhead Calefaction Catalyst III", 2, 17.5),
	(0, "Warhead Rigor Catalyst Prototype", 3, -6),
	(0, "Warhead Rigor Catalyst I", 3, -10),
	(1, "Warhead Rigor Catalyst II", 3, -12),
	(2, "Warhead Rigor Catalyst III", 3, -14),
	(0, "Rocket Fuel Cache Partition I", 4, 7.5),
	(1, "Rocket Fuel Cache Partition II", 4, 10),
	(2, "Rocket Fuel Cache Partition III", 4, 12.5),
	(0, "Hydraulic Bay Thrusters Prototype", 5, 4.5),
	(0, "Hydraulic Bay Thrusters I", 5, 7.5),
	(1, "Hydraulic Bay Thrusters II", 5, 10),
	(2, "Hydraulic Bay Thrusters III", 5, 12.5),
	(0, "Bay Loading Accelerator Prototype", 6, -4.5),
	(0, "Bay Loading Accelerator I", 6, -7.5),
	(1, "Bay Loading Accelerator II", 6, -10),
	(2, "Bay Loading Accelerator III", 6, -12.5);

/*
SELECT `r_name` as "Rig Name", `r_meta_level` as "Rig Meta Level", (select `ef_type_name` from `def_rig_ef_types` where `r_ef_type`=`def_rig_ef_types`.`ef_type_id`) as "Effect", concat(`r_ef`, " %") as "Amount"
FROM `def_rigs`
WHERE `r_id`=21;
*/