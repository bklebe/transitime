create table ActiveRevisions (id integer not null, configRev integer, travelTimesRev integer, primary key (id)) type=MyISAM;
create table Agencies (configRev integer not null, agencyName varchar(60) not null, agencyFareUrl varchar(255), agencyId varchar(60), agencyLang varchar(15), agencyPhone varchar(15), agencyTimezone varchar(40), agencyUrl varchar(255), maxLat double precision, maxLon double precision, minLat double precision, minLon double precision, primary key (configRev, agencyName)) type=MyISAM;
create table ArrivalsDepartures (DTYPE varchar(31) not null, vehicleId varchar(60) not null, tripId varchar(60) not null, time datetime(3) not null, stopId varchar(60) not null, isArrival bit not null, gtfsStopSeq integer not null, avlTime datetime(3), blockId varchar(60), configRev integer, directionId varchar(60), freqStartTime datetime(3), routeId varchar(60), routeShortName varchar(60), scheduledTime datetime(3), serviceId varchar(60), stopOrder integer, stopPathIndex integer, stopPathLength float, tripIndex integer, primary key (vehicleId, tripId, time, stopId, isArrival, gtfsStopSeq)) type=MyISAM;
create table AvlReports (vehicleId varchar(60) not null, time datetime(3) not null, assignmentId varchar(60), assignmentType varchar(40), driverId varchar(60), field1Name varchar(60), field1Value varchar(60), heading float, licensePlate varchar(10), lat double precision, lon double precision, passengerCount integer, passengerFullness float, source varchar(10), speed float, timeProcessed datetime(3), primary key (vehicleId, time)) type=MyISAM;
create table Block_to_Trip_joinTable (Blocks_serviceId varchar(60) not null, Blocks_configRev integer not null, Blocks_blockId varchar(60) not null, trips_tripId varchar(60) not null, trips_startTime integer not null, trips_configRev integer not null, listIndex integer not null, primary key (Blocks_serviceId, Blocks_configRev, Blocks_blockId, listIndex)) type=MyISAM;
create table Blocks (serviceId varchar(60) not null, configRev integer not null, blockId varchar(60) not null, endTime integer, routeIds blob, startTime integer, primary key (serviceId, configRev, blockId)) type=MyISAM;
create table CalendarDates (serviceId varchar(60) not null, date date not null, configRev integer not null, exceptionType varchar(2), primary key (serviceId, date, configRev)) type=MyISAM;
create table Calendars (wednesday bit not null, tuesday bit not null, thursday bit not null, sunday bit not null, startDate date not null, serviceId varchar(60) not null, saturday bit not null, monday bit not null, friday bit not null, endDate date not null, configRev integer not null, primary key (wednesday, tuesday, thursday, sunday, startDate, serviceId, saturday, monday, friday, endDate, configRev)) type=MyISAM;
create table ConfigRevision (configRev integer not null, notes longtext, processedTime datetime(3), zipFileLastModifiedTime datetime(3), primary key (configRev)) type=MyISAM;
create table DbTest (id integer not null, primary key (id)) type=MyISAM;
create table FareAttributes (fareId varchar(60) not null, configRev integer not null, currencyType varchar(3), paymentMethod varchar(255), price float, transferDuration integer, transfers varchar(255), primary key (fareId, configRev)) type=MyISAM;
create table FareRules (routeId varchar(60) not null, originId varchar(60) not null, fareId varchar(60) not null, destinationId varchar(60) not null, containsId varchar(60) not null, configRev integer not null, primary key (routeId, originId, fareId, destinationId, containsId, configRev)) type=MyISAM;
create table Frequencies (tripId varchar(60) not null, startTime integer not null, configRev integer not null, endTime integer, exactTimes bit, headwaySecs integer, primary key (tripId, startTime, configRev)) type=MyISAM;
create table Headway (id bigint not null, average double precision, coefficientOfVariation double precision, configRev integer, creationTime datetime(3), firstDeparture datetime(3), headway double precision, numVehicles integer, otherVehicleId varchar(60), routeId varchar(60), secondDeparture datetime(3), stopId varchar(60), tripId varchar(60), variance double precision, vehicleId varchar(60), primary key (id)) type=MyISAM;
create table hibernate_sequence (next_val bigint) type=MyISAM;
insert into hibernate_sequence values ( 1 );
create table HoldingTimes (id bigint not null, arrivalPredictionUsed bit, arrivalTime datetime(3), arrivalUsed bit, configRev integer, creationTime datetime(3), hasD1 bit, holdingTime datetime(3), numberPredictionsUsed integer, routeId varchar(60), stopId varchar(60), tripId varchar(60), vehicleId varchar(60), primary key (id)) type=MyISAM;
create table Matches (vehicleId varchar(60) not null, avlTime datetime(3) not null, atStop bit, blockId varchar(60), configRev integer, distanceAlongSegment float, distanceAlongStopPath float, segmentIndex integer, serviceId varchar(255), stopPathIndex integer, tripId varchar(60), primary key (vehicleId, avlTime)) type=MyISAM;
create table MeasuredArrivalTimes (time datetime(3) not null, stopId varchar(60) not null, directionId varchar(60), headsign varchar(60), routeId varchar(60), routeShortName varchar(60), primary key (time, stopId)) type=MyISAM;
create table MonitoringEvents (type varchar(40) not null, time datetime(3) not null, message longtext, triggered bit, value double precision, primary key (type, time)) type=MyISAM;
create table PredictionAccuracy (id bigint not null, affectedByWaitStop bit, arrivalDepartureTime datetime(3), directionId varchar(60), predictedTime datetime(3), predictionAccuracyMsecs integer, predictionReadTime datetime(3), predictionSource varchar(60), routeId varchar(60), routeShortName varchar(60), stopId varchar(60), tripId varchar(60), vehicleId varchar(60), primary key (id)) type=MyISAM;
create table PredictionEvents (vehicleId varchar(60) not null, time datetime(3) not null, eventType varchar(60) not null, arrivalTime datetime(3), arrivalstopid varchar(60), avlTime datetime(3), blockId varchar(60), departureTime datetime(3), departurestopid varchar(60), description longtext, lat double precision, lon double precision, referenceVehicleId varchar(60), routeId varchar(60), routeShortName varchar(60), serviceId varchar(60), stopId varchar(60), tripId varchar(60), primary key (vehicleId, time, eventType)) type=MyISAM;
create table Predictions (id bigint not null, affectedByWaitStop bit, avlTime datetime(3), configRev integer, creationTime datetime(3), gtfsStopSeq integer, isArrival bit, predictionTime datetime(3), routeId varchar(60), schedBasedPred bit, stopId varchar(60), tripId varchar(60), vehicleId varchar(60), primary key (id)) type=MyISAM;
create table Routes (id varchar(60) not null, configRev integer not null, color varchar(10), description longtext, maxLat double precision, maxLon double precision, minLat double precision, minLon double precision, hidden bit, longName varchar(255), maxDistance double precision, name varchar(255), routeOrder integer, shortName varchar(255), textColor varchar(10), type varchar(2), primary key (id, configRev)) type=MyISAM;
create table StopPath_locations (StopPath_tripPatternId varchar(120) not null, StopPath_stopPathId varchar(120) not null, StopPath_configRev integer not null, lat double precision, lon double precision, locations_ORDER integer not null, primary key (StopPath_tripPatternId, StopPath_stopPathId, StopPath_configRev, locations_ORDER)) type=MyISAM;
create table StopPathPredictions (id bigint not null, algorithm varchar(255), creationTime datetime(3), predictionTime double precision, startTime integer, stopPathIndex integer, travelTime bit, tripId varchar(60), vehicleId varchar(255), primary key (id)) type=MyISAM;
create table StopPaths (tripPatternId varchar(120) not null, stopPathId varchar(120) not null, configRev integer not null, breakTime integer, gtfsStopSeq integer, lastStopInTrip bit, layoverStop bit, maxDistance double precision, maxSpeed double precision, pathLength double precision, routeId varchar(60), scheduleAdherenceStop bit, stopId varchar(60), waitStop bit, primary key (tripPatternId, stopPathId, configRev)) type=MyISAM;
create table Stops (id varchar(60) not null, configRev integer not null, code integer, hidden bit, layoverStop bit, lat double precision, lon double precision, name varchar(255), timepointStop bit, waitStop bit, primary key (id, configRev)) type=MyISAM;
create table Transfers (toStopId varchar(60) not null, fromStopId varchar(60) not null, configRev integer not null, minTransferTime integer, transferType varchar(1), primary key (toStopId, fromStopId, configRev)) type=MyISAM;
create table TravelTimesForStopPaths (id integer not null, configRev integer, daysOfWeekOverride smallint, howSet varchar(5), stopPathId varchar(120), stopTimeMsec integer, travelTimeSegmentLength float, travelTimesMsec mediumblob, travelTimesRev integer, primary key (id)) type=MyISAM;
create table TravelTimesForTrip_to_TravelTimesForPath_joinTable (traveltimesfortrips_id integer not null, traveltimesforstoppaths_id integer not null, listIndex integer not null, primary key (traveltimesfortrips_id, listIndex)) type=MyISAM;
create table TravelTimesForTrips (id integer not null, configRev integer, travelTimesRev integer, tripCreatedForId varchar(60), tripPatternId varchar(120), primary key (id)) type=MyISAM;
create table Trip_scheduledTimesList (Trip_tripId varchar(60) not null, Trip_startTime integer not null, Trip_configRev integer not null, arrivalTime integer, departureTime integer, scheduledTimesList_ORDER integer not null, primary key (Trip_tripId, Trip_startTime, Trip_configRev, scheduledTimesList_ORDER)) type=MyISAM;
create table TripPattern_to_Path_joinTable (trippattern_id varchar(120) not null, trippatterns_configrev integer not null, stoppaths_trippatternid varchar(120) not null, stoppaths_stoppathid varchar(120) not null, stoppaths_configrev integer not null, listIndex integer not null, primary key (trippattern_id, trippatterns_configrev, listIndex)) type=MyISAM;
create table TripPatterns (id varchar(120) not null, configRev integer not null, directionId varchar(60), maxLat double precision, maxLon double precision, minLat double precision, minLon double precision, headsign varchar(255), routeId varchar(60), routeShortName varchar(80), shapeId varchar(60), primary key (id, configRev)) type=MyISAM;
create table Trips (tripId varchar(60) not null, startTime integer not null, configRev integer not null, blockId varchar(60), directionId varchar(60), endTime integer, exactTimesHeadway bit, headsign varchar(255), noSchedule bit, routeId varchar(60), routeShortName varchar(60), serviceId varchar(60), shapeId varchar(60), tripShortName varchar(60), travelTimes_id integer, tripPattern_id varchar(120), tripPattern_configRev integer, primary key (tripId, startTime, configRev)) type=MyISAM;
create table VehicleConfigs (id varchar(60) not null, capacity integer, crushCapacity integer, description varchar(255), nonPassengerVehicle bit, trackerId varchar(60), type integer, primary key (id)) type=MyISAM;
create table VehicleEvents (vehicleId varchar(60) not null, time datetime(3) not null, eventType varchar(60) not null, avlTime datetime(3), becameUnpredictable bit, blockId varchar(60), description longtext, lat double precision, lon double precision, predictable bit, routeId varchar(60), routeShortName varchar(60), serviceId varchar(60), stopId varchar(60), supervisor varchar(60), tripId varchar(60), primary key (vehicleId, time, eventType)) type=MyISAM;
create table VehicleStates (vehicleId varchar(60) not null, avlTime datetime(3) not null, blockId varchar(60), isDelayed bit, isForSchedBasedPreds bit, isLayover bit, isPredictable bit, isWaitStop bit, routeId varchar(60), routeShortName varchar(80), schedAdh varchar(50), schedAdhMsec integer, schedAdhWithinBounds bit, tripId varchar(60), tripShortName varchar(60), primary key (vehicleId, avlTime)) type=MyISAM;
create index ArrivalsDeparturesTimeIndex on ArrivalsDepartures (time);
create index ArrivalsDeparturesRouteTimeIndex on ArrivalsDepartures (routeShortName, time);
create index AvlReportsTimeIndex on AvlReports (time);
create index HeadwayIndex on Headway (creationTime);
create index HoldingTimeIndex on HoldingTimes (creationTime);
create index AvlTimeIndex on Matches (avlTime);
create index MeasuredArrivalTimesIndex on MeasuredArrivalTimes (time);
create index MonitoringEventsTimeIndex on MonitoringEvents (time);
create index PredictionAccuracyTimeIndex on PredictionAccuracy (arrivalDepartureTime);
create index PredictionEventsTimeIndex on PredictionEvents (time);
create index PredictionTimeIndex on Predictions (creationTime);
create index StopPathPredictionTimeIndex on StopPathPredictions (tripId, stopPathIndex);
create index TravelTimesRevIndex on TravelTimesForTrips (travelTimesRev);
alter table TripPattern_to_Path_joinTable add constraint UK_4ww0sawnawjobcxlgdih33bc unique (stoppaths_trippatternid, stoppaths_stoppathid, stoppaths_configrev);
create index VehicleEventsTimeIndex on VehicleEvents (time);
create index VehicleStateAvlTimeIndex on VehicleStates (avlTime);
alter table Block_to_Trip_joinTable add constraint FKqg0vrfi2c0mhljljc5wry3cws foreign key (trips_tripId, trips_startTime, trips_configRev) references Trips (tripId, startTime, configRev);
alter table Block_to_Trip_joinTable add constraint FKmutbdkef1hlnbokar10els0bw foreign key (Blocks_serviceId, Blocks_configRev, Blocks_blockId) references Blocks (serviceId, configRev, blockId);
alter table StopPath_locations add constraint FKs0cihlpjcvg1ts5r435tcwof5 foreign key (StopPath_tripPatternId, StopPath_stopPathId, StopPath_configRev) references StopPaths (tripPatternId, stopPathId, configRev);
alter table TravelTimesForTrip_to_TravelTimesForPath_joinTable add constraint FKrkybelw3p2vjebstcdwsfo32a foreign key (traveltimesforstoppaths_id) references TravelTimesForStopPaths (id);
alter table TravelTimesForTrip_to_TravelTimesForPath_joinTable add constraint FKq844j8tgr0txrdu4ctdq0dwv9 foreign key (traveltimesfortrips_id) references TravelTimesForTrips (id);
alter table Trip_scheduledTimesList add constraint FKc4y4751f2nbeexn1625x44l4e foreign key (Trip_tripId, Trip_startTime, Trip_configRev) references Trips (tripId, startTime, configRev);
alter table TripPattern_to_Path_joinTable add constraint FKobx6i9q7nkd6j75dcn6qp4ur6 foreign key (stoppaths_trippatternid, stoppaths_stoppathid, stoppaths_configrev) references StopPaths (tripPatternId, stopPathId, configRev);
alter table TripPattern_to_Path_joinTable add constraint FKp7s9opfx23r0ph7wo34m7cagf foreign key (trippattern_id, trippatterns_configrev) references TripPatterns (id, configRev);
alter table Trips add constraint FKmya233fdav0juhemlpteee6v1 foreign key (travelTimes_id) references TravelTimesForTrips (id);
alter table Trips add constraint FKbkk0bsuck446iek7xxw1u8ngi foreign key (tripPattern_id, tripPattern_configRev) references TripPatterns (id, configRev);
