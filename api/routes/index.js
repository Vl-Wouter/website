const express = require('express');
const router = express.Router();

// controllers
const AuthCtrl = require('../controllers/auth');
const UserCtrl = require('../controllers/user');
const CalendarCtrl = require('../controllers/calendar');
const EventCtrl = require('../controllers/event');
const EventSessionCtrl = require('../controllers/eventsession');
const ResourcesCtrl = require('../controllers/resources');
const SeriesCtrl = require('../controllers/series');
const TrackCtrl = require('../controllers/track');
const BlogCtrl = require('../controllers/blog');
const iCalCtrl = require('../controllers/ical');
const auth = require('../middleware/auth');
const VehClassCtrl = require('../controllers/classes');
const VehCatCtrl = require('../controllers/categories');

// routes ==================================================

// Authentication
router.post('/auth/login', AuthCtrl.login);
router.post('/auth/logout', AuthCtrl.logout);
router.post('/auth/changepassword', AuthCtrl.changepassword);
router.get('/auth/me', AuthCtrl.me);

// User
router.post('/users', auth.admin_auth, UserCtrl.createUser);
router.put('/users/:id', UserCtrl.updateUser);
router.delete('/users/:id', auth.admin_auth, UserCtrl.deleteUser);

// Calendar
router.get('/calendar', CalendarCtrl.getCalendar);

// Resources
router.get('/resources', auth.staff_auth, ResourcesCtrl.getResources);
router.get('/resources/timezones', auth.staff_auth, ResourcesCtrl.timezones);

// Blog
router.get('/blog', BlogCtrl.getBlog);

// Event
router.get('/event', auth.staff_auth, EventCtrl.find);
router.post('/event', auth.staff_auth, EventCtrl.createEvent);
router.put('/event/:id', auth.staff_auth, EventCtrl.updateEvent);
router.delete('/event/:id', auth.staff_auth, EventCtrl.deleteEvent);

// EventSession
router.post('/eventsession', auth.staff_auth, EventSessionCtrl.createEventSession);
router.put('/eventsession/:id', auth.staff_auth, EventSessionCtrl.updateEventSession);
router.delete('/eventsession/:id', auth.staff_auth, EventSessionCtrl.deleteEventSession);

// Series
router.get('/series', auth.staff_auth, SeriesCtrl.find);
router.get('/series/:id', SeriesCtrl.findOne);
router.post('/series', auth.staff_auth, SeriesCtrl.createSeries);
router.put('/series/:id', auth.staff_auth, SeriesCtrl.updateSeries);
router.delete('/series/:id', auth.staff_auth, SeriesCtrl.deleteSeries);

// Track
router.get('/track', auth.staff_auth, TrackCtrl.find);
router.get('/track/:id', auth.staff_auth, TrackCtrl.findOne);
router.post('/track', auth.staff_auth, TrackCtrl.createTrack);
router.put('/track/:id', auth.staff_auth, TrackCtrl.updateTrack);
router.delete('/track/:id', auth.staff_auth, TrackCtrl.deleteTrack);

// Blogposts
router.post('/blogs', auth.staff_auth, BlogCtrl.createBlogPost);
router.put('/blogs/:id', auth.staff_auth, BlogCtrl.updateBlogPost);
router.delete('/blogs/:id', auth.staff_auth, BlogCtrl.deleteBlogPost);

// Vehicle classes
router.get('/vehicleclasses', auth.staff_auth, VehClassCtrl.find);
router.get('/vehicleclasses/:id', auth.staff_auth, VehClassCtrl.findOne);
router.post('/vehicleclasses', auth.staff_auth, VehClassCtrl.create);
router.put('/vehicleclasses/:id', auth.staff_auth, VehClassCtrl.update);
router.delete('/vehicleclasses/:id', auth.staff_auth, VehClassCtrl.destroy);

// Vehicle Categories
router.get('/vehiclecategories', auth.staff_auth, VehCatCtrl.find);
router.get('/vehiclecategories/:id', auth.staff_auth, VehCatCtrl.findOne);
router.post('/vehiclecategories', auth.staff_auth, VehCatCtrl.create);
router.put('/vehiclecategories/:id', auth.staff_auth, VehCatCtrl.update);
router.delete('/vehiclecategories/:id', auth.staff_auth, VehCatCtrl.destroy);

// iCal
router.get('/calendar/ical/event/:id', iCalCtrl.createIcal);

// Catch-all, will return 404
router.get('*', (req, res) => {
	res.status(404).send();
});

module.exports = router;
