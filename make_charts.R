library(tidyverse)
library(DBI)



# All connection details are read from environment variables so no credentials
# live in this file. Set them in an untracked .Renviron file, e.g.:
#   DB_NAME=your_database
#   DB_HOST=your_host
#   DB_PORT=your_port
#   DB_USER=your_user
#   DB_PWD=your_password
# (.Renviron is git-ignored in this repo.)

con = dbConnect(
  RMariaDB::MariaDB(),
  dbname   = Sys.getenv("DB_NAME"),
  host     = Sys.getenv("DB_HOST"),
  port     = as.integer(Sys.getenv("DB_PORT")),
  user     = Sys.getenv("DB_USER"),
  password = Sys.getenv("DB_PWD")
)


dbGetQuery(con, "SELECT COUNT(*) AS n FROM sc_2025")

dbPlateDisc = dbGetQuery(con, "SELECT * FROM yearly_plate_discipline;")
dbQualityContact = dbGetQuery(con, "SELECT * FROM yearly_contact_quality;")
dbPitchPhysics = dbGetQuery(con, "SELECT * FROM pitch_physics;")


# Plotting the overall whiff rates as a trend through the seasons 
dbPlateDisc |>
  ggplot(aes(x = year, y = whiff_pct)) +
  geom_point() +
  geom_line() +
  geom_line(aes(x = year, y = zone_whiff_pct), color = 'black', linetype = 'dashed')+
  geom_point(aes(x = year, y = zone_whiff_pct), color = 'black', size = 0.75)+
  scale_x_continuous(breaks = dbPlateDisc$year)+
  annotate(geom = "text", x = 2024, y = 18.5, label = "Zone Whiff%")+
  annotate(geom = "text", x = 2024, y = 26, label = "Whiff%")+
  annotate(geom = "label", x = 2017.5, y = 21,
           label = "Whiff rates picked up at \n the turn of the decade but \n have since slowly declined",
           size = 7,                    
           fontface = "italic",           
           fill = "#FFFDD0",              
           label.size = 0.3,              
           color = "black")+               
  ylab("Whiff%")+
  labs(title = "League Avg. Whiff% By Season (2015-2026)")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = 'bold', color = 'black'))



#Plotting how the pitch type whiff rates compare through the years 
dbPlateDisc |>
  select(year, fb_whiff_pct, bb_whiff_pct, os_whiff_pct) |>
  pivot_longer(-year, names_to = "pitch_class", values_to = "whiff") |>
  mutate(pitch_class = recode(pitch_class,
                              fb_whiff_pct = "Fastball",
                              bb_whiff_pct = "Breaking",
                              os_whiff_pct = "Offspeed")) |>
  ggplot(aes(x = year, y = whiff, color = pitch_class)) +
  geom_line(linetype = "dashed") +
  geom_point(size = 0.75) +
  annotate(geom = "label", x = 2017.5, y = 25,
           label = "Fastball Whiff% picked until \n the turn of the decade then \n declined slowly since. \n Breaking + Offspeed have \n both been stagnating around 33%.",
           size = 4.5,                    
           fontface = "italic",           
           fill = "#FFFDD0",              
           label.size = 0.3,              
           color = "black")+ 
  scale_x_continuous(breaks = unique(dbPlateDisc$year)) +
  scale_color_manual(values = c(Fastball = "red", Breaking = "cyan", Offspeed = "green")) +
  labs(title = "League Avg. Whiff% vs Pitch Types By Season (2015-2026)",
       x = "Season", y = "Whiff%", color = NULL) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        legend.position = "top")


# league average Pitch Type Chase rates by season 
dbPlateDisc |>
  select(year, fb_chase_pct, bb_chase_pct, os_chase_pct) |>
  pivot_longer(-year, names_to = "pitch_class", values_to = "chase") |>
  mutate(pitch_class = recode(pitch_class,
                              fb_chase_pct = "Fastball",
                              bb_chase_pct = "Breaking",
                              os_chase_pct = "Offspeed")) |>
  ggplot(aes(x = year, y = chase, color = pitch_class)) +
  geom_line(linetype = "dashed") +
  geom_point(size = 0.75) +
  annotate(geom = "label", x = 2017.5, y = 27.5,
           label = "Fastball Chase% declined until \n the turn of the decade then \n picked up since. \n Breaking + Offspeed have \n both mostly slightly declined",
           size = 2.5,                    
           fontface = "italic",           
           fill = "#FFFDD0",              
           label.size = 0.3,              
           color = "black")+ 
  scale_x_continuous(breaks = unique(dbPlateDisc$year)) +
  scale_color_manual(values = c(Fastball = "red", Breaking = "cyan", Offspeed = "green")) +
  labs(title = "League Avg. Chase% By Season (2015-2026)",
       x = "Season", y = "Chase%", color = NULL) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        legend.position = "top")


