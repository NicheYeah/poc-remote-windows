# PoC - Remote Windows

This is a small "proof of concept" repo illustrating a potential way of handling spaceship windows in an upcoming NicheYeah game.

### Problem at hand
Genuinely simulating a moving ship with the crew independently moving in its interior is very hard or impossible to do with our current skill.
Physics of the interior might break once the ship moves.

### Solution
Use a plugin providing Portal-like portals that project a remote scene from one portal to another.
Using this approach, it's possible to have the ship be essentialy a stationary object somewhere on the map, while the spaceship windows are just projections from another place in the game world.
Portals accurately handle perspective and (as far as we know) don't incur too much of a runtime overhead.
<img width="2380" alt="image" src="https://github.com/user-attachments/assets/2e72088f-a68d-45e4-ae16-f9780b08e15d" />
