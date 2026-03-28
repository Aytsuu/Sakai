# Mobile Constants Rules

## Structure
- Store application-wide configuration values, theme definitions, structural limits, and static data here.
- Organize constants logically by domain (e.g., `theme.ts` for styling constants, `config.ts` for environment defaults, `layout.ts` for consistent spacing).

## Best Practices
- **No Magic Numbers**: Avoid hardcoding values like layout spacing, fixed animation timings, or color hex codes directly in components. Pull them from these constant files instead.
- **Typing**: Export constants as strictly typed variables or use `as const` so TypeScript can intelligently parse exact values throughout the app.
- **Theme Segregation**: Ensure that theme-related constants properly map out variables according to light and dark modes to be cleanly consumed by hooks.