USE statcast;

-- Confirm all 12 seasons are present -- 

SELECT table_name,
	   (SELECT COUNT(*) FROM information_schema.columns c 
	    WHERE c.table_name = t.table_name AND c.table_schema = 'statcast') AS n_columns
FROM information_schema.tables t
WHERE table_schema = 'statcast' AND table_name LIKE 'sc_%'
ORDER BY table_name;


-- View of all pitches from all 12 seasons (expanded column set) --

CREATE OR REPLACE VIEW all_pitches AS
SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
FROM sc_2015
-- sc2016 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2016
-- sc2017 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2017
-- sc2018 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2018
-- sc2019 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2019
-- sc2020 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2020
-- sc2021 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2021
-- sc2022 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2022
-- sc2023 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2023
-- sc2024 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2024
-- sc2025 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2025
-- sc2026 --
UNION ALL SELECT
            year, game_date, home_team, away_team, batter_name,
            bat_side, pitcher_id, pitch_hand, pitch_type, pitch_name,
            release_speed, release_spin_rate, release_pos_x, release_pos_y, release_pos_z,
            ax, ay, az, vx0, vy0,
            vz0, arm_angle, extension, pfx_x, pfx_z,
            plate_x, plate_z, zone, strike_zone_top, expected_woba,
            expected_babip, launch_speed, launch_angle, hit_distance_sc, bb_type,
            hit_coord_x, hit_coord_y, launch_speed_angle, type, description,
            events, inning_topbot, woba_value, woba_denom, estimated_slg_using_speedangle,
            delta_run_exp, delta_home_win_exp, delta_pitcher_run_exp, home_win_exp, at_bat_number,
            home_score, away_score, bat_score, fld_score, post_home_score,
            post_away_score, post_bat_score, post_fld_score, bat_score_diff, age_pit,
            age_bat, n_thruorder_pitcher
            FROM sc_2026;
            
-- Look through each season and calculate total pitches from our view to make sure it works -- 
SELECT year, COUNT(*) AS pitches 
FROM all_pitches 
GROUP BY year 
ORDER BY year;


-- View of all batted balls -- 
CREATE OR REPLACE VIEW batted_balls AS 
SELECT year, batter_name AS batter, bat_side AS Hand, pitch_type AS PT, pitch_name AS pitch,
	   launch_speed AS EV, launch_angle AS LA, hit_distance_sc, bb_type, events,
       estimated_slg_using_speedangle AS xSLG
FROM all_pitches
WHERE type = 'X' AND launch_speed IS NOT NULL; 


-- QUESTION: Explore how pitching has evolved from 2015 - 2026? -- 

-- P1: Is Velo Rising and by how much year over year? -- 

SELECT year,
		ROUND(AVG(release_speed), 2) AS avg_ff_velo,
        ROUND(AVG(release_speed) - LAG(AVG(release_speed)) OVER (ORDER BY year), 2) AS velo_change_yoy
FROM all_pitches
WHERE pitch_type = 'FF' AND release_speed IS NOT NULL
GROUP BY year
ORDER BY year; 

-- P2: Are Pitchers throwing fewer fastballs / more non-fastballs? --

WITH classified AS (
	SELECT 
		year,
		CASE
			WHEN pitch_type IN ('FF', 'SI', 'FC') THEN 'Fastball'
			WHEN pitch_type IN ('SL', 'CU', 'SV', 'KC', 'CS', 'KN', 'ST') THEN 'Breaking'
			WHEN pitch_type IN ('CH', 'SC', 'FS', 'FO') THEN 'Offspeed'
			ELSE 'Other'
		END AS pitch_class
	FROM all_pitches
	WHERE pitch_type IS NOT NULL
)
SELECT 
	year,
	ROUND(100 * SUM(pitch_class = 'Fastball') / COUNT(*), 1) AS pct_fastball,
    ROUND(100 * SUM(pitch_class = 'Breaking') / COUNT(*), 1) AS pct_breaking,
    ROUND(100 * SUM(pitch_class = 'Offspeed') / COUNT(*), 1) AS pct_offspeed
