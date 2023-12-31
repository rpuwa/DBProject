SET search_path = GenshinDB;

-- erasing all content
TRUNCATE elements CASCADE;
TRUNCATE countries CASCADE;
TRUNCATE stats CASCADE;
TRUNCATE updates CASCADE;
TRUNCATE skills CASCADE;
TRUNCATE weapons CASCADE;
TRUNCATE artifacts CASCADE;
TRUNCATE characters CASCADE;
TRUNCATE units CASCADE;
TRUNCATE players CASCADE;
TRUNCATE reactions CASCADE;

-- filling elements  ('Physical', 'Anemo', 'Geo', 'Electro', 'Dendro', 'Hydro', 'Pyro', 'Cryo')
INSERT INTO elements(_name, _reactions, _id) VALUES ('Physical', '{false, false, false, false, false, false, false, true}', 1);
INSERT INTO elements(_name, _reactions, _id) VALUES ('Anemo',    '{false, false, false, true, false, true, true, true}', 2);
INSERT INTO elements(_name, _reactions, _id) VALUES ('Geo',      '{false, false, false, true, false, true, true, true}', 3);
INSERT INTO elements(_name, _reactions, _id) VALUES ('Electro',  '{false, true, true, false, true, true, true, true}', 4);
INSERT INTO elements(_name, _reactions, _id) VALUES ('Dendro',   '{false, false, false, true, false, true, true, false}', 5);
INSERT INTO elements(_name, _reactions, _id) VALUES ('Hydro',    '{false, true, true, true, true, false, true, true}', 6);
INSERT INTO elements(_name, _reactions, _id) VALUES ('Pyro',     '{false, true, true, true, true, true, false, true}', 7);
INSERT INTO elements(_name, _reactions, _id) VALUES ('Cryo',     '{false, true, true, true, false, true, true, false}', 8);

-- filling countries
INSERT INTO countries(_name, _element, _archont) VALUES ('Mondstadt', 'Anemo', 'Venti');
INSERT INTO countries(_name, _element, _archont) VALUES ('Liyue', 'Geo', 'Zhongli');
INSERT INTO countries(_name, _element, _archont) VALUES ('Inazuma', 'Electro', 'Raiden');
INSERT INTO countries(_name, _element, _archont) VALUES ('Sumeru', 'Dendro', 'Nahida');
INSERT INTO countries(_name, _element, _archont) VALUES ('Fontaine', 'Hydro', 'Furina');
INSERT INTO countries(_name, _element, _archont) VALUES ('Natlan', 'Pyro', 'Murata');
INSERT INTO countries(_name, _element, _archont) VALUES ('Snezhnaya', 'Cryo', 'Tsaritsa');

-- filling reactions
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Physical', 'Electro', 0.6);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Physical', 'Cryo', 1.2);

INSERT INTO reactions(_first, _second, _bonus) VALUES ('Anemo', 'Anemo', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Anemo', 'Electro', 0.25);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Anemo', 'Hydro', 0.25);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Anemo', 'Pyro', 0.25);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Anemo', 'Cryo', 0.25);

INSERT INTO reactions(_first, _second, _bonus) VALUES ('Geo', 'Geo', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Geo', 'Electro', 0.2);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Geo', 'Hydro', 0.2);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Geo', 'Pyro', 0.2);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Geo', 'Cryo', 0.2);

INSERT INTO reactions(_first, _second, _bonus) VALUES ('Electro', 'Electro', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Electro', 'Dendro', 0.3);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Electro', 'Hydro', 0.15);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Electro', 'Pyro', 0.4);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Electro', 'Cryo', 0.25);

INSERT INTO reactions(_first, _second, _bonus) VALUES ('Dendro', 'Dendro', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Dendro', 'Electro', 0.35);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Dendro', 'Hydro', 0.4);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Dendro', 'Pyro', 0.2);

INSERT INTO reactions(_first, _second, _bonus) VALUES ('Hydro', 'Hydro', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Hydro', 'Dendro', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Hydro', 'Electro', 0.2);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Hydro', 'Pyro', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Hydro', 'Cryo', 0.5);

INSERT INTO reactions(_first, _second, _bonus) VALUES ('Pyro', 'Pyro', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Pyro', 'Dendro', 0.6);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Pyro', 'Hydro', 1);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Pyro', 'Electro', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Pyro', 'Cryo', 0.75);

