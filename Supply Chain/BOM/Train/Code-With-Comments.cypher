// === Initial Setup & Cleanup (Optional: Run if you need a fresh start) ===
// MATCH (n) DETACH DELETE n;

// === 1) Create Factories ===
// Existing ones renamed + new ones
CREATE (:Factory { name: "Alstom", status: "active" })
CREATE (:Factory { name: "Siemens Mobility", status: "active" })
CREATE (:Factory { name: "Knorr-Bremse", status: "active" })
CREATE (:Factory { name: "SKF", status: "active" })
CREATE (:Factory { name: "Voith", status: "active" })
CREATE (:Factory { name: "Wabtec", status: "active" })
CREATE (:Factory { name: "Timken", status: "closed" }) // Example of a non-active one
CREATE (:Factory { name: "Faiveley Transport", status: "active" }) // Part of Wabtec but might retain branding/legacy

// === 2) Create top-level "Bogie" assembly ===
// Using your existing one, maybe specify type
CREATE (bogie:Bogie:Part {
  name: "BogieAssembly_Y25", // Example type
  material: "Welded Steel S355",
  fabricationDate: date("2022-01-10"),
  fabricant: "Alstom", // Primary assembler
  stock: 5,
  installedOn: date("2022-06-01"),
  lastInspection: date("2024-06-01")
})
MATCH (bogie:Bogie {name: "BogieAssembly_Y25"}), (f:Factory {name: "Alstom"})
CREATE (bogie)-[:MADE_BY]->(f);

// === 3) Create Bogie Frame ===
CREATE (frame:BogieFrame:Part {
  name: "BogieFrame_Y25-001",
  material: "S355 Steel Plate",
  fabricationDate: date("2021-11-15"),
  fabricant: "Alstom",
  stock: 5,
  installedOn: date("2022-06-01"),
  lastInspection: date("2024-06-01")
})
MATCH (bogie:Bogie {name: "BogieAssembly_Y25"}), (frame:BogieFrame {name: "BogieFrame_Y25-001"}), (f:Factory {name: "Alstom"})
CREATE (bogie)-[:HAS_SUBPART]->(frame)
CREATE (frame)-[:MADE_BY]->(f);

// === 4) Create Wheelset Assemblies (contains Axle, Wheels, Axleboxes) ===
// Wheelset 1
CREATE (ws1:WheelsetAssembly:Part {
  name: "WheelsetAssembly-1",
  material: "Steel Composite",
  fabricationDate: date("2021-12-01"),
  fabricant: "Siemens Mobility",
  stock: 8,
  installedOn: date("2022-06-01"),
  lastInspection: date("2024-03-01")
})
// Wheelset 2
CREATE (ws2:WheelsetAssembly:Part {
  name: "WheelsetAssembly-2",
  material: "Steel Composite",
  fabricationDate: date("2021-12-05"),
  fabricant: "Siemens Mobility",
  stock: 8,
  installedOn: date("2022-06-01"),
  lastInspection: date("2024-03-01")
})

MATCH (bogie:Bogie {name: "BogieAssembly_Y25"}), (ws1:WheelsetAssembly {name: "WheelsetAssembly-1"}), (ws2:WheelsetAssembly {name: "WheelsetAssembly-2"}), (f:Factory {name: "Siemens Mobility"})
CREATE (bogie)-[:HAS_SUBPART]->(ws1)
CREATE (bogie)-[:HAS_SUBPART]->(ws2)
CREATE (ws1)-[:MADE_BY]->(f)
CREATE (ws2)-[:MADE_BY]->(f);

// === 5) Create Axles for Wheelsets ===
CREATE (ax1:Axle:Part {
  name: "Axle-1",
  material: "Forged Steel EA1N",
  fabricationDate: date("2021-10-01"),
  fabricant: "Siemens Mobility",
  stock: 15,
  installedOn: date("2021-12-01"), // Installed on Wheelset Assy
  lastInspection: date("2024-03-01")
})
CREATE (ax2:Axle:Part {
  name: "Axle-2",
  material: "Forged Steel EA1N",
  fabricationDate: date("2021-10-05"),
  fabricant: "Siemens Mobility",
  stock: 15,
  installedOn: date("2021-12-05"), // Installed on Wheelset Assy
  lastInspection: date("2024-03-01")
})