FROM classified
GROUP BY year
ORDER BY year;


-- P3: How did batter results change over time as this occurred? --


-- plate discipline changes -- 
CREATE OR REPLACE VIEW yearly_plate_discipline AS
WITH base AS (
  SELECT
    year,
    description,
    pitch_type,
    release_speed,
    zone,
    CASE
      WHEN pitch_type IN ('FF','SI','FC') THEN 'Fastball'
      WHEN pitch_type IN ('SL','CU','KC','ST','SV') THEN 'Breaking'
      WHEN pitch_type IN ('CH','FS') THEN 'Offspeed'
      ELSE 'Other'
    END AS pitch_class,
    (description IN ('swinging_strike','swinging_strike_blocked','foul_tip')) AS is_whiff,
    (description IN ('swinging_strike','swinging_strike_blocked','foul','foul_tip','hit_into_play')) AS is_swing
  FROM all_pitches
  WHERE pitch_type IS NOT NULL
)
SELECT
  year,
  -- overall whiff%
  ROUND(100.0 * SUM(is_whiff) / NULLIF(SUM(is_swing),0), 1) AS whiff_pct,
  -- in-zone whiff%
  ROUND(100.0 * SUM(is_whiff AND zone BETWEEN 1 AND 9) / NULLIF(SUM(is_swing AND zone BETWEEN 1 AND 9),0), 1) AS zone_whiff_pct,
  -- fastball whiff%
  ROUND(100.0 * SUM(is_whiff AND pitch_class='Fastball') / NULLIF(SUM(is_swing AND pitch_class='Fastball'),0), 1) AS fb_whiff_pct,
  -- 95+ mph whiff%
  ROUND(100.0 * SUM(is_whiff AND release_speed>=95) / NULLIF(SUM(is_swing AND release_speed>=95),0), 1) AS hi_velo_whiff_pct,
  -- breaking whiff%
  ROUND(100.0 * SUM(is_whiff AND pitch_class='Breaking') / NULLIF(SUM(is_swing AND pitch_class='Breaking'),0), 1) AS bb_whiff_pct,
  -- offspeed whiff%
  ROUND(100.0 * SUM(is_whiff AND pitch_class='Offspeed') / NULLIF(SUM(is_swing AND pitch_class='Offspeed'),0), 1) AS os_whiff_pct,
  -- overall chase% (swings on out-of-zone / out-of-zone pitches)
  ROUND(100.0 * SUM(is_swing AND zone>9) / NULLIF(SUM(zone>9),0), 1) AS chase_pct,
  -- fastball chase%
  ROUND(100.0 * SUM(is_swing AND zone>9 AND pitch_class='Fastball') / NULLIF(SUM(zone>9 AND pitch_class='Fastball'),0), 1) AS fb_chase_pct,
  -- breaking chase%
  ROUND(100.0 * SUM(is_swing AND zone>9 AND pitch_class='Breaking') / NULLIF(SUM(zone>9 AND pitch_class='Breaking'),0), 1) AS bb_chase_pct,
  -- offspeed chase%
  ROUND(100.0 * SUM(is_swing AND zone>9 AND pitch_class='Offspeed') / NULLIF(SUM(zone>9 AND pitch_class='Offspeed'),0), 1) AS os_chase_pct
FROM base
GROUP BY year
ORDER BY year;


