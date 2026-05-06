import { Inter } from "next/font/google";
import "./globals.css";
import { Providers } from "@/components/Providers";
import Navigation from "@/components/Navigation";
import Script from "next/script";

const inter = Inter({ subsets: ["latin"], variable: "--font-inter" });

export const metadata = {
    title: "Anuj Yadav | Product Manager & Builder",
    description: "Portfolio of Anuj Yadav, featuring projects in Flutter, AI, and Product Management.",
    openGraph: {
          title: "Anuj Yadav | Product Manager & Builder",
          description: "Portfolio of Anuj Yadav, featuring projects in Flutter, AI, and Product Management.",
          url: "https://portfolio-anuj-yadav.web.app/",
          siteName: "Anuj Yadav Portfolio",
          locale: "en_US",
          type: "website",
    },
    twitter: {
          card: "summary_large_image",
          title: "Anuj Yadav | Product Manager & Builder",
          description: "Portfolio of Anuj Yadav, featuring projects in Flutter, AI, and Product Management.",
    },
};

export const viewport = {
    width: "device-width",
    initialScale: 1,
    maximumScale: 1,
};

export default function RootLayout({ children }) {
    return (
          <html lang="en" suppressHydrationWarning>
            <body className={`${inter.variable} font-sans antialiased bg-background text-foreground`}>
        <Providers>
            <Navigation />
            <main className="min-h-screen flex flex-col">
{children}
  </main>
  </Providers>
        <Script
          id="microsoft-clarity"
          strategy="afterInteractive"
          dangerouslySetInnerHTML={{
                        __html: `(function(c,l,a,r,i,t,y){
                                c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
                                        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
                                                y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
                                                    })(window, document, "clarity", "script", "wmjopo3ev5");`,
          }}
        />
          </body>
          </html>
  );
}