INSERT INTO reactions(_first, _second, _bonus) VALUES ('Cryo', 'Cryo', 0.5);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Cryo', 'Hydro', 0.3);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Cryo', 'Pyro', 0.25);
INSERT INTO reactions(_first, _second, _bonus) VALUES ('Cryo', 'Electro', 0.35);

-- filling weapons (+ their _stats, + their updates)
-- catalysts
WITH weapon_stats AS (INSERT INTO stats(_damage, _elemental_coefs) VALUES (542, '{0, 0.26, 0.26, 0.26, 0.26, 0.26, 0.26, 0.26}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.2, 'Weapon', 'A Thousand Floating Dreams') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'A Thousand Floating Dreams', 'Catalyst', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef) VALUES (674, 0.221) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (4.1, 'Weapon', 'Cashflow Supervision') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Cashflow Supervision', 'Catalyst', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _hp_coef, _heal_coef) VALUES (608, 0.496, 0.2) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.1, 'Weapon', 'Everlasting Moonglow') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Everlasting Moonglow', 'Catalyst', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _hp_coef, _damage_coef) VALUES (608, 0.496, 0.12) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.6, 'Weapon', 'Jadefalls Splendor') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Jadefalls Splendor', 'Catalyst', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

-- bows
WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef) VALUES (608, 0.496) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Weapon', 'Amos Bow') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Amos Bow', 'Bow', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _hp_coef) VALUES (542, 0.441, 0.32) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.7, 'Weapon', 'Aqua Simulacra') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Aqua Simulacra', 'Bow', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _hp_coef) VALUES (608, 0.551) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.4, 'Weapon', 'Elegy for the End') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Elegy for the End', 'Bow', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (542, 0.441, '{0, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.0, 'Weapon', 'Hunters Path') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Hunters Path', 'Bow', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (608, 0.331, '{0, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.2, 'Weapon', 'Polar Star') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Polar Star', 'Bow', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

-- spear
WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (741, 0.165, '{0, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.4, 'Weapon', 'Calamity Queller') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Calamity Queller', 'Spear', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _hp_coef, _damage_coef) VALUES (608, 0.22, 0.56) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.1, 'Weapon', 'Engulfing Lightning') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Engulfing Lightning', 'Spear', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (674, 0.221, '{0, 0, 0, 0, 0, 0.4, 0.4, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Weapon', 'Primordial Jade Winged-Spear') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Primordial Jade Winged-Spear', 'Spear', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _hp_coef) VALUES (674, 0.368) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Weapon', 'Skyward Spine') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Skyward Spine', 'Spear', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _hp_coef) VALUES (608, 0.331, 0.3) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.3, 'Weapon', 'Staff of Homa') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Staff of Homa', 'Spear', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

