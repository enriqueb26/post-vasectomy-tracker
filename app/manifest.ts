import type { MetadataRoute } from "next";
export default function manifest(): MetadataRoute.Manifest {
  return { name: "Post-Vasectomy Tracker", short_name: "Tracker", description: "A private follow-up tracker", start_url: "/", display: "standalone", background_color: "#101114", theme_color: "#101114", icons: [{ src: "/icons/icon.svg", sizes: "any", type: "image/svg+xml", purpose: "maskable" }] };
}
