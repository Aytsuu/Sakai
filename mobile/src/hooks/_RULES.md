# Mobile Hooks Rules

## Structure
- Store custom React hooks here. 
- All files and their exported functions should correctly be prefixed with `use` (e.g., `useTheme.ts`, `useColorScheme.ts`).

## Best Practices
- **Single Responsibility**: Keep hooks focused on a specific feature or domain. If a hook gets too complex, consider breaking it into smaller composable hooks.
- **Stable References**: Use `useMemo` for derived states and `useCallback` for returning functions, avoiding unnecessary cascading re-renders in consumer components.
- **Platform Separation**: If a hook utilizes platform APIs that differ majorly between web and native, split them into respective files (e.g., `use-color-scheme.ts` vs `use-color-scheme.web.ts`).
- **Data Fetching**: Hooks wrapping API calls should manage the entire lifecycle appropriately (`loading`, `error`, `data`) and preferably depend on robust async libraries (like React Query or SWR if configured).