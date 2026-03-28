# Mobile Screens Rules

## Structure
- Store large, feature-level screen components here.
- Organize screens into sub-folders based on user role, flow, or domain to keep features modular. 
  - **Example**: `driver/` (e.g., DriverMap, SessionSetup, Nudges)
  - **Example**: `commuter/` (e.g., Search, RouteSelect, LoadingZone, LiveMap)

## Relationship with `app/` (Expo Router)
- Keep Expo Router files inside `src/app/` as thin wrappers. The `app/` files should simply handle the route definition, URL parameters, and layout, and then import the actual heavy-lifting screen component from this `screens/` directory.

## Best Practices
- **Orchestrators**: Screens should act as orchestrators. They handle screen-level state, connect to context/stores, manage data fetching (via custom hooks), and pass data down to "dumb" UI components.
- **Component Composition**: Do not build massive, monolithic screen files. Compose the screen from smaller, reusable components imported from `src/components/`.
- **Role Separation**: Strictly separate the logic for completely different experiences. A `DriverMap` and a `LiveMap` (for commuters) might share a base map UI component from `src/components/`, but the specific business logic, markers, and socket connections for each role should be kept inside their respective `screens/driver/` and `screens/commuter/` components.