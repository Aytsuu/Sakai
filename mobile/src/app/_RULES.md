# Mobile App Router Rules

## Structure
- Use Expo Router file conventions (`_layout.tsx`, `index.tsx`, `+not-found.tsx`).
- Group routes logically using route groups `(group-name)` when they share a layout or need organizational separation without affecting the URL path.
- Keep the `app` directory focused purely on navigation, routing, and layout logic. Move complex business logic and heavy UI components to `src/components` or `src/hooks`.

## Navigation
- Use the `Link` component from `expo-router` for declarative navigation.
- Use the `useRouter` hook for imperative navigation within event handlers or effects.

## Platform Specifics
- Since this is a universal app (iOS, Android, Web), ensure page layouts adapt accordingly across mobile devices and web browsers.
- Use `.web.tsx` or `.native.tsx` file extensions if a screen requires completely different implementations based on the platform.