MATCH (ws1:WheelsetAssembly {name: "WheelsetAssembly-1"}), (ax1:Axle {name: "Axle-1"}), (f:Factory {name: "Siemens Mobility"})
CREATE (ws1)-[:HAS_SUBPART]->(ax1)
CREATE (ax1)-[:MADE_BY]->(f);
MATCH (ws2:WheelsetAssembly {name: "WheelsetAssembly-2"}), (ax2:Axle {name: "Axle-2"}), (f:Factory {name: "Siemens Mobility"})
CREATE (ws2)-[:HAS_SUBPART]->(ax2)
CREATE (ax2)-[:MADE_BY]->(f);

// === 6) Create Wheels for Wheelsets ===
// Wheels for Axle 1
CREATE (w1L:Wheel:Part { name: "Wheel-1L", material: "Rolled Steel R7", fabricationDate: date("2021-09-10"), fabricant: "Voith", stock: 30, installedOn: date("2021-12-01"), lastInspection: date("2024-03-01") })
CREATE (w1R:Wheel:Part { name: "Wheel-1R", material: "Rolled Steel R7", fabricationDate: date("2021-09-11"), fabricant: "Voith", stock: 30, installedOn: date("2021-12-01"), lastInspection: date("2024-03-01") })
// Wheels for Axle 2
CREATE (w2L:Wheel:Part { name: "Wheel-2L", material: "Rolled Steel R7", fabricationDate: date("2021-09-15"), fabricant: "Voith", stock: 30, installedOn: date("2021-12-05"), lastInspection: date("2024-03-01") })
CREATE (w2R:Wheel:Part { name: "Wheel-2R", material: "Rolled Steel R7", fabricationDate: date("2021-09-16"), fabricant: "Voith", stock: 30, installedOn: date("2021-12-05"), lastInspection: date("2024-03-01") })

MATCH (ws1:WheelsetAssembly {name: "WheelsetAssembly-1"}), (w1L:Wheel {name: "Wheel-1L"}), (w1R:Wheel {name: "Wheel-1R"}), (f:Factory {name: "Voith"})
CREATE (ws1)-[:HAS_SUBPART]->(w1L)
CREATE (ws1)-[:HAS_SUBPART]->(w1R)
CREATE (w1L)-[:MADE_BY]->(f)
CREATE (w1R)-[:MADE_BY]->(f);
MATCH (ws2:WheelsetAssembly {name: "WheelsetAssembly-2"}), (w2L:Wheel {name: "Wheel-2L"}), (w2R:Wheel {name: "Wheel-2R"}), (f:Factory {name: "Voith"})
CREATE (ws2)-[:HAS_SUBPART]->(w2L)
CREATE (ws2)-[:HAS_SUBPART]->(w2R)
CREATE (w2L)-[:MADE_BY]->(f)
CREATE (w2R)-[:MADE_BY]->(f);

// === 7) Create Axleboxes and Bearings ===
// Axleboxes for Wheelset 1
CREATE (ab1L:Axlebox:Part { name: "Axlebox-1L", material: "Cast Steel", fabricationDate: date("2021-10-20"), fabricant: "SKF", stock: 25, installedOn: date("2021-12-01"), lastInspection: date("2024-03-01") })
CREATE (ab1R:Axlebox:Part { name: "Axlebox-1R", material: "Cast Steel", fabricationDate: date("2021-10-21"), fabricant: "SKF", stock: 25, installedOn: date("2021-12-01"), lastInspection: date("2024-03-01") })
// Axleboxes for Wheelset 2
CREATE (ab2L:Axlebox:Part { name: "Axlebox-2L", material: "Cast Steel", fabricationDate: date("2021-10-25"), fabricant: "Timken", stock: 0, installedOn: date("2021-12-05"), lastInspection: date("2023-11-01") }) // Using Timken (closed factory)
CREATE (ab2R:Axlebox:Part { name: "Axlebox-2R", material: "Cast Steel", fabricationDate: date("2021-10-26"), fabricant: "SKF", stock: 25, installedOn: date("2021-12-05"), lastInspection: date("2024-03-01") })

// Bearings (subpart of Axlebox)
CREATE (b1L:BearingAssembly:Part { name: "BearingAssembly-1L", material: "Bearing Steel", fabricationDate: date("2021-10-15"), fabricant: "SKF", stock: 50, installedOn: date("2021-10-20"), lastInspection: date("2024-03-01") })
CREATE (b1R:BearingAssembly:Part { name: "BearingAssembly-1R", material: "Bearing Steel", fabricationDate: date("2021-10-16"), fabricant: "SKF", stock: 50, installedOn: date("2021-10-21"), lastInspection: date("2024-03-01") })
CREATE (b2L:BearingAssembly:Part { name: "BearingAssembly-2L", material: "Bearing Steel", fabricationDate: date("2021-10-18"), fabricant: "Timken", stock: 0, installedOn: date("2021-10-25"), lastInspection: date("2023-11-01") })
CREATE (b2R:BearingAssembly:Part { name: "BearingAssembly-2R", material: "Bearing Steel", fabricationDate: date("2021-10-19"), fabricant: "SKF", stock: 50, installedOn: date("2021-10-26"), lastInspection: date("2024-03-01") })

