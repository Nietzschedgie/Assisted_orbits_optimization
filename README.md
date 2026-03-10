# 🚀 Solar System Spacecraft Trajectory Simulator

> A MATLAB-based N-body gravitational simulation that computes an optimal spacecraft trajectory from **Earth to Pluto** with a **Jupiter gravitational assist**, modeling all 9 planets of the solar system.

---

## 🌌 Overview

This project numerically integrates the equations of motion for a spacecraft traveling through the solar system, accounting for the gravitational influence of the Sun and all major planets. The simulation uses a **backward-integration + energy minimization** approach to find the lowest-energy trajectory, and visualizes the result as an animated 3D flight path.

The mission profile is:
```
Earth → [Jupiter Gravity Assist] → Pluto
```

---

## ✨ Features

- **Full N-body simulation** — gravitational forces from the Sun, all 8 planets, and Pluto acting on the spacecraft at every timestep
- **Gravity assist optimization** — automatically searches for the minimum kinetic energy trajectory through Jupiter
- **Two-segment patched trajectory** — backward integration from Pluto to Jupiter, then forward integration from Earth to the junction point
- **3D animated visualization** — real-time animation of all planetary orbits and the spacecraft's flight path
- **Configurable time resolution** — user-defined timestep for speed vs. accuracy tradeoff

---

## 🔧 Requirements

- **MATLAB** (R2018b or later recommended)
- No additional toolboxes required

---

## 📁 Project Structure

```
├── main.m              # Main simulation script (this file)
└── calculaorbitas.m    # Helper function — integrates a single planet's orbit
```

The `calculaorbitas` function must be present in the same directory. It computes position, velocity, and acceleration arrays for a body given initial conditions, total steps, and timestep.

---

## 🚀 How to Run

1. Clone or download this repository
2. Open MATLAB and navigate to the project folder
3. Run the main script:
   ```matlab
   main
   ```
4. When prompted, enter a timestep value:
   ```
   Detalle: 5000
   ```
   > Recommended range: **1000 – 10000 seconds**  
   > Lower values → higher accuracy, longer runtime  
   > Higher values → faster simulation, less precision

5. The simulation will compute orbital paths, optimize the spacecraft trajectory, then display an animated 3D visualization.
6. Press `Enter` when prompted to start the animation.

---

## ⚙️ How It Works

### 1. Planetary Orbit Integration
All 9 planets are propagated forward in time using a **Verlet integration scheme**, with gravitational acceleration from the Sun only (point-mass approximation).

### 2. Backward Integration — Pluto to Jupiter
Starting at Pluto's final position, the spacecraft trajectory is integrated **backwards in time** with the full N-body gravitational field. A coarse velocity search (`vmin` to `vmax` in steps of `dv`) identifies which initial velocity minimizes the kinetic energy at the Jupiter flyby point.

### 3. Forward Integration — Earth to Jupiter Junction
A second integration propagates the spacecraft **forward in time** from Earth, searching for the minimum-energy launch velocity that reaches the handoff point near Jupiter.

### 4. Trajectory Stitching
Both segments are combined into a single `r_nave_dibujo` array for visualization, bridging the backward and forward arcs at the Jupiter encounter.

### 5. 3D Animated Visualization
All planetary orbits are plotted as static curves. Colored markers animate along their orbits simultaneously with the spacecraft marker, rendered in real time using `drawnow`.

---

## 🪐 Physical Parameters

| Body     | Mass (kg)     | Initial Distance from Sun (m) |
|----------|--------------|-------------------------------|
| Sun      | 2.0 × 10³⁰   | — (origin)                    |
| Mercury  | 3.59 × 10²³  | 5.789 × 10¹⁰                 |
| Venus    | 4.90 × 10²⁴  | 1.082 × 10¹¹                 |
| Earth    | 5.98 × 10²⁴  | 1.497 × 10¹¹                 |
| Mars     | 6.42 × 10²³  | 2.279 × 10¹¹                 |
| Jupiter  | 1.90 × 10²⁷  | 7.784 × 10¹¹                 |
| Saturn   | 5.68 × 10²⁶  | 1.427 × 10¹²                 |
| Uranus   | 8.68 × 10²⁵  | 2.871 × 10¹²                 |
| Neptune  | 1.02 × 10²⁶  | 4.498 × 10¹²                 |
| Pluto    | 1.31 × 10²²  | 5.913 × 10¹²                 |

- **G** = 6.672 × 10⁻¹¹ N·m²/kg²  
- **Spacecraft mass** = 2000 kg  
- **Total simulation time** ≈ 62.6 years (1.976 × 10⁹ s)

---

## 📊 Output

After the computation completes, the console displays:
- Total elapsed computation time (via `tic/toc`)
- Kinetic energy at Jupiter flyby (`Ec_salida_jupiter`)
- Kinetic energy at Earth departure (`Ec_salida_tierra2`)

The 3D plot shows:
- ☀️ Yellow dot — the Sun at the origin
- 🔵 Blue line — Earth's orbit
- Colored lines — orbits of all other planets
- ⚫ Black line — spacecraft trajectory (Earth → Jupiter → Pluto)

---

## ⚠️ Known Limitations

- Planetary orbits use **Sun-only gravity** (no planet–planet interactions); the spacecraft does experience all bodies
- Initial conditions assume **circular, coplanar orbits** — real ephemeris data is not used
- The velocity search uses a **coarse grid** (`dv = 10–100 m/s` steps); a finer search may yield more optimal trajectories

---

## 🛠️ Possible Improvements

- [ ] Replace Verlet integrator with **RK4** for better energy conservation
- [ ] Use **real ephemeris data** (e.g., via NASA SPICE or JPL Horizons) for accurate initial conditions
- [ ] Implement a **finer bisection search** or gradient descent for velocity optimization
- [ ] Add **delta-v budget** calculation for mission planning
- [ ] Export trajectory data to CSV for post-processing

---

## 📄 License

This project is released for academic and educational purposes. Feel free to use, modify, and extend it.