-- quality of contact changes -- 
CREATE OR REPLACE VIEW yearly_contact_quality AS
WITH base AS (
  SELECT
    year,
    type,
    pitch_type,
    zone,
    delta_run_exp,
    launch_speed,
    launch_angle,
    launch_speed_angle,
    bb_type,
    expected_woba,
    estimated_slg_using_speedangle,
    CASE
      WHEN pitch_type IN ('FF','SI','FC') THEN 'Fastball'
      WHEN pitch_type IN ('SL','CU','KC','ST','SV') THEN 'Breaking'
      WHEN pitch_type IN ('CH','FS') THEN 'Offspeed'
      ELSE 'Other'
    END AS pitch_class,
    (type='X' AND launch_speed IS NOT NULL) AS is_bbe
  FROM all_pitches
)
SELECT
  year,
  -- contact-quality rates (denominator = batted balls in play)
  ROUND(100.0 * SUM(launch_speed_angle=6) / NULLIF(SUM(is_bbe),0), 1) AS barrel_pct,
  ROUND(100.0 * SUM(is_bbe AND launch_speed>=95) / NULLIF(SUM(is_bbe),0), 1) AS hardhit_pct,
  ROUND(100.0 * SUM(is_bbe AND launch_angle BETWEEN 8 AND 32) / NULLIF(SUM(is_bbe),0), 1) AS sweetspot_pct,
  ROUND(100.0 * SUM(is_bbe AND launch_speed>=95 AND launch_angle BETWEEN 8 AND 32) / NULLIF(SUM(is_bbe),0), 1) AS hardhit_sweetspot_pct,
  ROUND(100.0 * SUM(is_bbe AND bb_type='ground_ball') / NULLIF(SUM(is_bbe),0), 1) AS groundball_pct,
  -- RV/100 overall by class (pitcher perspective)
  ROUND(SUM(CASE WHEN pitch_class='Fastball' THEN delta_run_exp END) / NULLIF(SUM(pitch_class='Fastball'),0) * 100, 2) AS rv100_fb,
  ROUND(SUM(CASE WHEN pitch_class='Fastball' AND zone BETWEEN 1 AND 9 THEN delta_run_exp END) / NULLIF(SUM(pitch_class='Fastball' AND zone BETWEEN 1 AND 9),0) * 100, 2) AS rv100_fb_zone,
  ROUND(SUM(CASE WHEN pitch_class='Breaking' THEN delta_run_exp END) / NULLIF(SUM(pitch_class='Breaking'),0) * 100, 2) AS rv100_bb,
  ROUND(SUM(CASE WHEN pitch_class='Breaking' AND zone BETWEEN 1 AND 9 THEN delta_run_exp END) / NULLIF(SUM(pitch_class='Breaking' AND zone BETWEEN 1 AND 9),0) * 100, 2) AS rv100_bb_zone,
  ROUND(SUM(CASE WHEN pitch_class='Offspeed' THEN delta_run_exp END) / NULLIF(SUM(pitch_class='Offspeed'),0) * 100, 2) AS rv100_os,
  ROUND(SUM(CASE WHEN pitch_class='Offspeed' AND zone BETWEEN 1 AND 9 THEN delta_run_exp END) / NULLIF(SUM(pitch_class='Offspeed' AND zone BETWEEN 1 AND 9),0) * 100, 2) AS rv100_os_zone,
  -- expected stats (AVG ignores NULLs == na.rm=TRUE)
  ROUND(AVG(expected_woba), 3) AS xwOBA,
  ROUND(AVG(CASE WHEN type='X' THEN expected_woba END), 3) AS xwOBAcon,
  ROUND(AVG(estimated_slg_using_speedangle), 3) AS xSLGcon
FROM base
GROUP BY year
ORDER BY year;


SELECT * FROM yearly_plate_discipline;
SELECT * FROM yearly_contact_quality;
    
    
    
-- P4: Which pitch types gained the most velocity? Is it just specific pitches or is it all pitches--
CREATE OR REPLACE VIEW pitch_physics AS
SELECT
  year, pitch_type, pitch_hand, release_speed, release_spin_rate, extension,
  pfx_x, pfx_z, vx0, vy0, vz0, ax, ay, az,
  -- time to front of plate: solve 0.5*ay*t^2 + vy0*t + (50 - 17/12) = 0, take first crossing
  ( -vy0 - SQRT( POW(vy0,2) - 2*ay*(50 - 17.0/12.0) ) ) / ay AS t_plate,
  -- VAA (deg, negative = descending)
  -DEGREES( ATAN(
      (vz0 + az * ( ( -vy0 - SQRT( POW(vy0,2) - 2*ay*(50 - 17.0/12.0) ) ) / ay ))
      /
      (vy0 + ay * (( -vy0 - SQRT( POW(vy0,2) - 2*ay*(50 - 17.0/12.0))) / ay ))
  )) AS vaa,
  -- HAA (deg)
  -DEGREES( ATAN(
      (vx0 + ax *(( -vy0 - SQRT( POW(vy0,2) - 2*ay*(50 - 17.0/12.0))) / ay ))
      /
      (vy0 + ay *(( -vy0 - SQRT( POW(vy0,2) - 2*ay*(50 - 17.0/12.0))) / ay ))
  )) AS haa