#Plotting xSLGcon and xwOBAcon
dbQualityContact |>
  select(year, xwOBAcon, xSLGcon) |>
  pivot_longer(cols = -year, names_to = "Metric", values_to = "Value") |>
  ggplot(aes(x = year, y = Value, color = Metric)) +
  geom_line() +
  geom_point(size = 0.75) +
  geom_text(
    data = ~ filter(.x, year %in% c(2015, 2026)),
    aes(label = sprintf("%.3f", Value)),
    vjust = -0.8, size = 3, show.legend = FALSE
  ) +
  annotate(geom = "label", x = 2021, y = 0.45,
           label = "Largely unchanged \n Quality of Contact \n from 2015-2026",
           size = 5,                    
           fontface = "italic",           
           fill = "#FFFDD0",              
           label.size = 0.3,              
           color = "black")+ 
  scale_x_continuous(breaks = unique(dbQualityContact$year)) +
  scale_color_manual(values = c(xwOBAcon = "black", xSLGcon = "grey50")) +
  labs(title = "League Avg. Expected Contact Quality By Season (2015-2026)",
       x = "Season", y = "Expected Value", color = NULL) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        legend.position = "top")




#LA related QoC
dbQualityContact |>
  select(year, sweetspot_pct, hardhit_sweetspot_pct, groundball_pct) |>
  pivot_longer(cols = -year, names_to = "Metric", values_to = "Value") |>
  mutate(Metric = recode(Metric,
                         sweetspot_pct         = "SweetSpot%",
                         hardhit_sweetspot_pct = "HardHit SweetSpot%",
                         groundball_pct        = "GB%")) |>
  ggplot(aes(x = year, y = Value, color = Metric)) +
  geom_line() +
  geom_point(size = 0.75) +
  geom_text(
    data = ~ filter(.x, year %in% c(2015, 2026)),
    aes(label = sprintf("%.1f", Value)),
    vjust = -0.8, size = 3, show.legend = FALSE
  ) +
  annotate(geom = "label", x = 2021, y = 29,
           label = "More balls in the \n air from 2015-2026",
           size = 5,                    
           fontface = "italic",           
           fill = "#FFFDD0",              
           label.size = 0.3,              
           color = "black")+ 
  scale_x_continuous(breaks = unique(dbQualityContact$year)) +
  scale_color_manual(values = c(`SweetSpot%` = "red",
                                `HardHit SweetSpot%` = "cyan",
                                `GB%` = "green")) +
  labs(title = "League Avg. Batted-Ball Profile By Season (2015-2026)",
       x = "Season", y = "% of Batted Balls", color = NULL) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        legend.position = "top")


#EV related QoC
dbQualityContact |>
  select(year, barrel_pct, hardhit_pct) |>
  pivot_longer(cols = -year, names_to = "Metric", values_to = "Value") |>
  mutate(Metric = recode(Metric,
                         barrel_pct  = "Barrel%",
                         hardhit_pct = "HardHit%")) |>
  ggplot(aes(x = year, y = Value, color = Metric)) +
  geom_line() +
  geom_point(size = 0.75) +
  geom_text(
    data = ~ filter(.x, year %in% c(2015, 2026)),
    aes(label = sprintf("%.1f", Value)),
    vjust = -0.8, size = 3, show.legend = FALSE
  ) +
  annotate(geom = "label", x = 2021, y = 25,
           label = "Harder contact and \n more barrels from 2015-2026",
           size = 5,
           fontface = "italic",
           fill = "#FFFDD0",
           label.size = 0.3,
           color = "black") +
  scale_x_continuous(breaks = unique(dbQualityContact$year)) +
  scale_color_manual(values = c(`Barrel%` = "red",
                                `HardHit%` = "cyan")) +
  labs(title = "League Avg. Quality of Contact By Season (2015-2026)",
       x = "Season", y = "% of Batted Balls", color = NULL) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        legend.position = "top")