// Bearing Components (subparts of Bearing Assembly)
CREATE (rb1L:RollerBearing:Part { name: "RollerBearing-1L", material:"Chrome Steel", fabricationDate: date("2021-10-10"), fabricant: "SKF", stock:100 })
CREATE (bh1L:BearingHousing:Part { name: "BearingHousing-1L", material:"Cast Iron", fabricationDate: date("2021-10-12"), fabricant: "SKF", stock:50 })
// ... (Repeat for 1R, 2L, 2R - adding 6 more Part nodes)
CREATE (rb1R:RollerBearing:Part { name: "RollerBearing-1R", material:"Chrome Steel", fabricationDate: date("2021-10-10"), fabricant: "SKF", stock:100 })
CREATE (bh1R:BearingHousing:Part { name: "BearingHousing-1R", material:"Cast Iron", fabricationDate: date("2021-10-12"), fabricant: "SKF", stock:50 })
CREATE (rb2L:RollerBearing:Part { name: "RollerBearing-2L", material:"Chrome Steel", fabricationDate: date("2021-10-11"), fabricant: "Timken", stock:0 })
CREATE (bh2L:BearingHousing:Part { name: "BearingHousing-2L", material:"Cast Iron", fabricationDate: date("2021-10-13"), fabricant: "Timken", stock:0 })
CREATE (rb2R:RollerBearing:Part { name: "RollerBearing-2R", material:"Chrome Steel", fabricationDate: date("2021-10-11"), fabricant: "SKF", stock:100 })
CREATE (bh2R:BearingHousing:Part { name: "BearingHousing-2R", material:"Cast Iron", fabricationDate: date("2021-10-14"), fabricant: "SKF", stock:50 })


// Link Axleboxes to Wheelsets and Factories
MATCH (ws1:WheelsetAssembly {name: "WheelsetAssembly-1"}), (ab1L:Axlebox {name: "Axlebox-1L"}), (ab1R:Axlebox {name: "Axlebox-1R"}), (fSKF:Factory {name: "SKF"})
CREATE (ws1)-[:HAS_SUBPART]->(ab1L)
CREATE (ws1)-[:HAS_SUBPART]->(ab1R)
CREATE (ab1L)-[:MADE_BY]->(fSKF)
CREATE (ab1R)-[:MADE_BY]->(fSKF);

MATCH (ws2:WheelsetAssembly {name: "WheelsetAssembly-2"}), (ab2L:Axlebox {name: "Axlebox-2L"}), (fTimken:Factory {name: "Timken"})
CREATE (ws2)-[:HAS_SUBPART]->(ab2L)
CREATE (ab2L)-[:MADE_BY]->(fTimken); // Made by Timken
MATCH (ws2:WheelsetAssembly {name: "WheelsetAssembly-2"}), (ab2R:Axlebox {name: "Axlebox-2R"}), (fSKF:Factory {name: "SKF"})
CREATE (ws2)-[:HAS_SUBPART]->(ab2R)
CREATE (ab2R)-[:MADE_BY]->(fSKF); // Made by SKF


// Link Bearings to Axleboxes and Factories
MATCH (ab1L:Axlebox {name: "Axlebox-1L"}), (b1L:BearingAssembly {name: "BearingAssembly-1L"}), (fSKF:Factory {name: "SKF"}) CREATE (ab1L)-[:HAS_SUBPART]->(b1L) CREATE (b1L)-[:MADE_BY]->(fSKF);
MATCH (ab1R:Axlebox {name: "Axlebox-1R"}), (b1R:BearingAssembly {name: "BearingAssembly-1R"}), (fSKF:Factory {name: "SKF"}) CREATE (ab1R)-[:HAS_SUBPART]->(b1R) CREATE (b1R)-[:MADE_BY]->(fSKF);
MATCH (ab2L:Axlebox {name: "Axlebox-2L"}), (b2L:BearingAssembly {name: "BearingAssembly-2L"}), (fTimken:Factory {name: "Timken"}) CREATE (ab2L)-[:HAS_SUBPART]->(b2L) CREATE (b2L)-[:MADE_BY]->(fTimken);
MATCH (ab2R:Axlebox {name: "Axlebox-2R"}), (b2R:BearingAssembly {name: "BearingAssembly-2R"}), (fSKF:Factory {name: "SKF"}) CREATE (ab2R)-[:HAS_SUBPART]->(b2R) CREATE (b2R)-[:MADE_BY]->(fSKF);