FROM all_pitches
WHERE vy0 IS NOT NULL AND ay IS NOT NULL;


WITH by_type AS (
  SELECT
    pitch_type, year,
    AVG(release_speed) AS velo,
    AVG(release_spin_rate) AS spin,
    AVG(extension) AS ext,
    AVG(pfx_z * 12) AS ivb,
    AVG(pfx_x * 12 * (CASE WHEN pitch_hand='L' THEN -1 ELSE 1 END)) AS ihb_adj,
    AVG(vaa) AS vaa,
    AVG(haa * (CASE WHEN pitch_hand='L' THEN -1 ELSE 1 END)) AS haa_adj
  FROM pitch_physics
  WHERE pitch_type IN ('FF','FC','SI','CU','CH','KN','KC','SL','SV','ST','FS','FO','SC')
  GROUP BY pitch_type, year
),
endpoints AS (
  SELECT
    pitch_type,
    MAX(CASE WHEN year=2015 THEN velo END) AS velo_15, MAX(CASE WHEN year=2026 THEN velo END)    AS velo_26,
    MAX(CASE WHEN year=2015 THEN spin END) AS spin_15,MAX(CASE WHEN year=2026 THEN spin END)    AS spin_26,
    MAX(CASE WHEN year=2015 THEN ext END) AS ext_15, MAX(CASE WHEN year=2026 THEN ext END)     AS ext_26,
    MAX(CASE WHEN year=2015 THEN ivb END) AS ivb_15, MAX(CASE WHEN year=2026 THEN ivb END)     AS ivb_26,
    MAX(CASE WHEN year=2015 THEN ihb_adj END) AS ihb_15,MAX(CASE WHEN year=2026 THEN ihb_adj END) AS ihb_26,
    MAX(CASE WHEN year=2015 THEN vaa END) AS vaa_15,MAX(CASE WHEN year=2026 THEN vaa END)     AS vaa_26,
    MAX(CASE WHEN year=2015 THEN haa_adj END) AS haa_15, MAX(CASE WHEN year=2026 THEN haa_adj END) AS haa_26
  FROM by_type
  GROUP BY pitch_type
)
SELECT
  pitch_type,
  ROUND(velo_26 - velo_15,2) AS velo_gain,
  ROUND(spin_26 - spin_15,0) AS spin_gain,
  ROUND(ext_26 - ext_15, 2) AS ext_gain,
  ROUND(ivb_26 - ivb_15, 2) AS ivb_gain,
  ROUND(ihb_26 - ihb_15, 2) AS ihb_adj_gain,
  ROUND(vaa_26 - vaa_15, 2) AS vaa_change,
  ROUND(haa_26  - haa_15, 2) AS haa_adj_change,
  RANK() OVER (ORDER BY velo_26 - velo_15 DESC) AS velo_gain_rank
FROM endpoints
ORDER BY velo_gain_rank;

-- Create procedure out of velo trend table -- 
DROP PROCEDURE IF EXISTS team_velo_trend;
DELIMITER //
CREATE PROCEDURE team_velo_trend(IN team_abbr VARCHAR(5))
BEGIN
  SELECT
    year,
    ROUND(AVG(release_speed), 2) AS avg_ff_velo,
    ROUND(AVG(release_speed) - LAG(AVG(release_speed)) OVER (ORDER BY year), 2) AS yoy_change
  FROM all_pitches
  WHERE pitch_type = 'FF'
    AND release_speed IS NOT NULL
    AND (home_team = team_Abbr OR away_team = team_abbr)
  GROUP BY year
  ORDER BY year;
END //
DELIMITER ;

CALL team_velo_trend('NYY');




