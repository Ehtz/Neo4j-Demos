MATCH (n) DETACH DELETE n;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:56, properties:{material:"Aluminium Alloy", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-28'), name:"BrakeCaliper-1L", stock:15}}, {_id:57, properties:{material:"Aluminium Alloy", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-28'), name:"BrakeCaliper-1R", stock:15}}, {_id:58, properties:{material:"Aluminium Alloy", fabricant:"Faiveley Transport", fabricationDate:date('2021-11-29'), name:"BrakeCaliper-2L", stock:10}}, {_id:59, properties:{material:"Aluminium Alloy", fabricant:"Faiveley Transport", fabricationDate:date('2021-11-29'), name:"BrakeCaliper-2R", stock:10}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:BrakeCaliper:Part;
UNWIND [{_id:8, properties:{installedOn:date('2022-06-01'), material:"Welded Steel S355", fabricant:"Alstom", fabricationDate:date('2022-01-10'), name:"BogieAssembly_Y25", lastInspection:date('2024-06-01'), stock:5}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Bogie:Part;
UNWIND [{_id:22, properties:{installedOn:date('2021-10-20'), material:"Bearing Steel", fabricant:"SKF", fabricationDate:date('2021-10-15'), name:"BearingAssembly-1L", lastInspection:date('2024-03-01'), stock:50}}, {_id:23, properties:{installedOn:date('2021-10-21'), material:"Bearing Steel", fabricant:"SKF", fabricationDate:date('2021-10-16'), name:"BearingAssembly-1R", lastInspection:date('2024-03-01'), stock:50}}, {_id:24, properties:{installedOn:date('2021-10-25'), material:"Bearing Steel", fabricant:"Timken", fabricationDate:date('2021-10-18'), name:"BearingAssembly-2L", lastInspection:date('2023-11-01'), stock:0}}, {_id:25, properties:{installedOn:date('2021-10-26'), material:"Bearing Steel", fabricant:"SKF", fabricationDate:date('2021-10-19'), name:"BearingAssembly-2R", lastInspection:date('2024-03-01'), stock:50}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:BearingAssembly:Part;
UNWIND [{_id:10, properties:{installedOn:date('2022-06-01'), material:"Steel Composite", fabricant:"Siemens Mobility", fabricationDate:date('2021-12-01'), name:"WheelsetAssembly-1", lastInspection:date('2024-03-01'), stock:8}}, {_id:11, properties:{installedOn:date('2022-06-01'), material:"Steel Composite", fabricant:"Siemens Mobility", fabricationDate:date('2021-12-05'), name:"WheelsetAssembly-2", lastInspection:date('2024-03-01'), stock:8}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:WheelsetAssembly;
UNWIND [{_id:50, properties:{material:"Spring Steel Bar", fabricant:"Siemens Mobility", fabricationDate:date('2021-11-20'), name:"AntiRollBar-1", stock:10}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:AntiRollBar;
UNWIND [{_id:26, properties:{material:"Chrome Steel", fabricant:"SKF", fabricationDate:date('2021-10-10'), name:"RollerBearing-1L", stock:100}}, {_id:28, properties:{material:"Chrome Steel", fabricant:"SKF", fabricationDate:date('2021-10-10'), name:"RollerBearing-1R", stock:100}}, {_id:30, properties:{material:"Chrome Steel", fabricant:"Timken", fabricationDate:date('2021-10-11'), name:"RollerBearing-2L", stock:0}}, {_id:32, properties:{material:"Chrome Steel", fabricant:"SKF", fabricationDate:date('2021-10-11'), name:"RollerBearing-2R", stock:100}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:RollerBearing;
UNWIND [{_id:9, properties:{installedOn:date('2022-06-01'), material:"S355 Steel Plate", fabricant:"Alstom", fabricationDate:date('2021-11-15'), name:"BogieFrame_Y25-001", lastInspection:date('2024-06-01'), stock:5}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:BogieFrame;
UNWIND [{_id:36, properties:{material:"Hydraulic", fabricant:"Voith", fabricationDate:date('2021-11-05'), name:"PriDamper-1L", stock:20}}, {_id:39, properties:{material:"Hydraulic", fabricant:"Voith", fabricationDate:date('2021-11-06'), name:"PriDamper-1R", stock:20}}, {_id:42, properties:{material:"Hydraulic", fabricant:"Voith", fabricationDate:date('2021-11-07'), name:"PriDamper-2L", stock:20}}, {_id:45, properties:{material:"Hydraulic", fabricant:"Voith", fabricationDate:date('2021-11-08'), name:"PriDamper-2R", stock:20}}, {_id:48, properties:{material:"Hydraulic", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-15'), name:"SecDamper-L", stock:15}}, {_id:49, properties:{material:"Hydraulic", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-16'), name:"SecDamper-R", stock:15}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:Damper;
UNWIND [{_id:51, properties:{material:"Various", fabricant:"Knorr-Bremse", fabricationDate:date('2021-12-10'), name:"BrakeSystemAssembly", stock:5}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:BrakeSystem;
UNWIND [{_id:78, properties:{lastUpdated:date('2025-03-01'), reason:"closed site", level:"high"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:SupplierRisk;
UNWIND [{_id:68, properties:{material:"Pneumatic Cylinder", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-27'), name:"BrakeActuator-1L", stock:15}}, {_id:69, properties:{material:"Pneumatic Cylinder", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-27'), name:"BrakeActuator-1R", stock:15}}, {_id:70, properties:{material:"Pneumatic Cylinder", fabricant:"Faiveley Transport", fabricationDate:date('2021-11-28'), name:"BrakeActuator-2L", stock:10}}, {_id:71, properties:{material:"Pneumatic Cylinder", fabricant:"Faiveley Transport", fabricationDate:date('2021-11-28'), name:"BrakeActuator-2R", stock:10}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:BrakeActuator;
UNWIND [{_id:77, properties:{date:date('2024-06-01'), result:"pass", id:"QA2024-01"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:QualityAudit;
UNWIND [{_id:27, properties:{material:"Cast Iron", fabricant:"SKF", fabricationDate:date('2021-10-12'), name:"BearingHousing-1L", stock:50}}, {_id:29, properties:{material:"Cast Iron", fabricant:"SKF", fabricationDate:date('2021-10-12'), name:"BearingHousing-1R", stock:50}}, {_id:31, properties:{material:"Cast Iron", fabricant:"Timken", fabricationDate:date('2021-10-13'), name:"BearingHousing-2L", stock:0}}, {_id:33, properties:{material:"Cast Iron", fabricant:"SKF", fabricationDate:date('2021-10-14'), name:"BearingHousing-2R", stock:50}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:BearingHousing;
UNWIND [{_id:46, properties:{material:"Rubber/Metal", fabricant:"Wabtec", fabricationDate:date('2021-11-10'), name:"SecAirSpring-L", stock:15}}, {_id:47, properties:{material:"Rubber/Metal", fabricant:"Wabtec", fabricationDate:date('2021-11-11'), name:"SecAirSpring-R", stock:15}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:AirSpring:Part;
UNWIND [{_id:52, properties:{material:"Cast Iron", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-25'), name:"BrakeDisc-1L", stock:20}}, {_id:53, properties:{material:"Cast Iron", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-25'), name:"BrakeDisc-1R", stock:20}}, {_id:54, properties:{material:"Cast Iron", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-26'), name:"BrakeDisc-2L", stock:20}}, {_id:55, properties:{material:"Cast Iron", fabricant:"Knorr-Bremse", fabricationDate:date('2021-11-26'), name:"BrakeDisc-2R", stock:20}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:BrakeDisc;
UNWIND [{_id:34, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-01'), name:"PriSpring-1L-1", stock:40}}, {_id:35, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-01'), name:"PriSpring-1L-2", stock:40}}, {_id:37, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-02'), name:"PriSpring-1R-1", stock:40}}, {_id:38, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-02'), name:"PriSpring-1R-2", stock:40}}, {_id:40, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-03'), name:"PriSpring-2L-1", stock:40}}, {_id:41, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-03'), name:"PriSpring-2L-2", stock:40}}, {_id:43, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-04'), name:"PriSpring-2R-1", stock:40}}, {_id:44, properties:{material:"Spring Steel", fabricant:"Wabtec", fabricationDate:date('2021-11-04'), name:"PriSpring-2R-2", stock:40}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:CoilSpring;
UNWIND [{_id:12, properties:{installedOn:date('2021-12-01'), material:"Forged Steel EA1N", fabricant:"Siemens Mobility", fabricationDate:date('2021-10-01'), name:"Axle-1", lastInspection:date('2024-03-01'), stock:15}}, {_id:13, properties:{installedOn:date('2021-12-05'), material:"Forged Steel EA1N", fabricant:"Siemens Mobility", fabricationDate:date('2021-10-05'), name:"Axle-2", lastInspection:date('2024-03-01'), stock:15}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Part:Axle;
UNWIND [{_id:0, properties:{name:"Alstom", status:"active"}}, {_id:1, properties:{name:"Siemens Mobility", status:"active"}}, {_id:2, properties:{name:"Knorr-Bremse", status:"active"}}, {_id:3, properties:{name:"SKF", status:"active"}}, {_id:4, properties:{name:"Voith", status:"active"}}, {_id:5, properties:{name:"Wabtec", status:"active"}}, {_id:6, properties:{name:"Timken", status:"closed"}}, {_id:7, properties:{name:"Faiveley Transport", status:"active"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Factory;
UNWIND [{_id:60, properties:{material:"Organic", fabricant:"Knorr-Bremse", fabricationDate:date('2021-12-01'), name:"BrakePad-1L-Inner", stock:50}}, {_id:61, properties:{material:"Organic", fabricant:"Knorr-Bremse", fabricationDate:date('2021-12-01'), name:"BrakePad-1L-Outer", stock:50}}, {_id:62, properties:{material:"Organic", fabricant:"Knorr-Bremse", fabricationDate:date('2021-12-02'), name:"BrakePad-1R-Inner", stock:50}}, {_id:63, properties:{material:"Organic", fabricant:"Knorr-Bremse", fabricationDate:date('2021-12-02'), name:"BrakePad-1R-Outer", stock:50}}, {_id:64, properties:{material:"Sintered", fabricant:"Faiveley Transport", fabricationDate:date('2021-12-03'), name:"BrakePad-2L-Inner", stock:40}}, {_id:65, properties:{material:"Sintered", fabricant:"Faiveley Transport", fabricationDate:date('2021-12-03'), name:"BrakePad-2L-Outer", stock:40}}, {_id:66, properties:{material:"Sintered", fabricant:"Faiveley Transport", fabricationDate:date('2021-12-04'), name:"BrakePad-2R-Inner", stock:40}}, {_id:67, properties:{material:"Sintered", fabricant:"Faiveley Transport", fabricationDate:date('2021-12-04'), name:"BrakePad-2R-Outer", stock:40}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:BrakePad:Part;
UNWIND [{_id:18, properties:{installedOn:date('2021-12-01'), material:"Cast Steel", fabricant:"SKF", fabricationDate:date('2021-10-20'), name:"Axlebox-1L", lastInspection:date('2024-03-01'), stock:25}}, {_id:19, properties:{installedOn:date('2021-12-01'), material:"Cast Steel", fabricant:"SKF", fabricationDate:date('2021-10-21'), name:"Axlebox-1R", lastInspection:date('2024-03-01'), stock:25}}, {_id:20, properties:{installedOn:date('2021-12-05'), material:"Cast Steel", fabricant:"Timken", fabricationDate:date('2021-10-25'), name:"Axlebox-2L", lastInspection:date('2023-11-01'), stock:0}}, {_id:21, properties:{installedOn:date('2021-12-05'), material:"Cast Steel", fabricant:"SKF", fabricationDate:date('2021-10-26'), name:"Axlebox-2R", lastInspection:date('2024-03-01'), stock:25}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Axlebox:Part;
UNWIND [{_id:14, properties:{installedOn:date('2021-12-01'), material:"Rolled Steel R7", fabricant:"Voith", fabricationDate:date('2021-09-10'), name:"Wheel-1L", lastInspection:date('2024-03-01'), stock:30}}, {_id:15, properties:{installedOn:date('2021-12-01'), material:"Rolled Steel R7", fabricant:"Voith", fabricationDate:date('2021-09-11'), name:"Wheel-1R", lastInspection:date('2024-03-01'), stock:30}}, {_id:16, properties:{installedOn:date('2021-12-05'), material:"Rolled Steel R7", fabricant:"Voith", fabricationDate:date('2021-09-15'), name:"Wheel-2L", lastInspection:date('2024-03-01'), stock:30}}, {_id:17, properties:{installedOn:date('2021-12-05'), material:"Rolled Steel R7", fabricant:"Voith", fabricationDate:date('2021-09-16'), name:"Wheel-2R", lastInspection:date('2024-03-01'), stock:30}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Wheel:Part;
UNWIND [{_id:72, properties:{material:"Electronic", fabricant:"Siemens Mobility", fabricationDate:date('2021-11-15'), name:"SpeedSensor-1L", stock:20}}, {_id:73, properties:{material:"Electronic", fabricant:"Siemens Mobility", fabricationDate:date('2021-11-15'), name:"SpeedSensor-1R", stock:20}}, {_id:74, properties:{material:"Electronic", fabricant:"Siemens Mobility", fabricationDate:date('2021-11-16'), name:"SpeedSensor-2L", stock:20}}, {_id:75, properties:{material:"Electronic", fabricant:"Siemens Mobility", fabricationDate:date('2021-11-16'), name:"SpeedSensor-2R", stock:20}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:SpeedSensor:Part;
UNWIND [{_id:76, properties:{country:"FR", site:"Alstom Belfort", id:"U1", type:"Manufacturing"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Unit;
UNWIND [{start: {_id:20}, end: {_id:6}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPPLIED_BY_RISKY]->(end) SET r += row.properties;
UNWIND [{start: {_id:10}, end: {_id:14}, properties:{}}, {start: {_id:10}, end: {_id:15}, properties:{}}, {start: {_id:11}, end: {_id:16}, properties:{}}, {start: {_id:11}, end: {_id:17}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:51}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:72}, end: {_id:51}, properties:{}}, {start: {_id:73}, end: {_id:51}, properties:{}}, {start: {_id:74}, end: {_id:51}, properties:{}}, {start: {_id:75}, end: {_id:51}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFECTS]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:0}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:9}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:51}, end: {_id:68}, properties:{}}, {start: {_id:51}, end: {_id:69}, properties:{}}, {start: {_id:51}, end: {_id:70}, properties:{}}, {start: {_id:51}, end: {_id:71}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:18}, end: {_id:3}, properties:{}}, {start: {_id:19}, end: {_id:3}, properties:{}}, {start: {_id:20}, end: {_id:6}, properties:{}}, {start: {_id:21}, end: {_id:3}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:36}, end: {_id:4}, properties:{}}, {start: {_id:39}, end: {_id:4}, properties:{}}, {start: {_id:42}, end: {_id:4}, properties:{}}, {start: {_id:45}, end: {_id:4}, properties:{}}, {start: {_id:48}, end: {_id:2}, properties:{}}, {start: {_id:49}, end: {_id:2}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:6}, end: {_id:78}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_RISK]->(end) SET r += row.properties;
UNWIND [{start: {_id:14}, end: {_id:12}, properties:{}}, {start: {_id:15}, end: {_id:12}, properties:{}}, {start: {_id:16}, end: {_id:13}, properties:{}}, {start: {_id:17}, end: {_id:13}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DEPENDS_ON]->(end) SET r += row.properties;
UNWIND [{start: {_id:26}, end: {_id:3}, properties:{}}, {start: {_id:28}, end: {_id:3}, properties:{}}, {start: {_id:30}, end: {_id:6}, properties:{}}, {start: {_id:32}, end: {_id:3}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:51}, end: {_id:56}, properties:{}}, {start: {_id:51}, end: {_id:57}, properties:{}}, {start: {_id:51}, end: {_id:58}, properties:{}}, {start: {_id:51}, end: {_id:59}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:18}, end: {_id:22}, properties:{}}, {start: {_id:19}, end: {_id:23}, properties:{}}, {start: {_id:20}, end: {_id:24}, properties:{}}, {start: {_id:21}, end: {_id:25}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:24}, end: {_id:6}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPPLIED_BY_RISKY]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:76}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRODUCED_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUDITED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:30}, end: {_id:6}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPPLIED_BY_RISKY]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:34}, properties:{}}, {start: {_id:8}, end: {_id:35}, properties:{}}, {start: {_id:8}, end: {_id:37}, properties:{}}, {start: {_id:8}, end: {_id:38}, properties:{}}, {start: {_id:8}, end: {_id:40}, properties:{}}, {start: {_id:8}, end: {_id:41}, properties:{}}, {start: {_id:8}, end: {_id:43}, properties:{}}, {start: {_id:8}, end: {_id:44}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:51}, end: {_id:2}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:10}, end: {_id:12}, properties:{}}, {start: {_id:11}, end: {_id:13}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:56}, end: {_id:2}, properties:{}}, {start: {_id:57}, end: {_id:2}, properties:{}}, {start: {_id:58}, end: {_id:7}, properties:{}}, {start: {_id:59}, end: {_id:7}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:72}, end: {_id:1}, properties:{}}, {start: {_id:73}, end: {_id:1}, properties:{}}, {start: {_id:74}, end: {_id:1}, properties:{}}, {start: {_id:75}, end: {_id:1}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:10}, end: {_id:18}, properties:{}}, {start: {_id:10}, end: {_id:19}, properties:{}}, {start: {_id:11}, end: {_id:20}, properties:{}}, {start: {_id:11}, end: {_id:21}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:10}, end: {_id:72}, properties:{}}, {start: {_id:10}, end: {_id:73}, properties:{}}, {start: {_id:11}, end: {_id:74}, properties:{}}, {start: {_id:11}, end: {_id:75}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:36}, properties:{}}, {start: {_id:8}, end: {_id:39}, properties:{}}, {start: {_id:8}, end: {_id:42}, properties:{}}, {start: {_id:8}, end: {_id:45}, properties:{}}, {start: {_id:8}, end: {_id:48}, properties:{}}, {start: {_id:8}, end: {_id:49}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:52}, end: {_id:2}, properties:{}}, {start: {_id:53}, end: {_id:2}, properties:{}}, {start: {_id:54}, end: {_id:2}, properties:{}}, {start: {_id:55}, end: {_id:2}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:9}, end: {_id:0}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:12}, end: {_id:1}, properties:{}}, {start: {_id:13}, end: {_id:1}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:22}, end: {_id:26}, properties:{}}, {start: {_id:23}, end: {_id:28}, properties:{}}, {start: {_id:24}, end: {_id:30}, properties:{}}, {start: {_id:25}, end: {_id:32}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:14}, end: {_id:4}, properties:{}}, {start: {_id:15}, end: {_id:4}, properties:{}}, {start: {_id:16}, end: {_id:4}, properties:{}}, {start: {_id:17}, end: {_id:4}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:50}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:31}, end: {_id:6}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPPLIED_BY_RISKY]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:10}, properties:{}}, {start: {_id:8}, end: {_id:11}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:22}, end: {_id:3}, properties:{}}, {start: {_id:23}, end: {_id:3}, properties:{}}, {start: {_id:24}, end: {_id:6}, properties:{}}, {start: {_id:25}, end: {_id:3}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:60}, end: {_id:2}, properties:{}}, {start: {_id:61}, end: {_id:2}, properties:{}}, {start: {_id:62}, end: {_id:2}, properties:{}}, {start: {_id:63}, end: {_id:2}, properties:{}}, {start: {_id:64}, end: {_id:7}, properties:{}}, {start: {_id:65}, end: {_id:7}, properties:{}}, {start: {_id:66}, end: {_id:7}, properties:{}}, {start: {_id:67}, end: {_id:7}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:22}, end: {_id:27}, properties:{}}, {start: {_id:23}, end: {_id:29}, properties:{}}, {start: {_id:24}, end: {_id:31}, properties:{}}, {start: {_id:25}, end: {_id:33}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:27}, end: {_id:3}, properties:{}}, {start: {_id:29}, end: {_id:3}, properties:{}}, {start: {_id:31}, end: {_id:6}, properties:{}}, {start: {_id:33}, end: {_id:3}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:46}, end: {_id:5}, properties:{}}, {start: {_id:47}, end: {_id:5}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:68}, end: {_id:2}, properties:{}}, {start: {_id:69}, end: {_id:2}, properties:{}}, {start: {_id:70}, end: {_id:7}, properties:{}}, {start: {_id:71}, end: {_id:7}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:10}, end: {_id:1}, properties:{}}, {start: {_id:11}, end: {_id:1}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:51}, end: {_id:52}, properties:{}}, {start: {_id:51}, end: {_id:53}, properties:{}}, {start: {_id:51}, end: {_id:54}, properties:{}}, {start: {_id:51}, end: {_id:55}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:34}, end: {_id:5}, properties:{}}, {start: {_id:35}, end: {_id:5}, properties:{}}, {start: {_id:37}, end: {_id:5}, properties:{}}, {start: {_id:38}, end: {_id:5}, properties:{}}, {start: {_id:40}, end: {_id:5}, properties:{}}, {start: {_id:41}, end: {_id:5}, properties:{}}, {start: {_id:43}, end: {_id:5}, properties:{}}, {start: {_id:44}, end: {_id:5}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:50}, end: {_id:1}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MADE_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:51}, end: {_id:60}, properties:{}}, {start: {_id:51}, end: {_id:61}, properties:{}}, {start: {_id:51}, end: {_id:62}, properties:{}}, {start: {_id:51}, end: {_id:63}, properties:{}}, {start: {_id:51}, end: {_id:64}, properties:{}}, {start: {_id:51}, end: {_id:65}, properties:{}}, {start: {_id:51}, end: {_id:66}, properties:{}}, {start: {_id:51}, end: {_id:67}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:46}, properties:{}}, {start: {_id:8}, end: {_id:47}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SUBPART]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;