// Link Bearing Components to Bearing Assemblies and Factories
MATCH (b1L:BearingAssembly {name: "BearingAssembly-1L"}), (rb1L:RollerBearing {name:"RollerBearing-1L"}), (bh1L:BearingHousing {name:"BearingHousing-1L"}), (fSKF:Factory {name: "SKF"})
CREATE (b1L)-[:HAS_SUBPART]->(rb1L), (b1L)-[:HAS_SUBPART]->(bh1L)
CREATE (rb1L)-[:MADE_BY]->(fSKF), (bh1L)-[:MADE_BY]->(fSKF);
MATCH (b1R:BearingAssembly {name: "BearingAssembly-1R"}), (rb1R:RollerBearing {name:"RollerBearing-1R"}), (bh1R:BearingHousing {name:"BearingHousing-1R"}), (fSKF:Factory {name: "SKF"})
CREATE (b1R)-[:HAS_SUBPART]->(rb1R), (b1R)-[:HAS_SUBPART]->(bh1R)
CREATE (rb1R)-[:MADE_BY]->(fSKF), (bh1R)-[:MADE_BY]->(fSKF);
MATCH (b2L:BearingAssembly {name: "BearingAssembly-2L"}), (rb2L:RollerBearing {name:"RollerBearing-2L"}), (bh2L:BearingHousing {name:"BearingHousing-2L"}), (fTimken:Factory {name: "Timken"})
CREATE (b2L)-[:HAS_SUBPART]->(rb2L), (b2L)-[:HAS_SUBPART]->(bh2L)
CREATE (rb2L)-[:MADE_BY]->(fTimken), (bh2L)-[:MADE_BY]->(fTimken);
MATCH (b2R:BearingAssembly {name: "BearingAssembly-2R"}), (rb2R:RollerBearing {name:"RollerBearing-2R"}), (bh2R:BearingHousing {name:"BearingHousing-2R"}), (fSKF:Factory {name: "SKF"})
CREATE (b2R)-[:HAS_SUBPART]->(rb2R), (b2R)-[:HAS_SUBPART]->(bh2R)
CREATE (rb2R)-[:MADE_BY]->(fSKF), (bh2R)-[:MADE_BY]->(fSKF);


// === 8) Create Primary Suspension Components (linking Axlebox area to Bogie Frame) ===
// Assume 2 springs + 1 damper per axlebox side = 8 springs, 4 dampers total
// Primary Suspension Components for Wheelset 1
CREATE (ps1L_s1:CoilSpring:Part { name: "PriSpring-1L-1", material:"Spring Steel", fabricationDate: date("2021-11-01"), fabricant: "Wabtec", stock:40 })
CREATE (ps1L_s2:CoilSpring:Part { name: "PriSpring-1L-2", material:"Spring Steel", fabricationDate: date("2021-11-01"), fabricant: "Wabtec", stock:40 })
CREATE (ps1L_d:Damper:Part { name: "PriDamper-1L", material:"Hydraulic", fabricationDate: date("2021-11-05"), fabricant: "Voith", stock:20 })
CREATE (ps1R_s1:CoilSpring:Part { name: "PriSpring-1R-1", material:"Spring Steel", fabricationDate: date("2021-11-02"), fabricant: "Wabtec", stock:40 })
CREATE (ps1R_s2:CoilSpring:Part { name: "PriSpring-1R-2", material:"Spring Steel", fabricationDate: date("2021-11-02"), fabricant: "Wabtec", stock:40 })
CREATE (ps1R_d:Damper:Part { name: "PriDamper-1R", material:"Hydraulic", fabricationDate: date("2021-11-06"), fabricant: "Voith", stock:20 })
// Primary Suspension Components for Wheelset 2
CREATE (ps2L_s1:CoilSpring:Part { name: "PriSpring-2L-1", material:"Spring Steel", fabricationDate: date("2021-11-03"), fabricant: "Wabtec", stock:40 })
CREATE (ps2L_s2:CoilSpring:Part { name: "PriSpring-2L-2", material:"Spring Steel", fabricationDate: date("2021-11-03"), fabricant: "Wabtec", stock:40 })
CREATE (ps2L_d:Damper:Part { name: "PriDamper-2L", material:"Hydraulic", fabricationDate: date("2021-11-07"), fabricant: "Voith", stock:20 })
CREATE (ps2R_s1:CoilSpring:Part { name: "PriSpring-2R-1", material:"Spring Steel", fabricationDate: date("2021-11-04"), fabricant: "Wabtec", stock:40 })
CREATE (ps2R_s2:CoilSpring:Part { name: "PriSpring-2R-2", material:"Spring Steel", fabricationDate: date("2021-11-04"), fabricant: "Wabtec", stock:40 })
CREATE (ps2R_d:Damper:Part { name: "PriDamper-2R", material:"Hydraulic", fabricationDate: date("2021-11-08"), fabricant: "Voith", stock:20 })