-- one handed
WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (674, 0.4, '{0.413, 0, 0, 0, 0, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Weapon', 'Aquila Favonia') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Aquila Favonia', 'One handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _hp, _damage_coef) VALUES (608, 198, 0.2) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.6, 'Weapon', 'Freedom-Sworn') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Freedom-Sworn', 'One handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (608, 0.331, '{0, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24, 0.24}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.6, 'Weapon', 'Haran Geppaku Futsu') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Haran Geppaku Futsu', 'One handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _hp_coef) VALUES (542, 0.662) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.1, 'Weapon', 'Key of Khaj-Nisut') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Key of Khaj-Nisut', 'One handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef) VALUES (542, 0.441) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.4, 'Weapon', 'Light of Foliar Incision') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Light of Foliar Incision', 'One handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

-- two handed
WITH weapon_stats AS (INSERT INTO stats(_damage, _hp_coef) VALUES (608, 0.331) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.5, 'Weapon', 'Beacon of the Reed Sea') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Beacon of the Reed Sea', 'Two handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef) VALUES (542, 0.441) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.3, 'Weapon', 'Redhorn Stonethresher') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Redhorn Stonethresher', 'Two handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (608, 0.496, '{0.4, 0, 0, 0, 0, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Weapon', 'Wolfs Gravestone') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Wolfs Gravestone', 'Two handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (741, 0.32, '{0.207, 0, 0, 0, 0, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.5, 'Weapon', 'Song of Broken Pines') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Song of Broken Pines', 'Two handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

WITH weapon_stats AS (INSERT INTO stats(_damage, _elemental_coefs) VALUES (675, '{0, 0, 0, 0.36, 0, 0.36, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.1, 'Weapon', 'Rainslasher') RETURNING _id)
INSERT INTO weapons(_name, _type, _stats, _update)
SELECT 'Rainslasher', 'Two handed', (SELECT _id FROM weapon_stats), (SELECT _id FROM item_update)
FROM weapon_stats, item_update;

-- filling artifacts (+ their _stats, + their updates)
-- healing set
WITH set_stats AS (INSERT INTO stats(_heal_coef, _hp_coef) VALUES (0.25, 0.15) RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _hp_coef) VALUES (400, 0.1) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Maidens Distant Love') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Maidens Distant Love', 'Maiden Beloved', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Maiden Beloved' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp) VALUES (100, 150) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Maidens Passing Youth') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Maidens Passing Youth', 'Maiden Beloved', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Maiden Beloved' LIMIT 1),
     item_stats AS (INSERT INTO stats(_hp, _heal_coef) VALUES (250, 0.1) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Maidens Fading Beauty') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Maidens Fading Beauty', 'Maiden Beloved', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- physical set
WITH set_stats AS (INSERT INTO stats(_damage, _damage_coef, _elemental_coefs) VALUES (120, 0.1, '{0.35, 0, 0, 0, 0, 0, 0, 0}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0.1, 0, 0, 0, 0, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.5, 'Artifact', 'Stainless Bloom') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Stainless Bloom', 'Pale Flame', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Pale Flame' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _damage_coef, _hp_coef) VALUES (100, 0.1, 0.15) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.5, 'Artifact', 'Moment of Cessation') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Moment of Cessation', 'Pale Flame', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Pale Flame' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp) VALUES (110, 75) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.5, 'Artifact', 'Mocking Mask') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Mocking Mask', 'Pale Flame', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- anemo set
WITH set_stats AS (INSERT INTO stats(_damage_coef, _hp_coef, _elemental_coefs) VALUES (0.17, 0.1, '{0, 0.35, 0, 0, 0, 0, 0, 0}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0, 0.1, 0, 0, 0, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'In Remembrance of Viridescent Fields') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'In Remembrance of Viridescent Fields', 'Viridescent Venerer', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Viridescent Venerer' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp) VALUES (100, 75) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Viridescent Venerers Determination') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Viridescent Venerers Determination', 'Viridescent Venerer', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Viridescent Venerer' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _damage_coef) VALUES (100, 0.12) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Viridescent Venerers Diadem') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Viridescent Venerers Diadem', 'Viridescent Venerer', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- geo set
WITH set_stats AS (INSERT INTO stats(_damage_coef, _hp_coef, _elemental_coefs) VALUES (0.17, 0.1, '{0, 0, 0.35, 0, 0, 0, 0, 0}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0, 0, 0.1, 0, 0, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Flower of Creviced Cliff') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Flower of Creviced Cliff', 'Archaic Petra', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Archaic Petra' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _damage_coef, _hp) VALUES (100, 0.17, 60) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Sundial of Enduring Jade') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Sundial of Enduring Jade', 'Archaic Petra', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Archaic Petra' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp_coef) VALUES (100, 0.12) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Mask of Solitude Basalt') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Mask of Solitude Basalt', 'Archaic Petra', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- electro set
WITH set_stats AS (INSERT INTO stats(_damage_coef, _elemental_coefs) VALUES (0.15, '{0, 0, 0, 0.35, 0, 0, 0, 0}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0, 0, 0, 0.1, 0, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Thunderbirds Mercy') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Thunderbirds Mercy', 'Thundering Fury', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Thundering Fury' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _damage_coef, _hp) VALUES (100, 0.17, 60) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Hourglass of Thunder') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Hourglass of Thunder', 'Thundering Fury', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Thundering Fury' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp_coef) VALUES (100, 0.12) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Thunder Summoners Crown') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Thunder Summoners Crown', 'Thundering Fury', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- dendro set
WITH set_stats AS (INSERT INTO stats(_damage, _elemental_coefs) VALUES (150, '{0, 0, 0, 0, 0.35, 0, 0, 0}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0, 0, 0, 0, 0.1, 0, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.0, 'Artifact', 'Labyrinth Wayfarer') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Labyrinth Wayfarer', 'Deepwood Memories', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Deepwood Memories' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp, _hp_coef) VALUES (100, 65, 0.16) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.0, 'Artifact', 'A Time of Insight') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'A Time of Insight', 'Deepwood Memories', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Deepwood Memories' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage_coef, _hp_coef) VALUES (0.15, 0.15) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.0, 'Artifact', 'Laurel Coronet') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Laurel Coronet', 'Deepwood Memories', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- hydro set
WITH set_stats AS (INSERT INTO stats(_hp_coef, _elemental_coefs) VALUES (0.2, '{0, 0, 0, 0, 0, 0.35, 0, 0}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0, 0, 0, 0, 0, 0.1, 0, 0}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.2, 'Artifact', 'Gilded Corsage') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Gilded Corsage', 'Heart of Depth', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Heart of Depth' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp) VALUES (100, 100) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.2, 'Artifact', 'Copper Compass') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Copper Compass', 'Heart of Depth', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Heart of Depth' LIMIT 1),
     item_stats AS (INSERT INTO stats(_hp, _hp_coef) VALUES (200, 0.1) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.2, 'Artifact', 'Wine-Stained Tricorne') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Wine-Stained Tricorne', 'Heart of Depth', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- pyro set
WITH set_stats AS (INSERT INTO stats(_damage_coef, _elemental_coefs) VALUES (0.2, '{0, 0, 0, 0, 0, 0, 0.35, 0}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0, 0, 0, 0, 0, 0, 0, 0.1}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Witchs Flower of Blaze') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Witchs Flower of Blaze', 'Crimson Witch of Flames', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Crimson Witch of Flames' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _damage_coef, _hp) VALUES (100, 0.12, 25) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Witchs End Time') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Witchs End Time', 'Crimson Witch of Flames', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Crimson Witch of Flames' LIMIT 1),
     item_stats AS (INSERT INTO stats(_hp, _damage_coef, _hp_coef) VALUES (100, 0.1, 0.15) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Artifact', 'Witchs Scorching Hat') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Witchs Scorching Hat', 'Crimson Witch of Flames', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- cryo set
WITH set_stats AS (INSERT INTO stats(_heal_coef, _elemental_coefs) VALUES (0.12, '{0, 0, 0, 0, 0, 0, 0, 0.35}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _elemental_coefs) VALUES (400, '{0, 0, 0, 0, 0, 0, 0, 0.1}') RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.2, 'Artifact', 'Snowswept Memory') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Snowswept Memory', 'Blizzard Strayer', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Blizzard Strayer' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp) VALUES (130, 70) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.2, 'Artifact', 'Frozen Homelands Demise') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Frozen Homelands Demise', 'Blizzard Strayer', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Blizzard Strayer' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage_coef, _hp_coef) VALUES (0.18, 0.13) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.2, 'Artifact', 'Broken Rimes Echo') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Broken Rimes Echo', 'Blizzard Strayer', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

-- off set
WITH set_stats AS (INSERT INTO stats(_damage, _damage_coef, _hp, _hp_coef, _heal_coef, _elemental_coefs) VALUES (150, 0.12, 150, 0.12, 0.3, '{0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1}') RETURNING _id),
     item_stats AS (INSERT INTO stats(_hp, _damage_coef) VALUES (400, 0.2) RETURNING _id),
     item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.0, 'Artifact', 'Wind Rose of Stone Heart') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Wind Rose of Stone Heart', 'Nearsoccer Outfit', 'Flower', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Nearsoccer Outfit' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage, _hp) VALUES (130, 70) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.0, 'Artifact', 'Bust Down') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Bust Down', 'Nearsoccer Outfit', 'Clock', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;

WITH set_stats AS (SELECT _set_bonus_stats _id FROM artifacts WHERE _set_name = 'Nearsoccer Outfit' LIMIT 1),
     item_stats AS (INSERT INTO stats(_damage_coef, _hp_coef) VALUES (0.18, 0.13) RETURNING _id),
	 item_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.0, 'Artifact', 'Goggle Hat of Fury') RETURNING _id)
INSERT INTO artifacts(_name, _set_name, _type, _update, _stats, _set_bonus_stats)
SELECT 'Goggle Hat of Fury', 'Nearsoccer Outfit', 'Hat', (SELECT _id FROM item_update), (SELECT _id FROM item_stats), (SELECT _id FROM set_stats)
FROM item_update, item_stats, set_stats;


-- filling characters (+ their stats, + their updates, + their skills)
WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (339, 10372) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.5, 'Character', 'When the Sakura Bloom') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Yakan Evocation: Sesshou Sakura', 'Elemental', 2.51, 0.0, 4.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Great Secret Art: Tenko Kenshin', 'Ultimate', 7.09, 0.0, 22.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Yae Miko', 'Catalyst', 'Inazuma', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Electro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (337, 12907) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.1, 'Character', 'Floating World Under the Moonlight') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Transcendence: Baleful Omen', 'Elemental', 2.63, 0.0, 10.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Secret Art: Musou Shinsetsu', 'Ultimate', 4.05, 0.0, 18.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Raiden Shogun', 'Spear', 'Inazuma', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Electro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (192, 13348) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.6, 'Character', 'A Parade of Providence') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Universal Diagnosis', 'Elemental', 1.68, 0.37, 10.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Holistic Revivification', 'Ultimate', 2.06, 0.45, 20.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Baizhu', 'Catalyst', 'Liyue', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Dendro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (212, 12288) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.4, 'Character', 'The Exquisite Night Chimes') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Raphanus Sky Cluster', 'Elemental', 1.63, 0.07, 15.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Moonjade Descent', 'Ultimate', 4.09, 0.15, 20.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Yaoyao', 'Spear', 'Liyue', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Dendro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (182, 9569) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.3, 'Character', 'Shadows Amidst Snowstorms') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Inuzaka All-Round Defense', 'Elemental', 0.0, 0.1, 10.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Juuga: Forward Unto Victory', 'Ultimate', 3.65, 0.0, 20.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Gorou', 'Bow', 'Inazuma', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Geo', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (251, 14695) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.1, 'Character', 'A New Star Approaches') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Dominus Lapidis', 'Elemental', 1.24, 0.0, 12.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Planet Befall', 'Ultimate', 4.1, 0.0, 12.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Zhongli', 'Spear', 'Liyue', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Geo', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (223, 10531) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Character', 'Welcome To Teyvat') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Skyward Sonnet', 'Elemental', 1.45, 0.0, 6.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Winds Grand Ode', 'Ultimate', 3.73, 0.0, 15.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Venti', 'Bow', 'Mondstadt', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Anemo', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (234, 13470) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.1, 'Character', 'Floating World Under the Moonlight') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Kurages Oath', 'Elemental', 2.32, 2.17, 20.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Nereids Ascension', 'Ultimate', 0.0, 0.19, 18.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Sangonomiya Kokomi', 'Catalyst', 'Inazuma', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Hydro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (243, 14450) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.7, 'Character', 'Hidden Dreams in the Depths') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Lingering Lifeline', 'Elemental', 1.88, 0, 10.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Depth-Clarion Dice', 'Ultimate', 4.31, 0, 18.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Yelan', 'Bow', 'Liyue', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Hydro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (229, 15184) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (3.1, 'Character', 'King Deshret and the Three Magi') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Dance of Haftkarsvar', 'Elemental', 0, 0.15, 18.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Dance of Abzendegi: Distant Dreams, Listening Spring', 'Ultimate', 2.92, 0.28, 18.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Nilou', 'One handed', 'Sumeru', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Hydro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (318, 11021) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (4.0, 'Character', 'As Light Rain Falls Without Reason') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Bewildering Lights', 'Elemental', 1.36, 0, 15.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Wondrous Trick: Miracle Parade', 'Ultimate', 4.06, 0, 15.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Lyney', 'Bow', 'Fontaine', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Pyro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (254, 12071) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (4.0, 'Character', 'As Light Rain Falls Without Reason') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Pressurized Floe', 'Elemental', 1.52, 0, 10.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Shadowhunters Ambush', 'Ultimate', 2.52, 0, 15.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Freminet', 'Two handed', 'Fontaine', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Cryo', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (233, 11962) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (1.0, 'Character', 'Welcome To Teyvat') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Claw and Thunder', 'Elemental', 1.26, 0, 10.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Lightning Fang', 'Ultimate', 2.59, 0, 20.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Razor', 'Two handed', 'Mondstadt', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Electro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

