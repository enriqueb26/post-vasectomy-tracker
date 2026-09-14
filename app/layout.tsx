import type { Metadata, Viewport } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Post-Vasectomy Tracker", description: "A private follow-up tracker",
  manifest: "/manifest.webmanifest", appleWebApp: { capable: true, statusBarStyle: "black-translucent", title: "Tracker" },
  icons: { apple: "/icons/icon.svg", icon: "/icons/icon.svg" }
};
export const viewport: Viewport = { themeColor: "#101114", width: "device-width", initialScale: 1, viewportFit: "cover" };
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) { return <html lang="en"><body>{children}</body></html>; }