// Link Primary Suspension to Bogie (as logical group, or directly if preferred) and Factories
// Linking directly to Bogie for simplicity here, could add :PrimarySuspensionAssembly nodes
MATCH (bogie:Bogie {name: "BogieAssembly_Y25"}), (p:Part), (fW:Factory {name:"Wabtec"}), (fV:Factory {name:"Voith"})
WHERE p.name STARTS WITH "PriSpring" OR p.name STARTS WITH "PriDamper"
CREATE (bogie)-[:HAS_SUBPART]->(p)
WITH p, fW, fV
CALL apoc.do.when(p.name STARTS WITH "PriSpring",
  'MATCH (p {name: $pName}), (f {name: $fName}) CREATE (p)-[:MADE_BY]->(f)',
  'MATCH (p {name: $pName}), (f {name: $fName}) CREATE (p)-[:MADE_BY]->(f)',
  {pName: p.name, fName: CASE WHEN p.name STARTS WITH "PriSpring" THEN fW.name ELSE fV.name END})
YIELD value
RETURN count(*); // Added 12 Part nodes

// === 9) Create Secondary Suspension Components (linking Bogie Frame to Car Body - simplified) ===
// Often includes Air Springs, Dampers, Anti-roll bar, Bolster (if applicable)
CREATE (secAirSpringL:AirSpring:Part { name: "SecAirSpring-L", material:"Rubber/Metal", fabricationDate: date("2021-11-10"), fabricant: "Wabtec", stock:15 })
CREATE (secAirSpringR:AirSpring:Part { name: "SecAirSpring-R", material:"Rubber/Metal", fabricationDate: date("2021-11-11"), fabricant: "Wabtec", stock:15 })
CREATE (secDamperL:Damper:Part { name: "SecDamper-L", material:"Hydraulic", fabricationDate: date("2021-11-15"), fabricant: "Knorr-Bremse", stock:15 }) // Different damper supplier
CREATE (secDamperR:Damper:Part { name: "SecDamper-R", material:"Hydraulic", fabricationDate: date("2021-11-16"), fabricant: "Knorr-Bremse", stock:15 })
CREATE (antiRollBar:AntiRollBar:Part { name: "AntiRollBar-1", material:"Spring Steel Bar", fabricationDate: date("2021-11-20"), fabricant: "Siemens Mobility", stock:10 })
// Link Secondary Suspension to Bogie and Factories
MATCH (bogie:Bogie {name: "BogieAssembly_Y25"}), (p:Part), (fW:Factory {name:"Wabtec"}), (fK:Factory {name:"Knorr-Bremse"}), (fS:Factory {name:"Siemens Mobility"})
WHERE p.name STARTS WITH "SecAirSpring" OR p.name STARTS WITH "SecDamper" OR p.name STARTS WITH "AntiRollBar"
CREATE (bogie)-[:HAS_SUBPART]->(p)
WITH p, fW, fK, fS
CALL apoc.do.when(p.name STARTS WITH "SecAirSpring", 'MATCH (p {name:$pName}), (f {name:$fName}) CREATE (p)-[:MADE_BY]->(f)', '', {pName:p.name, fName:fW.name}) YIELD value AS v1
CALL apoc.do.when(p.name STARTS WITH "SecDamper", 'MATCH (p {name:$pName}), (f {name:$fName}) CREATE (p)-[:MADE_BY]->(f)', '', {pName:p.name, fName:fK.name}) YIELD value AS v2
CALL apoc.do.when(p.name STARTS WITH "AntiRollBar", 'MATCH (p {name:$pName}), (f {name:$fName}) CREATE (p)-[:MADE_BY]->(f)', '', {pName:p.name, fName:fS.name}) YIELD value AS v3
RETURN count(*); // Added 5 Part nodes


