# Mobile Components Rules

## Structure
- Store reusable UI components here.
- Use `src/components/ui/` for base, primitive components (e.g., buttons, inputs).
- If a component requires multiple files (its own styles, types, specific hooks, or tests), encapsulate it within its own folder.

## Styling & Theming
- Build components to be responsive and adaptive to both light and dark themes using hooks like `useColorScheme` or `useTheme`.
- Prefer React Native `StyleSheet` or the established styling framework (like NativeWind/global CSS constraints) used in the project.
- Avoid inline styles as much as possible for better performance and maintainability.

## Best Practices
- **Dumb Components**: Keep most UI components pure and presentational. Pass data and callbacks in via props.
- **Platform Separation**: For components rendering significantly differently on Web vs Mobile, split the logic into separate files (e.g., `animated-icon.tsx` vs `animated-icon.web.tsx`).
- **Performance**: Minimize unnecessary re-renders. Use `React.memo` where large lists or complex visual trees are concerned.