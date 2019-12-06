INSERT INTO Track (id, name, country, length, map, timezone) VALUES (1, "Nordschleife", "Germany", 20.832, "", "Europe/Brussels");
INSERT INTO Track (id, name, country, length, map, timezone) VALUES (2, "Mount Panorama Circuit", "Australia", 6.213, "", "Australia/Sydney");
INSERT INTO Track (id, name, country, length, map, timezone) VALUES (3, "Circuit de Spa-Francorchamps", "Belgium", 7.004, "", "Europe/Brussels");
INSERT INTO Track (id, name, country, length, map, timezone) VALUES (4, "Daytona International Speedway", "United States", 5.73, "", "America/New_York");
INSERT INTO Track (id, name, country, length, map, timezone) VALUES (5, "Road America", "United States", 6.515, "", "America/Chicago");
INSERT INTO Track (id, name, country, length, map, timezone) VALUES (6, "Surfers Paradise Street Circuit", "Australia", 2.98, "", "Australia/Brisbane");
INSERT INTO Track (id, name, country, length, map, timezone) VALUES (7, "Phillip Island Grand Prix Circuit", "Australia", 4.445, "", "Australia/Sydney");

INSERT INTO Series (id, name, shortname, priority, logo) VALUES (1, "VLN Langstreckenmeisterschaft Nürburgring", "VLN", 1, "https://kappelermotorsport.files.wordpress.com/2015/08/logovln.gif");
INSERT INTO SeriesType (series, class) VALUES (1, 3);
INSERT INTO SeriesType (series, class) VALUES (1, 5);
INSERT INTO SeriesType (series, class) VALUES (1, 25);
INSERT INTO SeriesType (series, class) VALUES (1, 29);
INSERT INTO Series (id, name, shortname, priority, logo) VALUES (2, "Intercontinental GT Challenge", "IGTC", 2, "https://www.intercontinentalgtchallenge.com/images/logo-intercontinental-gt-challenge.png");
INSERT INTO SeriesType (series, class) VALUES (2, 3);
INSERT INTO Series (id, name, shortname, priority, logo) VALUES (3, "Blancpain Endurance Cup", "BES", 2, "https://www.norbert-siedler.com/wp-content/uploads/2016/02/BlancpainGTSeriesLogo.jpg");
INSERT INTO SeriesType (series, class) VALUES (3, 3);
INSERT INTO Series (id, name, shortname, priority, logo) VALUES (4, "GT2", "GT2", 2, "https://upload.wikimedia.org/wikipedia/commons/c/cf/SROMotorsportsGroup_logo.png");
INSERT INTO SeriesType (series, class) VALUES (4, 4);
INSERT INTO Series (id, name, shortname, priority, logo) VALUES (5, "IMSA WeatherTech SportsCar Championship", "WSCC", 1, "https://upload.wikimedia.org/wikipedia/en/thumb/2/28/WeatherTech_SportsCar_Championship_logo.png/300px-WeatherTech_SportsCar_Championship_logo.png");
INSERT INTO SeriesType (series, class) VALUES (5, 10);
INSERT INTO SeriesType (series, class) VALUES (5, 11);
INSERT INTO SeriesType (series, class) VALUES (5, 2);
INSERT INTO SeriesType (series, class) VALUES (5, 3);
INSERT INTO Series (id, name, shortname, priority, logo) VALUES (6, "Virgin Australia Supercars Championship", "V8SC", 3, "https://upload.wikimedia.org/wikipedia/en/thumb/d/dd/Supercars_Championship_logo.svg/1200px-Supercars_Championship_logo.svg.png");
INSERT INTO SeriesType (series, class) VALUES (6, 27);
INSERT INTO Series (id, name, shortname, priority, logo) VALUES (7, "SUPER GT", "SGT", 1, "https://en.wikipedia.org/wiki/Super_GT#/media/File:SUPER_GT_logo.svg");
INSERT INTO SeriesType (series, class) VALUES (7, 1);
INSERT INTO SeriesType (series, class) VALUES (7, 3);

INSERT INTO Event (id, name, logo, startdate, enddate, track, priority, mainseries) VALUES (1, "Bathurst 12 Hour", "https://da2.rbmbtnx.net/v4/RBTV/pd/FO-1Y9A5DRAW5N11/im:i:q_70,f_png,e_trim/im:i:w_600,c_limit/a:s/st:iAJvI63Os4zYB9_BGlY7jW/bathurst12hour_titletreatment_squarelogo.svg", "2019-02-01", "2019-02-03", 2, 2, 2);
INSERT INTO Event (id, name, logo, startdate, enddate, track, priority, mainseries) VALUES (2, "Nürburgring 24 Hours", "https://reifenpresse.de/wp-content/uploads/2018/11/ADAC-neuer-24h-Titelsponsor.jpg","2019-06-20", "2019-06-23", 1, 1, 1);
INSERT INTO Event (id, name, logo, startdate, enddate, track, priority, mainseries) VALUES (3, "Spa 24 Hours", "https://tickets-2-u.com/wp-content/uploads/2018/05/24Hours_Spa.png", "2019-07-26", "2019-07-28", 3, 2, 3);
INSERT INTO Event (id, name, startdate, enddate, track, priority, mainseries) VALUES (4, "Bathurst 1000", "2019-10-13", "2019-10-13", 2, 3, 6);
INSERT INTO Event (id, name, startdate, enddate, track, priority, mainseries) VALUES (5, "Gold Coast 600", "2019-10-26", "2019-10-27", 6, 3, 6);
INSERT INTO Event (id, name, startdate, enddate, track, priority, mainseries) VALUES (6, "Road Race Showcase at Road America", "2019-08-03", "2019-08-04", 5, 2, 5);
INSERT INTO Event (id, name, startdate, enddate, track, priority, mainseries) VALUES (7, "24 Hours of Daytona", "2020-01-24", "2020-01-26", 4, 1, 5);
INSERT INTO Event (id, name, startdate, enddate, track, priority, mainseries) VALUES (8, "51. ADAC Barbarossapreis (VLN 8)", "2019-10-13", "2019-10-13", 1, 2, 1);

# Bathurst 12 Hours
INSERT INTO SupportSeries (event, series) VALUES (1, 6);
INSERT INTO SupportSeries (event, series) VALUES (1, 4);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("GT2 Race", "2019-02-02 02:00", 1, 4, 60);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Top 10 Shootout", "2019-02-02 06:30", 1, 6, 30);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Race", "2019-02-02 19:45", 1, 2, 720);

# N24
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Qualifying", "2019-06-21 14:00", 2, 1, 120);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Race", "2019-06-22 15:00", 2, 1, 1440);

# Spa 24
INSERT INTO SupportSeries (event, series) VALUES (3, 4);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Top 3 GT2 shootout", "2019-07-26 14:00", 3, 4, 30);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Inaugural GT2 race", "2019-07-26 18:00", 3, 4, 60);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Top 30 Qualifying", "2019-07-27 10:00", 3, 3, 45);
INSERT INTO EventSession (name, starttime, event, series, duration) VALUES ("Race", "2019-07-27 16:00", 3, 3, 1440);