// === 10) Create Braking System Components ===
// Assume disc brakes: 1 disc per wheel, 1 caliper per wheel = 4 discs, 4 calipers
// Plus actuators, pads etc.
CREATE (brakeSys:BrakeSystem:Part { name: "BrakeSystemAssembly", material:"Various", fabricationDate: date("2021-12-10"), fabricant: "Knorr-Bremse", stock: 5 })
MATCH (bogie:Bogie {name: "BogieAssembly_Y25"}), (brakeSys:BrakeSystem), (f:Factory {name:"Knorr-Bremse"})
CREATE (bogie)-[:HAS_SUBPART]->(brakeSys)
CREATE (brakeSys)-[:MADE_BY]->(f);

// Brake Discs (mounted on axle or wheel, let's say wheel here)
CREATE (bd1L:BrakeDisc:Part { name: "BrakeDisc-1L", material:"Cast Iron", fabricationDate: date("2021-11-25"), fabricant: "Knorr-Bremse", stock:20 })
CREATE (bd1R:BrakeDisc:Part { name: "BrakeDisc-1R", material:"Cast Iron", fabricationDate: date("2021-11-25"), fabricant: "Knorr-Bremse", stock:20 })
CREATE (bd2L:BrakeDisc:Part { name: "BrakeDisc-2L", material:"Cast Iron", fabricationDate: date("2021-11-26"), fabricant: "Knorr-Bremse", stock:20 })
CREATE (bd2R:BrakeDisc:Part { name: "BrakeDisc-2R", material:"Cast Iron", fabricationDate: date("2021-11-26"), fabricant: "Knorr-Bremse", stock:20 })

// Brake Calipers
CREATE (bc1L:BrakeCaliper:Part { name: "BrakeCaliper-1L", material:"Aluminium Alloy", fabricationDate: date("2021-11-28"), fabricant: "Knorr-Bremse", stock:15 })
CREATE (bc1R:BrakeCaliper:Part { name: "BrakeCaliper-1R", material:"Aluminium Alloy", fabricationDate: date("2021-11-28"), fabricant: "Knorr-Bremse", stock:15 })
CREATE (bc2L:BrakeCaliper:Part { name: "BrakeCaliper-2L", material:"Aluminium Alloy", fabricationDate: date("2021-11-29"), fabricant: "Faiveley Transport", stock:10 }) // Different supplier
CREATE (bc2R:BrakeCaliper:Part { name: "BrakeCaliper-2R", material:"Aluminium Alloy", fabricationDate: date("2021-11-29"), fabricant: "Faiveley Transport", stock:10 })

// Brake Pads (assuming 2 pads per caliper)
CREATE (bp1L_i:BrakePad:Part { name: "BrakePad-1L-Inner", material:"Organic", fabricationDate: date("2021-12-01"), fabricant: "Knorr-Bremse", stock:50 })
CREATE (bp1L_o:BrakePad:Part { name: "BrakePad-1L-Outer", material:"Organic", fabricationDate: date("2021-12-01"), fabricant: "Knorr-Bremse", stock:50 })
// ... (Repeat for 1R, 2L, 2R - adding 6 more Part nodes)
CREATE (bp1R_i:BrakePad:Part { name: "BrakePad-1R-Inner", material:"Organic", fabricationDate: date("2021-12-02"), fabricant: "Knorr-Bremse", stock:50 })
CREATE (bp1R_o:BrakePad:Part { name: "BrakePad-1R-Outer", material:"Organic", fabricationDate: date("2021-12-02"), fabricant: "Knorr-Bremse", stock:50 })
CREATE (bp2L_i:BrakePad:Part { name: "BrakePad-2L-Inner", material:"Sintered", fabricationDate: date("2021-12-03"), fabricant: "Faiveley Transport", stock:40 })
CREATE (bp2L_o:BrakePad:Part { name: "BrakePad-2L-Outer", material:"Sintered", fabricationDate: date("2021-12-03"), fabricant: "Faiveley Transport", stock:40 })
CREATE (bp2R_i:BrakePad:Part { name: "BrakePad-2R-Inner", material:"Sintered", fabricationDate: date("2021-12-04"), fabricant: "Faiveley Transport", stock:40 })
CREATE (bp2R_o:BrakePad:Part { name: "BrakePad-2R-Outer", material:"Sintered", fabricationDate: date("2021-12-04"), fabricant: "Faiveley Transport", stock:40 })


