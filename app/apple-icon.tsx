import { ImageResponse } from "next/og";

export const size = { width: 180, height: 180 };
export const contentType = "image/png";
export default function AppleIcon() {
  return new ImageResponse(<div style={{ width: "100%", height: "100%", display: "flex", alignItems: "center", justifyContent: "center", background: "#1a1c21", borderRadius: 38, color: "#101114", fontSize: 94, fontWeight: 700 }}><div style={{ width: 112, height: 112, display: "flex", alignItems: "center", justifyContent: "center", background: "#b8f05a", borderRadius: 56 }}>✓</div></div>, size);
}
