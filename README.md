# Apex_Equipment-Maintenance-Calibration-Tracker
<img width="1000" height="700" alt="Home 1" src="https://github.com/user-attachments/assets/be81557c-7915-4179-a159-9db57aa6aa16" />

A low-code web application built with **Oracle APEX** for tracking the maintenance
and calibration history of industrial equipment — sensors, valves, flow meters,
pH analyzers, and other instruments used in chemical plants.

The app keeps a strict audit trail of every calibration and every service event,
so you always know:
- **Is this instrument still accurate?** (last calibration, result, certificate)
- **When is it next due?** (next service date, overdue items)
- **Who signed off on it?** (certified technician, active or retired)

- 
## Why This App Exists

In a chemical plant, an out-of-tolerance sensor can mean a lost batch — or worse,
a safety incident. Compliance frameworks (ISO 17025, FDA 21 CFR Part 11, etc.)
require that every instrument be calibrated on schedule, that every event be
signed by a certified technician, and that the full history be reconstruct-able
years later.

This app is a small, self-contained implementation of that requirement using
Oracle APEX on Oracle Cloud Free Tier.


### Dashboard (Home Page)

Two charts give you a snapshot of plant health at a glance:

**1. Calibration Results — Donut Chart**
Shows the proportion of all calibrations that ended in `Pass`, `Fail`, or
`Conditional`. Green means all good, red means attention, orange means review.


<img width="1362" height="826" alt="Home 1" src="https://github.com/user-attachments/assets/28d7bef2-8ce9-4fe0-a15b-f6d44ea4065a" />

**2. Monthly Maintenance Workload — Bar Chart**
Shows how many maintenance events were logged in each of the last 12 months.
Rising bars mean increasing maintenance load; spikes flag incidents.

<img width="1405" height="824" alt="Home2" src="https://github.com/user-attachments/assets/76932ff5-3e54-4429-918c-6a012d20face" />

*(Both charts are driven by plain SQL `GROUP BY` queries — no stored procedures
or scheduled jobs required.)*

### Equipment & Calibration (Master–Detail Page)

<img width="1887" height="872" alt="EC" src="https://github.com/user-attachments/assets/03f80ac0-7157-4458-95dd-a8ed589e13c9" />

- **Master grid:** every asset in the plant (name, model, serial, location,
  status).
- **Detail grid:** every calibration ever performed on the selected asset —
  date, technician (dropdown of active staff), pass/fail, certificate reference,
  tolerance, remarks.

Selecting an asset in the top grid filters the calibration grid below to that
asset automatically, and the FK is pre-filled when you add a new row.

### Equipment & Maintenance (Master–Detail Page)

<img width="1831" height="881" alt="em" src="https://github.com/user-attachments/assets/6b3d52fb-1707-4c68-bb7c-af9f06a01659" />

Same layout as above, but the detail grid logs **physical servicing events** —
routine, preventive, or emergency work. Includes `Next_Due_Date`, which drives
future "upcoming maintenance" reports.

### Technicians (Reference Table)

<img width="1919" height="917" alt="tform" src="https://github.com/user-attachments/assets/cabdc659-db9a-489a-a10c-2aebeb3ec0c1" />


A simple list of every certified technician, with a drawer form for create/edit.
Technicians are never hard-deleted — they're retired by setting `Active_Flag = 'N'`,
so historical calibration records still resolve to a real person.