// Link Brake Components to Brake System and Factories
MATCH (brakeSys:BrakeSystem {name: "BrakeSystemAssembly"}), (p:Part), (fK:Factory {name:"Knorr-Bremse"}), (fF:Factory {name:"Faiveley Transport"})
WHERE p.name STARTS WITH "BrakeDisc" OR p.name STARTS WITH "BrakeCaliper" OR p.name STARTS WITH "BrakePad"
CREATE (brakeSys)-[:HAS_SUBPART]->(p)
WITH p, fK, fF
CALL apoc.do.when(p.fabricant = "Knorr-Bremse", 'MATCH (p {name:$pName}), (f {name:$fName}) CREATE (p)-[:MADE_BY]->(f)', '', {pName:p.name, fName:fK.name}) YIELD value AS vK
CALL apoc.do.when(p.fabricant = "Faiveley Transport", 'MATCH (p {name:$pName}), (f {name:$fName}) CREATE (p)-[:MADE_BY]->(f)', '', {pName:p.name, fName:fF.name}) YIELD value AS vF
RETURN count(*); // Added 1 + 4 + 4 + 8 = 17 Part nodes


// === 11) Add Functional Dependencies (Example) ===
// Wheels depend on Axle
MATCH (ax:Axle), (w:Wheel) WHERE (ax.name = "Axle-1" AND (w.name = "Wheel-1L" OR w.name = "Wheel-1R")) OR (ax.name = "Axle-2" AND (w.name = "Wheel-2L" OR w.name = "Wheel-2R"))
CREATE (w)-[:DEPENDS_ON]->(ax);

// Axlebox depends on Bearing Assembly
MATCH (ab:Axlebox), (b:BearingAssembly) WHERE left(ab.name, 9) = left(b.name, 9) // Match Axlebox-1L with BearingAssembly-1L etc.
CREATE (ab)-[:DEPENDS_ON]->(b);

// Bearing Assembly depends on Roller Bearing
MATCH (b:BearingAssembly), (rb:RollerBearing) WHERE left(b.name, 18) = left(rb.name, 18) // Match BearingAssembly-1L with RollerBearing-1L etc.
CREATE (b)-[:DEPENDS_ON]->(rb);

// Brake Caliper depends on Brake Pads (to function)
MATCH (bc:BrakeCaliper), (bp:BrakePad) WHERE left(bc.name, 14) = left(bp.name, 14) // Match BrakeCaliper-1L with BrakePad-1L-* etc.
CREATE (bc)-[:DEPENDS_ON]->(bp);

// Brake Pads affect Brake Disc
MATCH (bp:BrakePad), (bd:BrakeDisc) WHERE left(bp.name, 10) = left(bd.name, 10) // Match BrakePad-1L-* with BrakeDisc-1L etc.
CREATE (bp)-[:AFFECTS]->(bd);

// Primary Dampers affect Primary Springs
MATCH (d:Damper), (s:CoilSpring) WHERE d.name STARTS WITH "PriDamper" AND s.name STARTS WITH "PriSpring" AND left(d.name,11) = left(s.name,11) // Match PriDamper-1L with PriSpring-1L-*
CREATE (d)-[:AFFECTS]->(s);

// Wheel affects Rail (Implicit external dependency - not modelled here typically)
// Bogie Frame depends on Welds (Could model welds as nodes if needed)


// === Node Count Check ===
// Factories: 8
// Bogie: 1
// Frame: 1
// Wheelset Assemblies: 2
// Axles: 2
// Wheels: 4
// Axleboxes: 4
// Bearing Assemblies: 4
// Roller Bearings: 4
// Bearing Housings: 4
// Primary Springs: 8
// Primary Dampers: 4
// Secondary Air Springs: 2
// Secondary Dampers: 2
// AntiRollBar: 1
// Brake System: 1
// Brake Discs: 4
// Brake Calipers: 4
// Brake Pads: 8
// TOTAL: 8+1+1+2+2+4+4+4+4+4+8+4+2+2+1+1+4+4+8 = 78 Part Nodes + 8 Factory Nodes = 86 Nodes.

// To reach ~100, we can add more brake components (actuators, sensors), suspension linkages, or traction motor components if it's a powered bogie.

