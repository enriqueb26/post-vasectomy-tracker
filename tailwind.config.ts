import type { Config } from "tailwindcss";
export default { content: ["./app/**/*.{ts,tsx}", "./components/**/*.{ts,tsx}"], theme: { extend: { colors: { ink: "#101114", panel: "#1a1c21", muted: "#9599a4", accent: "#b8f05a" } } }, plugins: [] } satisfies Config;
