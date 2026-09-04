import "./globals.css";

export const metadata = {
  title: "Hostel Hisab",
  description: "Track hostel tiffin, milk, payments and custom daily records.",
  manifest: "/manifest.webmanifest",
};

export const viewport = {
  themeColor: "#2563eb",
  width: "device-width",
  initialScale: 1,
};

export default function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}