// === 12) Add More Components (Example: Brake Actuators & Sensors) ===
// Brake Actuators (Assume 1 per caliper)
CREATE (ba1L:BrakeActuator:Part { name: "BrakeActuator-1L", material:"Pneumatic Cylinder", fabricationDate: date("2021-11-27"), fabricant: "Knorr-Bremse", stock:15 })
CREATE (ba1R:BrakeActuator:Part { name: "BrakeActuator-1R", material:"Pneumatic Cylinder", fabricationDate: date("2021-11-27"), fabricant: "Knorr-Bremse", stock:15 })
CREATE (ba2L:BrakeActuator:Part { name: "BrakeActuator-2L", material:"Pneumatic Cylinder", fabricationDate: date("2021-11-28"), fabricant: "Faiveley Transport", stock:10 })
CREATE (ba2R:BrakeActuator:Part { name: "BrakeActuator-2R", material:"Pneumatic Cylinder", fabricationDate: date("2021-11-28"), fabricant: "Faiveley Transport", stock:10 })

// Axle Speed Sensors (Assume 1 per axle end = 4 total)
CREATE (ss1L:SpeedSensor:Part { name: "SpeedSensor-1L", material:"Electronic", fabricationDate: date("2021-11-15"), fabricant: "Siemens Mobility", stock:20 })
CREATE (ss1R:SpeedSensor:Part { name: "SpeedSensor-1R", material:"Electronic", fabricationDate: date("2021-11-15"), fabricant: "Siemens Mobility", stock:20 })
CREATE (ss2L:SpeedSensor:Part { name: "SpeedSensor-2L", material:"Electronic", fabricationDate: date("2021-11-16"), fabricant: "Siemens Mobility", stock:20 })
CREATE (ss2R:SpeedSensor:Part { name: "SpeedSensor-2R", material:"Electronic", fabricationDate: date("2021-11-16"), fabricant: "Siemens Mobility", stock:20 })

// Link Brake Actuators to Brake System and Factories
MATCH (brakeSys:BrakeSystem {name: "BrakeSystemAssembly"}), (p:Part), (fK:Factory {name:"Knorr-Bremse"}), (fF:Factory {name:"Faiveley Transport"})
WHERE p.name STARTS WITH "BrakeActuator"
CREATE (brakeSys)-[:HAS_SUBPART]->(p)
WITH p, fK, fF
CALL apoc.do.when(p.fabricant = "Knorr-Bremse", 'MATCH (p {name:$pName}), (f {name:$fName}) CREATE (p)-[:MADE_BY]->(f)', '', {pName:p.name, fName:fK.name}) YIELD value AS vK
CALL apoc.do.when(p.fabricant = "Faiveley Transport", 'MATCH (p {name:$pName}), (f {name:$fName}) CREATE (p)-[:MADE_BY]->(f)', '', {pName:p.name, fName:fF.name}) YIELD value AS vF
RETURN count(*); // Added 4 Part nodes

// Link Speed Sensors to Wheelset Assemblies (as they measure axle speed) and Factory
MATCH (ws:WheelsetAssembly), (ss:SpeedSensor), (fS:Factory {name:"Siemens Mobility"})
WHERE (ws.name = "WheelsetAssembly-1" AND (ss.name = "SpeedSensor-1L" OR ss.name = "SpeedSensor-1R")) OR (ws.name = "WheelsetAssembly-2" AND (ss.name = "SpeedSensor-2L" OR ss.name = "SpeedSensor-2R"))
CREATE (ws)-[:HAS_SUBPART]->(ss) // Sensor is part of the assembly
CREATE (ss)-[:MADE_BY]->(fS); // Added 4 Part nodes

// Add functional dependency: Caliper depends on Actuator
MATCH (bc:BrakeCaliper), (ba:BrakeActuator) WHERE left(bc.name, 14) = left(ba.name, 16) // Match BrakeCaliper-1L with BrakeActuator-1L etc.
CREATE (bc)-[:DEPENDS_ON]->(ba);

// Add functional dependency: Speed Sensor affects Brake System (for ABS/WSP)
MATCH (ss:SpeedSensor), (brakeSys:BrakeSystem {name: "BrakeSystemAssembly"})
CREATE (ss)-[:AFFECTS]->(brakeSys);

// === Final Node Count Check ===
// Previous Parts: 78
// Brake Actuators: 4
// Speed Sensors: 4
// TOTAL Parts: 78 + 4 + 4 = 86 Part Nodes
// Factories: 8
// GRAND TOTAL: 86 + 8 = 94 Nodes.

// This is very close to 100. Adding a few more small components like fasteners, lubrication points, or specific sub-components for dampers/springs would easily push it over the edge.
