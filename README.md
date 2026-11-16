# MLB Pitching Arms Race (2015–2026)

A SQL-first analytics project built on **~8 million pitches** of MLB Statcast data
(2015–2026), using **MySQL** for the data layer and **R/ggplot2** for visualization.
The database design, metric engineering, and analysis are all done in SQL;
R is used only to render the final charts from query results pulled directly
over a live database connection.

**Author:** CJ (Chris Recupero) · [@Chriscoop_](https://twitter.com/Chriscoop_)

---

## The Question

**How has MLB's pitching "arms race" evolved from 2015 to 2026 — are pitchers
trading contact for velocity and spin, and is it actually working?**

## The Short Answer

It's not a clean "pitchers won." The data shows an **intensifying arms race that
has largely reached an equilibrium on contact**:

- **Pitchers escalate:** four-seam velocity keeps climbing; breaking-ball usage rises.
- **Whiffs peaked, then eased:** swing-and-miss climbed through 2020 and has
  *drifted down* since — missing more bats is not the recent story.
- **Hitters sell out for power:** HardHit% (34.5% → 38.7%), Barrel% (5.4% → 7.7%),
  and air-ball rate all rose; ground-ball rate fell (46.3% → 42.2%).
- **Yet net expected production on contact is flat:** xwOBAcon moved only
  .357 → .362 across the full span.

So both sides escalated and the equilibrium held — a more nuanced finding than
a one-directional "arms race is working" narrative.

---

## What This Project Demonstrates (SQL / Database Engineering)

- **Bulk data loading** — 12 season CSVs (~5 GB) via `LOAD DATA LOCAL INFILE`
  with `NULLIF('NA')` handling and schema-drift management (2026 adds a
  `miss_distance` column).
- **Views as an abstraction layer** — a unified `all_pitches` view (62 columns,
  12 `UNION ALL`'d season tables) and a filtered `batted_balls` view.
- **Metric engineering in SQL** — whiff%, chase%, barrel%, hardhit%, sweetspot%,
  xwOBA/xwOBAcon/xSLGcon, and run value per 100 by pitch class, all computed with
  conditional aggregation (`SUM(condition)` boolean pattern) and `NULLIF` guards.
- **Window functions** — `LAG()` for year-over-year velocity change; `RANK()`
  for pitch-type gain leaderboards.
- **CTEs** — multi-step `WITH` pipelines for classification → aggregation.
- **Derived physics** — a `pitch_physics` view computing **Vertical / Horizontal
  Approach Angle (VAA/HAA)** from raw velocity and acceleration vectors via the
  projectile kinematics (verified against known pitch benchmarks).
- **Stored procedure** — `team_velo_trend(team)` for parameterized, reusable
  per-team velocity trends.
- **End-to-end pipeline** — R pulls directly from MySQL via `DBI`/`RMariaDB`
  (no CSV round-trip), aggregating server-side so only small result sets cross
  into R.

---

## Repository Structure

```
mlb-pitching-arms-race/
├── README.md
├── sql/
│   └── pitch_trends.sql      # schema, views, metrics, physics, stored procedure
├── R/
│   └── make_charts.R         # pulls from MySQL via DBI, renders all charts
└── charts/
    ├── 01_whiff_overall_zone.png
    ├── 02_whiff_by_pitch_type.png
    ├── 03_chase_by_pitch_type.png
    ├── 04_expected_contact_quality.png
    ├── 05_batted_ball_profile.png
    └── 06_quality_of_contact.png
```

---

## Findings

### 1. Whiff rates rose, then plateaued
Overall and in-zone whiff% climbed from 2015, peaked around 2020, and have
slowly declined since — pushing back on the idea that pitchers keep missing
more bats every year.

![Whiff% overall and in-zone](charts/01_whiff_overall_zone.png)

### 2. Fastball whiffs drove the rise; breaking/offspeed held
Breaking and offspeed whiff rates have hovered around ~33%, while fastball
whiff% climbed through 2020 before easing.

![Whiff% by pitch type](charts/02_whiff_by_pitch_type.png)

### 3. Chase behavior shifted by pitch class
Fastball chase% dipped, then recovered; breaking and offspeed chase rates
drifted slightly down over the span.

![Chase% by pitch type](charts/03_chase_by_pitch_type.png)

### 4. Expected production on contact is essentially flat
Despite everything else moving, xwOBAcon and xSLGcon stayed roughly stable
(xwOBAcon .357 → .362) — the equilibrium at the heart of the story.

![Expected contact quality](charts/04_expected_contact_quality.png)

### 5. The batted-ball profile moved to the air
Ground-ball rate fell (46.3% → 42.2%) while sweet-spot and hard-hit-sweet-spot
rates edged up — more balls elevated.

![Batted-ball profile](charts/05_batted_ball_profile.png)

### 6. Contact got harder
HardHit% (34.5% → 38.7%) and Barrel% (5.4% → 7.7%) both rose — hitters trading
for power even as pitchers escalate.

![Quality of contact](charts/06_quality_of_contact.png)

---

## Data & Methodology Notes

- **Source:** MLB Statcast (pitch-level), 2015–2026, pulled via R.
- **Design:** one table per season (`sc_2015` … `sc_2026`), unified through the
  `all_pitches` view for cross-season queries.
- **`AVG()` and NULLs:** SQL's `AVG()` ignores NULLs, matching R's
  `mean(x, na.rm = TRUE)`; expected-stat averages use this behavior intentionally.
- **Early-season caveat:** expected stats (`expected_woba`,
  `estimated_slg_using_speedangle`) and barrel classification
  (`launch_speed_angle`) have thinner coverage in the earliest seasons, so
  2015–2016 contact-quality values rest on sparser data and should be read with
  that in mind.
- **2020 caveat:** the 60-game COVID-shortened season (~247k pitches vs. ~700k)
  is a small-sample outlier; year-specific spikes/dips around 2020 are partly
  artifact.
- **Performance:** cross-season aggregates scan ~8M rows and require an extended
  query timeout; single-season queries against the base tables return in well
  under a second.

---

## Reproducing

1. Load the 12 season CSVs into a MySQL `statcast` database (see loader in
   `sql/`), then run `sql/pitch_trends.sql` to build the views, metrics, physics,
   and stored procedure.
2. Set your MySQL password as an environment variable (`MYSQL_PWD`) rather than
   hardcoding it.
3. Run `R/make_charts.R` to pull from the database and render the charts.

---

*Built with MySQL 8, R, DBI/RMariaDB, and ggplot2.*