WITH character_stats AS (INSERT INTO stats(_damage, _hp) VALUES (201, 10331) RETURNING _id),
     character_update AS (INSERT INTO updates(_version, _type, _item) VALUES (2.2, 'Character', 'Into the Perilous Labyrinth of Fog') RETURNING _id),
     character_skill_elemental AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Blazing Blessing', 'Elemental', 3.29, 0, 15.0) RETURNING _name),
     character_skill_ultimate AS (INSERT INTO skills(_name, _type, _base_damage, _base_heal, _cooldown) VALUES ('Crimson Ooyoroi', 'Ultimate', 4.15, 0, 20.0) RETURNING _name)
INSERT INTO characters(_name, _weapon_type, _country, _base_stats, _update, _element, _elemental_skill, _ultimate_skill)
SELECT 'Thoma', 'Spear', 'Inazuma', (SELECT _id FROM character_stats), (SELECT _id FROM character_update), 'Pyro', (SELECT _name FROM character_skill_elemental), (SELECT _name FROM character_skill_ultimate)
FROM character_skill_ultimate, character_skill_elemental, character_update, character_stats;

-- filling units
INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact) 
VALUES ('Razor', 'Wolfs Gravestone', 'Wind Rose of Stone Heart', 'Bust Down', 'Goggle Hat of Fury');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact) 
VALUES ('Razor', 'Rainslasher', 'Thunderbirds Mercy', 'Hourglass of Thunder', 'Thunder Summoners Crown');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact) 
VALUES ('Baizhu', 'Everlasting Moonglow', 'Maidens Distant Love', 'Maidens Passing Youth', 'Maidens Fading Beauty');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Gorou', 'Elegy for the End', 'Flower of Creviced Cliff', 'Sundial of Enduring Jade', 'Mask of Solitude Basalt');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Gorou', 'Hunters Path', 'Stainless Bloom', 'Sundial of Enduring Jade', 'Thunder Summoners Crown');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Venti', 'Amos Bow', 'Maidens Distant Love', 'Hourglass of Thunder', 'Laurel Coronet');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Venti', 'Aqua Simulacra', 'In Remembrance of Viridescent Fields', 'Viridescent Venerers Determination', 'Viridescent Venerers Diadem');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Yae Miko', 'Everlasting Moonglow', 'Wind Rose of Stone Heart', 'Hourglass of Thunder', 'Thunder Summoners Crown');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Yae Miko', 'Cashflow Supervision', 'Flower of Creviced Cliff', 'Viridescent Venerers Determination', 'Laurel Coronet');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Raiden Shogun', 'Skyward Spine', 'Flower of Creviced Cliff', 'A Time of Insight', 'Wine-Stained Tricorne');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Raiden Shogun', 'Engulfing Lightning', 'Witchs Flower of Blaze', 'Witchs End Time', 'Witchs Scorching Hat');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Freminet', 'Redhorn Stonethresher', 'Maidens Distant Love', 'Maidens Passing Youth', 'Maidens Fading Beauty');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Sangonomiya Kokomi', 'A Thousand Floating Dreams', 'Gilded Corsage', 'Copper Compass', 'Wine-Stained Tricorne');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Thoma', 'Staff of Homa', 'Wind Rose of Stone Heart', 'Bust Down', 'Goggle Hat of Fury');

INSERT INTO units(_character, _weapon, _flower_artifact, _clock_artifact, _hat_artifact)
VALUES ('Lyney', 'Aqua Simulacra', 'In Remembrance of Viridescent Fields', 'Witchs End Time', 'Mask of Solitude Basalt');

-- filling players
INSERT INTO players(_unit_1, _unit_2, _unit_3, _unit_4)
SELECT u1._id, u2._id, u3._id, u4._id
FROM units u1, units u2, units u3, units u4
WHERE u1._character <> u2._character
  AND u1._character <> u3._character
  AND u1._character <> u4._character
  AND u2._character <> u3._character
  AND u2._character <> u4._character
  AND u3._character <> u4._character
  AND u1._id < u2._id 
  AND u2._id < u3._id
  AND u3._id < u4._id
ORDER BY random()
LIMIT 15;
